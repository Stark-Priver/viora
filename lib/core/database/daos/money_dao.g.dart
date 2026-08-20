// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_dao.dart';

// ignore_for_file: type=lint
mixin _$MoneyDaoMixin on DatabaseAccessor<AppDatabase> {
  $AccountsTable get accounts => attachedDatabase.accounts;
  $TransactionsTable get transactions => attachedDatabase.transactions;
  $BudgetsTable get budgets => attachedDatabase.budgets;
  MoneyDaoManager get managers => MoneyDaoManager(this);
}

class MoneyDaoManager {
  final _$MoneyDaoMixin _db;
  MoneyDaoManager(this._db);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db.attachedDatabase, _db.accounts);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db.attachedDatabase, _db.transactions);
  $$BudgetsTableTableManager get budgets =>
      $$BudgetsTableTableManager(_db.attachedDatabase, _db.budgets);
}
