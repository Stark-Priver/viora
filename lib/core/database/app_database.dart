import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'tables.dart';
import 'daos/tasks_dao.dart';
import 'daos/projects_dao.dart';
import 'daos/goals_dao.dart';
import 'daos/calendar_dao.dart';
import 'daos/money_dao.dart';
import 'daos/journal_dao.dart';
import 'daos/habits_dao.dart';
import 'daos/focus_dao.dart';
import 'daos/health_dao.dart';
import 'daos/education_dao.dart';
import 'daos/career_dao.dart';
import 'daos/business_dao.dart';
import 'daos/transport_dao.dart';

part 'app_database.g.dart';

/// Local-first persistence: every read/write in the app goes through this
/// SQLite database first. Sync to Supabase (not implemented yet) will be a
/// background process layered on top, never a requirement for the UI to
/// function — see `sync_events` in the product brief's data model.
@DriftDatabase(
  tables: [
    Tasks,
    Projects,
    Goals,
    GoalProgressEntries,
    CalendarEvents,
    Accounts,
    Transactions,
    Budgets,
    JournalEntries,
    Habits,
    HabitLogs,
    FocusSessions,
    HealthLogs,
    StudySessions,
    CareerPositions,
    CareerAchievements,
    BusinessClients,
    BusinessProjects,
    Vehicles,
    VehicleFuelLogs,
    VehicleMaintenanceLogs,
  ],
  daos: [
    TasksDao,
    ProjectsDao,
    GoalsDao,
    CalendarDao,
    MoneyDao,
    JournalDao,
    HabitsDao,
    FocusDao,
    HealthDao,
    EducationDao,
    CareerDao,
    BusinessDao,
    TransportDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.addColumn(calendarEvents, calendarEvents.recurrence);
            await m.addColumn(calendarEvents, calendarEvents.recurrenceGroupId);
            await m.addColumn(calendarEvents, calendarEvents.reminderMinutesBefore);
            await m.addColumn(calendarEvents, calendarEvents.notificationId);
          }
          if (from < 3) {
            await m.createTable(healthLogs);
            await m.createTable(studySessions);
            await m.createTable(careerPositions);
            await m.createTable(careerAchievements);
            await m.createTable(businessClients);
            await m.createTable(businessProjects);
            await m.createTable(vehicles);
            await m.createTable(vehicleFuelLogs);
            await m.createTable(vehicleMaintenanceLogs);
          }
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'viora',
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.dart.js'),
      ),
    );
  }
}
