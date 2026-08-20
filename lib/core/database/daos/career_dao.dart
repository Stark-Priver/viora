import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'career_dao.g.dart';

@DriftAccessor(tables: [CareerPositions, CareerAchievements])
class CareerDao extends DatabaseAccessor<AppDatabase> with _$CareerDaoMixin {
  CareerDao(super.db);

  Stream<List<CareerPositionRow>> watchPositions() {
    return (select(careerPositions)..orderBy([(p) => OrderingTerm(expression: p.startDate, mode: OrderingMode.desc)])).watch();
  }

  Future<void> upsertPosition(CareerPositionsCompanion position) => into(careerPositions).insertOnConflictUpdate(position);

  Future<void> deletePosition(String id) => (delete(careerPositions)..where((p) => p.id.equals(id))).go();

  Stream<List<CareerAchievementRow>> watchAchievements() {
    return (select(careerAchievements)..orderBy([(a) => OrderingTerm(expression: a.date, mode: OrderingMode.desc)])).watch();
  }

  Future<void> upsertAchievement(CareerAchievementsCompanion achievement) => into(careerAchievements).insertOnConflictUpdate(achievement);

  Future<void> deleteAchievement(String id) => (delete(careerAchievements)..where((a) => a.id.equals(id))).go();
}
