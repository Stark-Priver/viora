import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'habits_dao.g.dart';

class HabitTypes {
  HabitTypes._();
  static const binary = 'binary';
  static const quantitative = 'quantitative';
}

@DriftAccessor(tables: [Habits, HabitLogs])
class HabitsDao extends DatabaseAccessor<AppDatabase> with _$HabitsDaoMixin {
  HabitsDao(super.db);

  Stream<List<HabitRow>> watchActive() {
    return (select(habits)..where((h) => h.archived.equals(false))).watch();
  }

  Future<void> upsert(HabitsCompanion habit) => into(habits).insertOnConflictUpdate(habit);

  Future<void> archive(String id) {
    return (update(habits)..where((h) => h.id.equals(id))).write(const HabitsCompanion(archived: Value(true)));
  }

  Stream<List<HabitLogRow>> watchLogsBetween(DateTime start, DateTime end) {
    return (select(habitLogs)
          ..where((l) => l.date.isBiggerOrEqualValue(start) & l.date.isSmallerThanValue(end)))
        .watch();
  }

  Future<void> upsertLog(HabitLogsCompanion log) => into(habitLogs).insertOnConflictUpdate(log);

  Future<HabitLogRow?> logForDay(String habitId, DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(habitLogs)
          ..where((l) => l.habitId.equals(habitId) & l.date.isBiggerOrEqualValue(start) & l.date.isSmallerThanValue(end)))
        .getSingleOrNull();
  }
}
