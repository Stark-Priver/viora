import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'focus_dao.g.dart';

@DriftAccessor(tables: [FocusSessions])
class FocusDao extends DatabaseAccessor<AppDatabase> with _$FocusDaoMixin {
  FocusDao(super.db);

  Stream<List<FocusSessionRow>> watchRecent({int limit = 50}) {
    return (select(focusSessions)
          ..orderBy([(f) => OrderingTerm(expression: f.startedAt, mode: OrderingMode.desc)])
          ..limit(limit))
        .watch();
  }

  Future<int> insertSession(FocusSessionsCompanion session) => into(focusSessions).insert(session);

  Future<void> endSession(String id, {required int focusedMinutes, required int interruptions}) {
    return (update(focusSessions)..where((f) => f.id.equals(id))).write(
      FocusSessionsCompanion(
        endedAt: Value(DateTime.now()),
        focusedMinutes: Value(focusedMinutes),
        interruptions: Value(interruptions),
      ),
    );
  }

  Future<void> deleteById(String id) => (delete(focusSessions)..where((f) => f.id.equals(id))).go();
}
