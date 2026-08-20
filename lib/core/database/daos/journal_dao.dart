import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'journal_dao.g.dart';

@DriftAccessor(tables: [JournalEntries])
class JournalDao extends DatabaseAccessor<AppDatabase> with _$JournalDaoMixin {
  JournalDao(super.db);

  Stream<List<JournalEntryRow>> watchAll() {
    return (select(journalEntries)
          ..orderBy([(j) => OrderingTerm(expression: j.date, mode: OrderingMode.desc)]))
        .watch();
  }

  Stream<JournalEntryRow?> watchByDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(journalEntries)
          ..where((j) => j.date.isBiggerOrEqualValue(start) & j.date.isSmallerThanValue(end)))
        .watchSingleOrNull();
  }

  Future<void> upsert(JournalEntriesCompanion entry) => into(journalEntries).insertOnConflictUpdate(entry);
}
