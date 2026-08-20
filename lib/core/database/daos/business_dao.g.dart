// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_dao.dart';

// ignore_for_file: type=lint
mixin _$BusinessDaoMixin on DatabaseAccessor<AppDatabase> {
  $BusinessClientsTable get businessClients => attachedDatabase.businessClients;
  $BusinessProjectsTable get businessProjects =>
      attachedDatabase.businessProjects;
  BusinessDaoManager get managers => BusinessDaoManager(this);
}

class BusinessDaoManager {
  final _$BusinessDaoMixin _db;
  BusinessDaoManager(this._db);
  $$BusinessClientsTableTableManager get businessClients =>
      $$BusinessClientsTableTableManager(
          _db.attachedDatabase, _db.businessClients);
  $$BusinessProjectsTableTableManager get businessProjects =>
      $$BusinessProjectsTableTableManager(
          _db.attachedDatabase, _db.businessProjects);
}
