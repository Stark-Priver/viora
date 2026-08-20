import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/database/app_database.dart';

const _uuid = Uuid();

final studySessionsProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).educationDao.watchAll();
});

class StudySessionDraft {
  StudySessionDraft({required this.subject, this.topic, required this.minutes});
  final String subject;
  final String? topic;
  final int minutes;
}

final educationActionsProvider = Provider((ref) => EducationActions(ref));

class EducationActions {
  EducationActions(this.ref);
  final Ref ref;

  Future<void> add(StudySessionDraft draft) {
    return ref.read(databaseProvider).educationDao.upsert(
          StudySessionsCompanion.insert(id: _uuid.v4(), subject: draft.subject, topic: Value(draft.topic), minutes: draft.minutes),
        );
  }

  Future<void> delete(String id) => ref.read(databaseProvider).educationDao.deleteById(id);
}
