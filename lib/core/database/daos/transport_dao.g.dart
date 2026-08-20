// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_dao.dart';

// ignore_for_file: type=lint
mixin _$TransportDaoMixin on DatabaseAccessor<AppDatabase> {
  $VehiclesTable get vehicles => attachedDatabase.vehicles;
  $VehicleFuelLogsTable get vehicleFuelLogs => attachedDatabase.vehicleFuelLogs;
  $VehicleMaintenanceLogsTable get vehicleMaintenanceLogs =>
      attachedDatabase.vehicleMaintenanceLogs;
  TransportDaoManager get managers => TransportDaoManager(this);
}

class TransportDaoManager {
  final _$TransportDaoMixin _db;
  TransportDaoManager(this._db);
  $$VehiclesTableTableManager get vehicles =>
      $$VehiclesTableTableManager(_db.attachedDatabase, _db.vehicles);
  $$VehicleFuelLogsTableTableManager get vehicleFuelLogs =>
      $$VehicleFuelLogsTableTableManager(
          _db.attachedDatabase, _db.vehicleFuelLogs);
  $$VehicleMaintenanceLogsTableTableManager get vehicleMaintenanceLogs =>
      $$VehicleMaintenanceLogsTableTableManager(
          _db.attachedDatabase, _db.vehicleMaintenanceLogs);
}
