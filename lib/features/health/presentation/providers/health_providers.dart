import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/database/app_database.dart';

const _uuid = Uuid();

DateTime _dayStart(DateTime d) => DateTime(d.year, d.month, d.day);

final healthSelectedDayProvider = StateProvider<DateTime>((ref) => _dayStart(DateTime.now()));

final healthLogForDayProvider = FutureProvider.autoDispose((ref) {
  final day = ref.watch(healthSelectedDayProvider);
  return ref.watch(databaseProvider).healthDao.logForDay(day);
});

final healthHistoryProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).healthDao.watchRecent();
});

final healthActionsProvider = Provider((ref) => HealthActions(ref));

class HealthActions {
  HealthActions(this.ref);
  final Ref ref;

  Future<void> save({
    required DateTime day,
    String? existingId,
    int? sleepMinutes,
    double? weightKg,
    int? waterMl,
    int? mood,
    int? energy,
    String? notes,
  }) {
    return ref.read(databaseProvider).healthDao.upsert(
          HealthLogsCompanion(
            id: Value(existingId ?? _uuid.v4()),
            date: Value(_dayStart(day)),
            sleepMinutes: Value(sleepMinutes),
            weightKg: Value(weightKg),
            waterMl: Value(waterMl),
            mood: Value(mood),
            energy: Value(energy),
            notes: Value(notes),
          ),
        );
  }
}
