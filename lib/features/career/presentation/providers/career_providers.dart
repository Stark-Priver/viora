import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/database/app_database.dart';

const _uuid = Uuid();

final careerPositionsProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).careerDao.watchPositions();
});

final careerAchievementsProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).careerDao.watchAchievements();
});

class PositionDraft {
  PositionDraft({required this.employer, required this.role, required this.startDate, this.salary});
  final String employer;
  final String role;
  final DateTime startDate;
  final double? salary;
}

class AchievementDraft {
  AchievementDraft({required this.title, this.description});
  final String title;
  final String? description;
}

final careerActionsProvider = Provider((ref) => CareerActions(ref));

class CareerActions {
  CareerActions(this.ref);
  final Ref ref;

  Future<void> addPosition(PositionDraft draft) {
    return ref.read(databaseProvider).careerDao.upsertPosition(
          CareerPositionsCompanion.insert(id: _uuid.v4(), employer: draft.employer, role: draft.role, startDate: draft.startDate, salary: Value(draft.salary)),
        );
  }

  Future<void> deletePosition(String id) => ref.read(databaseProvider).careerDao.deletePosition(id);

  Future<void> addAchievement(AchievementDraft draft) {
    return ref.read(databaseProvider).careerDao.upsertAchievement(
          CareerAchievementsCompanion.insert(id: _uuid.v4(), title: draft.title, description: Value(draft.description)),
        );
  }

  Future<void> deleteAchievement(String id) => ref.read(databaseProvider).careerDao.deleteAchievement(id);
}
