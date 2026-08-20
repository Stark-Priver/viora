import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/services/feedback_service.dart';

const _uuid = Uuid();

final goalsStreamProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).goalsDao.watchAll();
});

class GoalDraft {
  GoalDraft({required this.title, this.targetValue, this.unit, this.domain, this.deadline});
  final String title;
  final double? targetValue;
  final String? unit;
  final String? domain;
  final DateTime? deadline;
}

final goalsActionsProvider = Provider((ref) => GoalsActions(ref));

class GoalsActions {
  GoalsActions(this.ref);
  final Ref ref;

  Future<void> add(GoalDraft draft) {
    return ref.read(databaseProvider).goalsDao.upsert(
          GoalsCompanion.insert(
            id: _uuid.v4(),
            title: draft.title,
            targetValue: Value(draft.targetValue),
            unit: Value(draft.unit),
            domain: Value(draft.domain),
            deadline: Value(draft.deadline),
          ),
        );
  }

  Future<void> logProgress(String goalId, double amount) async {
    await ref.read(databaseProvider).goalsDao.logProgress(goalId: goalId, amount: amount);
    await FeedbackService.instance.tick();
  }

  Future<void> delete(String id) => ref.read(databaseProvider).goalsDao.deleteById(id);
}
