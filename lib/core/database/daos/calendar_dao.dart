import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'calendar_dao.g.dart';

@DriftAccessor(tables: [CalendarEvents])
class CalendarDao extends DatabaseAccessor<AppDatabase> with _$CalendarDaoMixin {
  CalendarDao(super.db);

  Stream<List<CalendarEventRow>> watchBetween(DateTime start, DateTime end) {
    return (select(calendarEvents)
          ..where((e) => e.start.isSmallerThanValue(end) & e.end.isBiggerOrEqualValue(start))
          ..orderBy([(e) => OrderingTerm(expression: e.start)]))
        .watch();
  }

  Stream<List<CalendarEventRow>> watchUpcoming(DateTime from, {int limit = 5}) {
    return (select(calendarEvents)
          ..where((e) => e.start.isBiggerOrEqualValue(from))
          ..orderBy([(e) => OrderingTerm(expression: e.start)])
          ..limit(limit))
        .watch();
  }

  Future<void> upsert(CalendarEventsCompanion event) => into(calendarEvents).insertOnConflictUpdate(event);

  Future<void> insertAll(List<CalendarEventsCompanion> events) {
    return batch((b) => b.insertAll(calendarEvents, events));
  }

  Future<void> deleteById(String id) => (delete(calendarEvents)..where((e) => e.id.equals(id))).go();

  Future<List<CalendarEventRow>> getByGroupId(String groupId) {
    return (select(calendarEvents)..where((e) => e.recurrenceGroupId.equals(groupId))).get();
  }

  Future<void> deleteByGroupId(String groupId) {
    return (delete(calendarEvents)..where((e) => e.recurrenceGroupId.equals(groupId))).go();
  }
}
