// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_dao.dart';

// ignore_for_file: type=lint
mixin _$EducationDaoMixin on DatabaseAccessor<AppDatabase> {
  $StudySessionsTable get studySessions => attachedDatabase.studySessions;
  EducationDaoManager get managers => EducationDaoManager(this);
}

class EducationDaoManager {
  final _$EducationDaoMixin _db;
  EducationDaoManager(this._db);
  $$StudySessionsTableTableManager get studySessions =>
      $$StudySessionsTableTableManager(_db.attachedDatabase, _db.studySessions);
}
