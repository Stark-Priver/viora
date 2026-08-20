// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_dao.dart';

// ignore_for_file: type=lint
mixin _$CareerDaoMixin on DatabaseAccessor<AppDatabase> {
  $CareerPositionsTable get careerPositions => attachedDatabase.careerPositions;
  $CareerAchievementsTable get careerAchievements =>
      attachedDatabase.careerAchievements;
  CareerDaoManager get managers => CareerDaoManager(this);
}

class CareerDaoManager {
  final _$CareerDaoMixin _db;
  CareerDaoManager(this._db);
  $$CareerPositionsTableTableManager get careerPositions =>
      $$CareerPositionsTableTableManager(
          _db.attachedDatabase, _db.careerPositions);
  $$CareerAchievementsTableTableManager get careerAchievements =>
      $$CareerAchievementsTableTableManager(
          _db.attachedDatabase, _db.careerAchievements);
}
