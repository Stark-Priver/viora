import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'health_dao.g.dart';

@DriftAccessor(tables: [HealthLogs])
class HealthDao extends DatabaseAccessor<AppDatabase> with _$HealthDaoMixin {
  HealthDao(super.db);

  Stream<List<HealthLogRow>> watchRecent({int limit = 30}) {
    return (select(healthLogs)
          ..orderBy([(h) => OrderingTerm(expression: h.date, mode: OrderingMode.desc)])
          ..limit(limit))
        .watch();
  }

  Future<HealthLogRow?> logForDay(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(healthLogs)..where((h) => h.date.isBiggerOrEqualValue(start) & h.date.isSmallerThanValue(end))).getSingleOrNull();
  }

  Future<void> upsert(HealthLogsCompanion log) => into(healthLogs).insertOnConflictUpdate(log);

  Future<void> deleteById(String id) => (delete(healthLogs)..where((h) => h.id.equals(id))).go();
}
