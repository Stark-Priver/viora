import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/database/app_database.dart';

const _uuid = Uuid();

final accountsStreamProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).moneyDao.watchAccounts();
});

final transactionsStreamProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).moneyDao.watchTransactions();
});

/// Ensures the ledger always has at least one account to post transactions
/// against — first-run convenience so the user isn't forced through an
/// account-setup step before they can log an expense.
final ensureDefaultAccountProvider = FutureProvider.autoDispose((ref) async {
  final dao = ref.watch(databaseProvider).moneyDao;
  final accounts = await dao.watchAccounts().first;
  if (accounts.isEmpty) {
    await dao.upsertAccount(AccountsCompanion.insert(id: _uuid.v4(), name: 'Cash', type: const Value('cash')));
  }
});

class TransactionDraft {
  TransactionDraft({
    required this.accountId,
    required this.type,
    required this.amount,
    this.category,
    this.note,
  });
  final String accountId;
  final String type;
  final double amount;
  final String? category;
  final String? note;
}

final moneyActionsProvider = Provider((ref) => MoneyActions(ref));

class MoneyActions {
  MoneyActions(this.ref);
  final Ref ref;

  Future<void> addTransaction(TransactionDraft draft) {
    return ref.read(databaseProvider).moneyDao.upsertTransaction(
          TransactionsCompanion.insert(
            id: _uuid.v4(),
            accountId: draft.accountId,
            type: draft.type,
            amount: draft.amount,
            category: Value(draft.category),
            note: Value(draft.note),
          ),
        );
  }

  Future<void> deleteTransaction(String id) => ref.read(databaseProvider).moneyDao.deleteTransaction(id);
}
