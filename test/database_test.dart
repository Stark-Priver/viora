import 'dart:ffi';
import 'dart:io';
import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/open.dart';
import 'package:viora/core/database/app_database.dart';
import 'package:viora/core/database/daos/tasks_dao.dart';
import 'package:viora/core/database/daos/money_dao.dart';

void main() {
  // This host only has the versioned libsqlite3.so.0, not the unversioned
  // symlink sqlite3's default loader looks for (installing libsqlite3-dev
  // needs sudo, which isn't available here) — point it there explicitly.
  setUpAll(() {
    if (Platform.isLinux) {
      open.overrideFor(OperatingSystem.linux, () => DynamicLibrary.open('libsqlite3.so.0'));
    }
  });

  late AppDatabase db;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() => db.close());

  test('tasks: insert, update status, delete', () async {
    await db.tasksDao.upsert(
      TasksCompanion.insert(id: 't1', title: 'Write spec', status: const Value(TaskStatuses.planned)),
    );

    var all = await db.tasksDao.watchAll().first;
    expect(all, hasLength(1));
    expect(all.single.title, 'Write spec');
    expect(all.single.status, TaskStatuses.planned);

    await db.tasksDao.setStatus('t1', TaskStatuses.completed);
    all = await db.tasksDao.watchAll().first;
    expect(all.single.status, TaskStatuses.completed);

    final active = await db.tasksDao.watchActive().first;
    expect(active, isEmpty);

    await db.tasksDao.deleteById('t1');
    all = await db.tasksDao.watchAll().first;
    expect(all, isEmpty);
  });

  test('goals: logging progress bumps currentValue', () async {
    await db.goalsDao.upsert(
      GoalsCompanion.insert(id: 'g1', title: 'Emergency Fund', targetValue: const Value(2000000), unit: const Value('TZS')),
    );

    await db.goalsDao.logProgress(goalId: 'g1', amount: 50000, note: 'Salary top-up');
    await db.goalsDao.logProgress(goalId: 'g1', amount: 25000);

    final goal = (await db.goalsDao.watchAll().first).single;
    expect(goal.currentValue, 75000);

    final progress = await db.goalsDao.watchProgress('g1').first;
    expect(progress, hasLength(2));
  });

  test('money: transactions filtered by date range', () async {
    await db.moneyDao.upsertAccount(AccountsCompanion.insert(id: 'a1', name: 'Cash'));
    await db.moneyDao.upsertTransaction(
      TransactionsCompanion.insert(
        id: 'tx1',
        accountId: 'a1',
        type: TransactionTypes.expense,
        amount: 13500,
        occurredAt: Value(DateTime(2026, 8, 19)),
      ),
    );
    await db.moneyDao.upsertTransaction(
      TransactionsCompanion.insert(
        id: 'tx2',
        accountId: 'a1',
        type: TransactionTypes.income,
        amount: 900000,
        occurredAt: Value(DateTime(2026, 7, 1)),
      ),
    );

    final august = await db.moneyDao.watchBetween(DateTime(2026, 8, 1), DateTime(2026, 9, 1)).first;
    expect(august, hasLength(1));
    expect(august.single.id, 'tx1');
  });

  test('habits: per-day log upsert is idempotent per habit+day', () async {
    await db.habitsDao.upsert(HabitsCompanion.insert(id: 'h1', title: 'Exercise'));
    final day = DateTime(2026, 8, 19);

    await db.habitsDao.upsertLog(HabitLogsCompanion.insert(id: 'l1', habitId: 'h1', date: day, completed: const Value(true)));
    final log = await db.habitsDao.logForDay('h1', day);
    expect(log, isNotNull);
    expect(log!.completed, isTrue);
  });

  _recurrenceTests();
}

void _recurrenceTests() {
  group('calendar recurrence', () {
    late AppDatabase db;
    setUp(() => db = AppDatabase.forTesting(NativeDatabase.memory()));
    tearDown(() => db.close());

    test('insertAll persists all generated occurrences', () async {
      final start = DateTime(2026, 8, 20, 9, 0);
      final rows = List.generate(12, (i) {
        final occStart = start.add(Duration(days: i));
        return CalendarEventsCompanion.insert(
          id: 'evt-$i',
          title: 'Morning workout',
          start: occStart,
          end: occStart.add(const Duration(hours: 1)),
          recurrence: const Value('daily'),
          recurrenceGroupId: const Value('group-1'),
        );
      });
      await db.calendarDao.insertAll(rows);

      final monthEvents = await db.calendarDao.watchBetween(DateTime(2026, 8, 1), DateTime(2026, 9, 1)).first;
      expect(monthEvents, hasLength(12));
      expect(monthEvents.map((e) => e.start.day).toSet(), {20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31});
    });
  });
}
