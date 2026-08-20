import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'tasks_dao.g.dart';

class TaskStatuses {
  TaskStatuses._();
  static const inbox = 'inbox';
  static const planned = 'planned';
  static const inProgress = 'in_progress';
  static const waiting = 'waiting';
  static const blocked = 'blocked';
  static const completed = 'completed';
  static const cancelled = 'cancelled';

  static const active = [inbox, planned, inProgress, waiting, blocked];
  static const all = [inbox, planned, inProgress, waiting, blocked, completed, cancelled];
}

class TaskPriorities {
  TaskPriorities._();
  static const low = 'low';
  static const normal = 'normal';
  static const high = 'high';
  static const urgent = 'urgent';
  static const all = [low, normal, high, urgent];
}

@DriftAccessor(tables: [Tasks])
class TasksDao extends DatabaseAccessor<AppDatabase> with _$TasksDaoMixin {
  TasksDao(super.db);

  Stream<List<TaskRow>> watchAll() {
    return (select(tasks)
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)]))
        .watch();
  }

  Stream<List<TaskRow>> watchActive() {
    return (select(tasks)
          ..where((t) => t.status.isIn(TaskStatuses.active))
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)]))
        .watch();
  }

  Future<void> upsert(TasksCompanion task) => into(tasks).insertOnConflictUpdate(task);

  Future<void> setStatus(String id, String status) {
    return (update(tasks)..where((t) => t.id.equals(id))).write(
      TasksCompanion(status: Value(status), updatedAt: Value(DateTime.now())),
    );
  }

  Future<void> deleteById(String id) => (delete(tasks)..where((t) => t.id.equals(id))).go();
}
