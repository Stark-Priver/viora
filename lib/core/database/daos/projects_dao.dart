import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'projects_dao.g.dart';

class ProjectStatuses {
  ProjectStatuses._();
  static const active = 'active';
  static const onHold = 'on_hold';
  static const completed = 'completed';
  static const cancelled = 'cancelled';
  static const all = [active, onHold, completed, cancelled];
}

@DriftAccessor(tables: [Projects])
class ProjectsDao extends DatabaseAccessor<AppDatabase> with _$ProjectsDaoMixin {
  ProjectsDao(super.db);

  Stream<List<ProjectRow>> watchAll() {
    return (select(projects)
          ..orderBy([(p) => OrderingTerm(expression: p.createdAt, mode: OrderingMode.desc)]))
        .watch();
  }

  Future<void> upsert(ProjectsCompanion project) => into(projects).insertOnConflictUpdate(project);

  Future<void> setStatus(String id, String status) {
    return (update(projects)..where((p) => p.id.equals(id))).write(
      ProjectsCompanion(status: Value(status), updatedAt: Value(DateTime.now())),
    );
  }

  Future<void> deleteById(String id) => (delete(projects)..where((p) => p.id.equals(id))).go();
}
