import 'dart:async';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/tasks_dao.dart';
import '../../../../core/services/feedback_service.dart';
import '../../../../core/services/home_widget_service.dart';

const _uuid = Uuid();

enum TaskFilter { active, completed, all }

final taskFilterProvider = StateProvider<TaskFilter>((ref) => TaskFilter.active);

final allTasksStreamProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).tasksDao.watchAll();
});

final tasksStreamProvider = StreamProvider.autoDispose((ref) {
  final dao = ref.watch(databaseProvider).tasksDao;
  final filter = ref.watch(taskFilterProvider);
  switch (filter) {
    case TaskFilter.active:
      return dao.watchActive();
    case TaskFilter.completed:
      return dao.watchAll().map((rows) => rows.where((t) => t.status == TaskStatuses.completed).toList());
    case TaskFilter.all:
      return dao.watchAll();
  }
});

class TaskDraft {
  TaskDraft({
    required this.title,
    this.priority = TaskPriorities.normal,
    this.domain,
    this.deadline,
    this.plannedMinutes,
  });

  final String title;
  final String priority;
  final String? domain;
  final DateTime? deadline;
  final int? plannedMinutes;
}

final tasksActionsProvider = Provider((ref) => TasksActions(ref));

class TasksActions {
  TasksActions(this.ref);
  final Ref ref;

  Future<void> add(TaskDraft draft) async {
    final db = ref.read(databaseProvider);
    await db.tasksDao.upsert(
      TasksCompanion.insert(
        id: _uuid.v4(),
        title: draft.title,
        priority: Value(draft.priority),
        domain: Value(draft.domain),
        deadline: Value(draft.deadline),
        plannedMinutes: Value(draft.plannedMinutes),
        status: const Value(TaskStatuses.planned),
      ),
    );
    unawaited(HomeWidgetService.refresh(db));
  }

  Future<void> setStatus(String id, String status) async {
    final db = ref.read(databaseProvider);
    await db.tasksDao.setStatus(id, status);
    if (status == TaskStatuses.completed) {
      unawaited(FeedbackService.instance.celebrate());
    }
    unawaited(HomeWidgetService.refresh(db));
  }

  Future<void> delete(String id) async {
    final db = ref.read(databaseProvider);
    await db.tasksDao.deleteById(id);
    unawaited(HomeWidgetService.refresh(db));
    unawaited(FeedbackService.instance.dismiss());
  }
}
