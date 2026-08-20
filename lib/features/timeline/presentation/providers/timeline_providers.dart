import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/database/daos/tasks_dao.dart';
import '../../../../core/database/daos/money_dao.dart';
import '../../../../features/tasks/presentation/providers/tasks_providers.dart';
import '../../../../features/focus/presentation/providers/focus_providers.dart';
import '../../../../features/money/presentation/providers/money_providers.dart';
import '../../domain/timeline_entry.dart';

DateTime _dayStart(DateTime d) => DateTime(d.year, d.month, d.day);

final timelineSelectedDayProvider = StateProvider<DateTime>((ref) => _dayStart(DateTime.now()));

/// Calendar events, habit logs, and the journal entry are watched directly
/// against the DB for the selected day — deliberately *not* reusing the
/// Calendar/Journal features' own "selected day" providers, so browsing the
/// timeline never moves what day those other screens have selected.
final _timelineCalendarEventsProvider = StreamProvider.autoDispose((ref) {
  final day = ref.watch(timelineSelectedDayProvider);
  return ref.watch(databaseProvider).calendarDao.watchBetween(day, day.add(const Duration(days: 1)));
});

final _timelineHabitLogsProvider = StreamProvider.autoDispose((ref) {
  final day = ref.watch(timelineSelectedDayProvider);
  return ref.watch(databaseProvider).habitsDao.watchLogsBetween(day, day.add(const Duration(days: 1)));
});

final _timelineJournalProvider = StreamProvider.autoDispose((ref) {
  final day = ref.watch(timelineSelectedDayProvider);
  return ref.watch(databaseProvider).journalDao.watchByDate(day);
});

bool _onDay(DateTime t, DateTime day) => t.year == day.year && t.month == day.month && t.day == day.day;

/// Merges every source above into one sorted list. Recomputes automatically
/// whenever any underlying stream emits, since it's built entirely from
/// `ref.watch` on other providers rather than a one-shot fetch.
final timelineEntriesProvider = Provider.autoDispose<List<TimelineEntry>>((ref) {
  final day = ref.watch(timelineSelectedDayProvider);
  final entries = <TimelineEntry>[];

  final tasks = ref.watch(allTasksStreamProvider).valueOrNull ?? const [];
  for (final t in tasks) {
    if (t.status == TaskStatuses.completed && _onDay(t.updatedAt, day)) {
      entries.add(TimelineEntry(time: t.updatedAt, title: t.title, subtitle: 'Task completed', kind: TimelineKind.task));
    }
  }

  final sessions = ref.watch(recentSessionsProvider).valueOrNull ?? const [];
  for (final s in sessions) {
    if (_onDay(s.startedAt, day)) {
      final label = s.focusedMinutes != null ? '${s.focusedMinutes}m focused' : 'In progress';
      entries.add(TimelineEntry(time: s.startedAt, title: s.title, subtitle: label, kind: TimelineKind.focus));
    }
  }

  final transactions = ref.watch(transactionsStreamProvider).valueOrNull ?? const [];
  for (final tx in transactions) {
    if (_onDay(tx.occurredAt, day)) {
      final kind = tx.type == TransactionTypes.income ? TimelineKind.transactionIncome : TimelineKind.transactionExpense;
      entries.add(TimelineEntry(time: tx.occurredAt, title: tx.category ?? tx.type, subtitle: tx.amount.toStringAsFixed(0), kind: kind));
    }
  }

  final events = ref.watch(_timelineCalendarEventsProvider).valueOrNull ?? const [];
  for (final e in events) {
    entries.add(TimelineEntry(time: e.start, title: e.title, subtitle: e.domain, kind: TimelineKind.calendarEvent));
  }

  final habitLogs = ref.watch(_timelineHabitLogsProvider).valueOrNull ?? const [];
  for (final l in habitLogs) {
    if (l.completed) {
      entries.add(TimelineEntry(time: l.createdAt, title: 'Habit logged', subtitle: l.amount?.toStringAsFixed(0), kind: TimelineKind.habit));
    }
  }

  final journal = ref.watch(_timelineJournalProvider).valueOrNull;
  if (journal != null) {
    entries.add(TimelineEntry(time: journal.updatedAt, title: 'Journal entry', subtitle: journal.win, kind: TimelineKind.journal));
  }

  entries.sort((a, b) => a.time.compareTo(b.time));
  return entries;
});
