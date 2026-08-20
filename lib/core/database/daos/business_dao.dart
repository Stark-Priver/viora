import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'business_dao.g.dart';

@DriftAccessor(tables: [BusinessClients, BusinessProjects])
class BusinessDao extends DatabaseAccessor<AppDatabase> with _$BusinessDaoMixin {
  BusinessDao(super.db);

  Stream<List<BusinessClientRow>> watchClients() => select(businessClients).watch();

  Future<void> upsertClient(BusinessClientsCompanion client) => into(businessClients).insertOnConflictUpdate(client);

  Future<void> deleteClient(String id) => (delete(businessClients)..where((c) => c.id.equals(id))).go();

  Stream<List<BusinessProjectRow>> watchProjects() {
    return (select(businessProjects)..orderBy([(p) => OrderingTerm(expression: p.createdAt, mode: OrderingMode.desc)])).watch();
  }

  Future<void> upsertProject(BusinessProjectsCompanion project) => into(businessProjects).insertOnConflictUpdate(project);

  Future<void> setProjectStatus(String id, String status) {
    return (update(businessProjects)..where((p) => p.id.equals(id))).write(BusinessProjectsCompanion(status: Value(status)));
  }

  Future<void> deleteProject(String id) => (delete(businessProjects)..where((p) => p.id.equals(id))).go();
}
