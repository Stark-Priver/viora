import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/tables.dart';

const _uuid = Uuid();

final businessClientsProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).businessDao.watchClients();
});

final businessProjectsProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).businessDao.watchProjects();
});

class ClientDraft {
  ClientDraft({required this.name, this.contact});
  final String name;
  final String? contact;
}

class BusinessProjectDraft {
  BusinessProjectDraft({required this.name, this.revenue = 0, this.expenses = 0, this.hoursSpent = 0});
  final String name;
  final double revenue;
  final double expenses;
  final double hoursSpent;
}

final businessActionsProvider = Provider((ref) => BusinessActions(ref));

class BusinessActions {
  BusinessActions(this.ref);
  final Ref ref;

  Future<void> addClient(ClientDraft draft) {
    return ref.read(databaseProvider).businessDao.upsertClient(
          BusinessClientsCompanion.insert(id: _uuid.v4(), name: draft.name, contact: Value(draft.contact)),
        );
  }

  Future<void> deleteClient(String id) => ref.read(databaseProvider).businessDao.deleteClient(id);

  Future<void> addProject(BusinessProjectDraft draft) {
    return ref.read(databaseProvider).businessDao.upsertProject(
          BusinessProjectsCompanion.insert(
            id: _uuid.v4(),
            name: draft.name,
            revenue: Value(draft.revenue),
            expenses: Value(draft.expenses),
            hoursSpent: Value(draft.hoursSpent),
          ),
        );
  }

  Future<void> cycleStatus(String id, String current) {
    final next = BusinessProjectStatuses.all[(BusinessProjectStatuses.all.indexOf(current) + 1) % BusinessProjectStatuses.all.length];
    return ref.read(databaseProvider).businessDao.setProjectStatus(id, next);
  }

  Future<void> deleteProject(String id) => ref.read(databaseProvider).businessDao.deleteProject(id);
}
