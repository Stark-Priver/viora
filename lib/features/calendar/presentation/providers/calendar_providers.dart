import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/tables.dart';
import '../../../../core/services/notification_service.dart';
import '../../../../core/services/feedback_service.dart';

const _uuid = Uuid();

DateTime _dayStart(DateTime d) => DateTime(d.year, d.month, d.day);

enum CalendarViewMode { day, week, month }

final calendarViewModeProvider = StateProvider<CalendarViewMode>((ref) => CalendarViewMode.day);

final selectedDayProvider = StateProvider<DateTime>((ref) => _dayStart(DateTime.now()));

final dayEventsStreamProvider = StreamProvider.autoDispose((ref) {
  final day = ref.watch(selectedDayProvider);
  return ref.watch(databaseProvider).calendarDao.watchBetween(day, day.add(const Duration(days: 1)));
});

/// Monday-start week containing [selectedDayProvider].
final weekEventsStreamProvider = StreamProvider.autoDispose((ref) {
  final day = ref.watch(selectedDayProvider);
  final weekStart = day.subtract(Duration(days: day.weekday - 1));
  return ref.watch(databaseProvider).calendarDao.watchBetween(weekStart, weekStart.add(const Duration(days: 7)));
});

/// Full calendar-grid month (including the lead/trail days from adjacent
/// months that a 6-row grid shows) containing [selectedDayProvider].
final monthEventsStreamProvider = StreamProvider.autoDispose((ref) {
  final day = ref.watch(selectedDayProvider);
  final firstOfMonth = DateTime(day.year, day.month, 1);
  final gridStart = firstOfMonth.subtract(Duration(days: firstOfMonth.weekday - 1));
  final gridEnd = gridStart.add(const Duration(days: 42));
  return ref.watch(databaseProvider).calendarDao.watchBetween(gridStart, gridEnd);
});

class EventDraft {
  EventDraft({
    required this.title,
    required this.start,
    required this.end,
    this.domain = LifeDomains.personal,
    this.recurrence = RecurrenceRules.none,
    this.reminderMinutesBefore,
  });

  final String title;
  final DateTime start;
  final DateTime end;
  final String domain;
  final String recurrence;
  final int? reminderMinutesBefore;
}

final calendarActionsProvider = Provider((ref) => CalendarActions(ref));

class CalendarActions {
  CalendarActions(this.ref);
  final Ref ref;

  Duration _step(String recurrence) => switch (recurrence) {
        RecurrenceRules.daily => const Duration(days: 1),
        RecurrenceRules.weekly => const Duration(days: 7),
        _ => const Duration(days: 30), // monthly: approximate, good enough for a generated occurrence window
      };

  Future<void> add(EventDraft draft) async {
    final dao = ref.read(databaseProvider).calendarDao;
    final isRecurring = draft.recurrence != RecurrenceRules.none;
    final occurrenceCount = isRecurring ? 12 : 1;
    final groupId = isRecurring ? _uuid.v4() : null;
    final step = _step(draft.recurrence);
    final duration = draft.end.difference(draft.start);

    final rows = <CalendarEventsCompanion>[];
    for (var i = 0; i < occurrenceCount; i++) {
      final start = draft.start.add(step * i);
      final end = start.add(duration);
      final id = _uuid.v4();

      int? notificationId;
      if (draft.reminderMinutesBefore != null) {
        final remindAt = start.subtract(Duration(minutes: draft.reminderMinutesBefore!));
        notificationId = id.hashCode & 0x7fffffff;
        await NotificationService.instance.scheduleReminder(
          id: notificationId,
          title: draft.title,
          body: 'Starting in ${draft.reminderMinutesBefore} min',
          when: remindAt,
        );
      }

      rows.add(
        CalendarEventsCompanion.insert(
          id: id,
          title: draft.title,
          start: start,
          end: end,
          domain: Value(draft.domain),
          recurrence: Value(draft.recurrence),
          recurrenceGroupId: Value(groupId),
          reminderMinutesBefore: Value(draft.reminderMinutesBefore),
          notificationId: Value(notificationId),
        ),
      );
    }

    if (rows.length == 1) {
      await dao.upsert(rows.single);
    } else {
      await dao.insertAll(rows);
    }
  }

  Future<void> delete(CalendarEventRow event) async {
    if (event.notificationId != null) {
      await NotificationService.instance.cancel(event.notificationId!);
    }
    await ref.read(databaseProvider).calendarDao.deleteById(event.id);
    await FeedbackService.instance.dismiss();
  }

  Future<void> deleteSeries(String groupId) async {
    final dao = ref.read(databaseProvider).calendarDao;
    final rows = await dao.getByGroupId(groupId);
    for (final row in rows) {
      if (row.notificationId != null) {
        await NotificationService.instance.cancel(row.notificationId!);
      }
    }
    await dao.deleteByGroupId(groupId);
    await FeedbackService.instance.dismiss();
  }
}
