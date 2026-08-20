import 'dart:async';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/services/feedback_service.dart';

const _uuid = Uuid();

final habitsStreamProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).habitsDao.watchActive();
});

/// Logs for the trailing 7 days (today inclusive), keyed by habitId+day so
/// the UI can render a week strip without N separate queries.
final habitLogsStreamProvider = StreamProvider.autoDispose((ref) {
  final today = DateTime.now();
  final start = DateTime(today.year, today.month, today.day).subtract(const Duration(days: 6));
  final end = DateTime(today.year, today.month, today.day).add(const Duration(days: 1));
  return ref.watch(databaseProvider).habitsDao.watchLogsBetween(start, end);
});

final habitsActionsProvider = Provider((ref) => HabitsActions(ref));

class HabitsActions {
  HabitsActions(this.ref);
  final Ref ref;

  Future<void> add({required String title, required String type, String? unit}) {
    return ref.read(databaseProvider).habitsDao.upsert(
          HabitsCompanion.insert(id: _uuid.v4(), title: title, type: Value(type), unit: Value(unit)),
        );
  }

  Future<void> archive(String id) async {
    await ref.read(databaseProvider).habitsDao.archive(id);
    await FeedbackService.instance.dismiss();
  }

  Future<void> toggleToday(String habitId) async {
    final dao = ref.read(databaseProvider).habitsDao;
    final today = DateTime.now();
    final existing = await dao.logForDay(habitId, today);
    final nowCompleted = !(existing?.completed ?? false);
    await dao.upsertLog(
      HabitLogsCompanion(
        id: Value(existing?.id ?? _uuid.v4()),
        habitId: Value(habitId),
        date: Value(DateTime(today.year, today.month, today.day)),
        completed: Value(nowCompleted),
      ),
    );
    if (nowCompleted) {
      unawaited(FeedbackService.instance.celebrate());
    }
  }

  Future<void> logAmount(String habitId, double amount) async {
    final dao = ref.read(databaseProvider).habitsDao;
    final today = DateTime.now();
    final existing = await dao.logForDay(habitId, today);
    await dao.upsertLog(
      HabitLogsCompanion(
        id: Value(existing?.id ?? _uuid.v4()),
        habitId: Value(habitId),
        date: Value(DateTime(today.year, today.month, today.day)),
        completed: const Value(true),
        amount: Value(amount),
      ),
    );
    unawaited(FeedbackService.instance.celebrate());
  }
}
