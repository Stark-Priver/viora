import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/database/app_database.dart';

const _uuid = Uuid();

final vehiclesProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).transportDao.watchVehicles();
});

final selectedVehicleIdProvider = StateProvider<String?>((ref) => null);

final fuelLogsProvider = StreamProvider.autoDispose<List<VehicleFuelLogRow>>((ref) {
  final vehicleId = ref.watch(selectedVehicleIdProvider);
  if (vehicleId == null) return Stream.value(const []);
  return ref.watch(databaseProvider).transportDao.watchFuelLogs(vehicleId);
});

final maintenanceLogsProvider = StreamProvider.autoDispose<List<VehicleMaintenanceRow>>((ref) {
  final vehicleId = ref.watch(selectedVehicleIdProvider);
  if (vehicleId == null) return Stream.value(const []);
  return ref.watch(databaseProvider).transportDao.watchMaintenance(vehicleId);
});

final transportActionsProvider = Provider((ref) => TransportActions(ref));

class TransportActions {
  TransportActions(this.ref);
  final Ref ref;

  Future<void> addVehicle({required String name, required String type}) {
    return ref.read(databaseProvider).transportDao.upsertVehicle(
          VehiclesCompanion.insert(id: _uuid.v4(), name: name, type: Value(type)),
        );
  }

  Future<void> logFuel({required String vehicleId, required double litres, required double cost, double? odometerKm}) {
    return ref.read(databaseProvider).transportDao.insertFuelLog(
          VehicleFuelLogsCompanion.insert(id: _uuid.v4(), vehicleId: vehicleId, litres: litres, cost: cost, odometerKm: Value(odometerKm)),
        );
  }

  Future<void> logMaintenance({required String vehicleId, required String type, double? cost, String? notes}) {
    return ref.read(databaseProvider).transportDao.insertMaintenance(
          VehicleMaintenanceLogsCompanion.insert(id: _uuid.v4(), vehicleId: vehicleId, type: type, cost: Value(cost), notes: Value(notes)),
        );
  }
}
