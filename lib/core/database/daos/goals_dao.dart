import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'goals_dao.g.dart';

@DriftAccessor(tables: [Goals, GoalProgressEntries])
class GoalsDao extends DatabaseAccessor<AppDatabase> with _$GoalsDaoMixin {
  GoalsDao(super.db);

  Stream<List<GoalRow>> watchAll() {
    return (select(goals)
          ..orderBy([(g) => OrderingTerm(expression: g.createdAt, mode: OrderingMode.desc)]))
        .watch();
  }

  Future<void> upsert(GoalsCompanion goal) => into(goals).insertOnConflictUpdate(goal);

  Future<void> deleteById(String id) => (delete(goals)..where((g) => g.id.equals(id))).go();

  Stream<List<GoalProgressRow>> watchProgress(String goalId) {
    return (select(goalProgressEntries)
          ..where((p) => p.goalId.equals(goalId))
          ..orderBy([(p) => OrderingTerm(expression: p.loggedAt, mode: OrderingMode.desc)]))
        .watch();
  }

  /// Logs a contribution and bumps the goal's cached [Goals.currentValue] in
  /// one transaction so list views don't need to sum progress on every read.
  Future<void> logProgress({required String goalId, required double amount, String? note}) {
    return transaction(() async {
      await into(goalProgressEntries).insert(
        GoalProgressEntriesCompanion.insert(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          goalId: goalId,
          amount: amount,
          note: Value(note),
        ),
      );
      final goal = await (select(goals)..where((g) => g.id.equals(goalId))).getSingle();
      await (update(goals)..where((g) => g.id.equals(goalId))).write(
        GoalsCompanion(currentValue: Value(goal.currentValue + amount), updatedAt: Value(DateTime.now())),
      );
    });
  }
}
