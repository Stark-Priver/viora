import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'transport_dao.g.dart';

@DriftAccessor(tables: [Vehicles, VehicleFuelLogs, VehicleMaintenanceLogs])
class TransportDao extends DatabaseAccessor<AppDatabase> with _$TransportDaoMixin {
  TransportDao(super.db);

  Stream<List<VehicleRow>> watchVehicles() => select(vehicles).watch();

  Future<void> upsertVehicle(VehiclesCompanion vehicle) => into(vehicles).insertOnConflictUpdate(vehicle);

  Future<void> deleteVehicle(String id) => (delete(vehicles)..where((v) => v.id.equals(id))).go();

  Stream<List<VehicleFuelLogRow>> watchFuelLogs(String vehicleId) {
    return (select(vehicleFuelLogs)
          ..where((f) => f.vehicleId.equals(vehicleId))
          ..orderBy([(f) => OrderingTerm(expression: f.date, mode: OrderingMode.desc)]))
        .watch();
  }

  Future<void> insertFuelLog(VehicleFuelLogsCompanion log) => into(vehicleFuelLogs).insert(log);

  Stream<List<VehicleMaintenanceRow>> watchMaintenance(String vehicleId) {
    return (select(vehicleMaintenanceLogs)
          ..where((m) => m.vehicleId.equals(vehicleId))
          ..orderBy([(m) => OrderingTerm(expression: m.date, mode: OrderingMode.desc)]))
        .watch();
  }

  Future<void> insertMaintenance(VehicleMaintenanceLogsCompanion log) => into(vehicleMaintenanceLogs).insert(log);
}
