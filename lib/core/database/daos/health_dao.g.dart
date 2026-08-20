// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_dao.dart';

// ignore_for_file: type=lint
mixin _$HealthDaoMixin on DatabaseAccessor<AppDatabase> {
  $HealthLogsTable get healthLogs => attachedDatabase.healthLogs;
  HealthDaoManager get managers => HealthDaoManager(this);
}

class HealthDaoManager {
  final _$HealthDaoMixin _db;
  HealthDaoManager(this._db);
  $$HealthLogsTableTableManager get healthLogs =>
      $$HealthLogsTableTableManager(_db.attachedDatabase, _db.healthLogs);
}
