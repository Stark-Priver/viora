import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'money_dao.g.dart';

class TransactionTypes {
  TransactionTypes._();
  static const income = 'income';
  static const expense = 'expense';
  static const transfer = 'transfer';
  static const investment = 'investment';
  static const refund = 'refund';
  static const debt = 'debt';
  static const loanRepayment = 'loan_repayment';
  static const all = [income, expense, transfer, investment, refund, debt, loanRepayment];
}

@DriftAccessor(tables: [Accounts, Transactions, Budgets])
class MoneyDao extends DatabaseAccessor<AppDatabase> with _$MoneyDaoMixin {
  MoneyDao(super.db);

  Stream<List<AccountRow>> watchAccounts() => select(accounts).watch();

  Future<void> upsertAccount(AccountsCompanion account) => into(accounts).insertOnConflictUpdate(account);

  Stream<List<TransactionRow>> watchTransactions({int limit = 100}) {
    return (select(transactions)
          ..orderBy([(t) => OrderingTerm(expression: t.occurredAt, mode: OrderingMode.desc)])
          ..limit(limit))
        .watch();
  }

  Stream<List<TransactionRow>> watchBetween(DateTime start, DateTime end) {
    return (select(transactions)
          ..where((t) => t.occurredAt.isBiggerOrEqualValue(start) & t.occurredAt.isSmallerThanValue(end))
          ..orderBy([(t) => OrderingTerm(expression: t.occurredAt, mode: OrderingMode.desc)]))
        .watch();
  }

  Future<void> upsertTransaction(TransactionsCompanion tx) => into(transactions).insertOnConflictUpdate(tx);

  Future<void> deleteTransaction(String id) => (delete(transactions)..where((t) => t.id.equals(id))).go();

  Stream<List<BudgetRow>> watchBudgets(String month) {
    return (select(budgets)..where((b) => b.month.equals(month))).watch();
  }

  Future<void> upsertBudget(BudgetsCompanion budget) => into(budgets).insertOnConflictUpdate(budget);
}
