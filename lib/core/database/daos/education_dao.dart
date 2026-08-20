import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'education_dao.g.dart';

@DriftAccessor(tables: [StudySessions])
class EducationDao extends DatabaseAccessor<AppDatabase> with _$EducationDaoMixin {
  EducationDao(super.db);

  Stream<List<StudySessionRow>> watchAll({int limit = 100}) {
    return (select(studySessions)
          ..orderBy([(s) => OrderingTerm(expression: s.date, mode: OrderingMode.desc)])
          ..limit(limit))
        .watch();
  }

  Future<void> upsert(StudySessionsCompanion session) => into(studySessions).insertOnConflictUpdate(session);

  Future<void> deleteById(String id) => (delete(studySessions)..where((s) => s.id.equals(id))).go();
}
