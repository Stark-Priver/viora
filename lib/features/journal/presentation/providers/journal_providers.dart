import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/database/app_database.dart';

const _uuid = Uuid();

DateTime _dayStart(DateTime d) => DateTime(d.year, d.month, d.day);

final journalSelectedDayProvider = StateProvider<DateTime>((ref) => _dayStart(DateTime.now()));

final journalEntryForDayProvider = StreamProvider.autoDispose((ref) {
  final day = ref.watch(journalSelectedDayProvider);
  return ref.watch(databaseProvider).journalDao.watchByDate(day);
});

final journalHistoryProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).journalDao.watchAll();
});

final journalActionsProvider = Provider((ref) => JournalActions(ref));

class JournalActions {
  JournalActions(this.ref);
  final Ref ref;

  Future<void> save({
    required DateTime day,
    String? existingId,
    String? win,
    String? problem,
    String? lesson,
    String? gratitude,
    String? priorityTomorrow,
    String? notes,
  }) {
    return ref.read(databaseProvider).journalDao.upsert(
          JournalEntriesCompanion(
            id: Value(existingId ?? _uuid.v4()),
            date: Value(_dayStart(day)),
            win: Value(win),
            problem: Value(problem),
            lesson: Value(lesson),
            gratitude: Value(gratitude),
            priorityTomorrow: Value(priorityTomorrow),
            notes: Value(notes),
            updatedAt: Value(DateTime.now()),
          ),
        );
  }
}
