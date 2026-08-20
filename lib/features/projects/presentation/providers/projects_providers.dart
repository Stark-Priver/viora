import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/services/feedback_service.dart';

const _uuid = Uuid();

final projectsStreamProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).projectsDao.watchAll();
});

class ProjectDraft {
  ProjectDraft({required this.name, this.description, this.budget});
  final String name;
  final String? description;
  final double? budget;
}

final projectsActionsProvider = Provider((ref) => ProjectsActions(ref));

class ProjectsActions {
  ProjectsActions(this.ref);
  final Ref ref;

  Future<void> add(ProjectDraft draft) {
    return ref.read(databaseProvider).projectsDao.upsert(
          ProjectsCompanion.insert(
            id: _uuid.v4(),
            name: draft.name,
            description: Value(draft.description),
            budget: Value(draft.budget),
          ),
        );
  }

  Future<void> setStatus(String id, String status) => ref.read(databaseProvider).projectsDao.setStatus(id, status);

  Future<void> delete(String id) async {
    await ref.read(databaseProvider).projectsDao.deleteById(id);
    await FeedbackService.instance.dismiss();
  }
}
