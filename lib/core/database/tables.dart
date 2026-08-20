import 'package:drift/drift.dart';

/// Life-domain tag shared loosely across tasks/events/transactions/goals.
/// Kept as free text (not an enum column) so new domains can be added
/// without a migration — validated at the UI layer via [LifeDomains].
class LifeDomains {
  LifeDomains._();
  static const work = 'work';
  static const study = 'education';
  static const business = 'business';
  static const health = 'health';
  static const finance = 'finance';
  static const social = 'social';
  static const personal = 'personal';
  static const transport = 'transport';
  static const project = 'project';

  static const all = [work, study, business, health, finance, social, personal, transport, project];
}

@DataClassName('TaskRow')
class Tasks extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('inbox'))();
  TextColumn get priority => text().withDefault(const Constant('normal'))();
  DateTimeColumn get deadline => dateTime().nullable()();
  DateTimeColumn get scheduledDate => dateTime().nullable()();
  IntColumn get plannedMinutes => integer().nullable()();
  IntColumn get actualMinutes => integer().nullable()();
  TextColumn get projectId => text().nullable()();
  TextColumn get goalId => text().nullable()();
  TextColumn get domain => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ProjectRow')
class Projects extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get domain => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('active'))();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  RealColumn get budget => real().nullable()();
  RealColumn get revenue => real().nullable()();
  RealColumn get expenses => real().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('GoalRow')
class Goals extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get domain => text().nullable()();
  RealColumn get targetValue => real().nullable()();
  RealColumn get currentValue => real().withDefault(const Constant(0))();
  TextColumn get unit => text().nullable()();
  DateTimeColumn get deadline => dateTime().nullable()();
  TextColumn get projectId => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('GoalProgressRow')
class GoalProgressEntries extends Table {
  TextColumn get id => text()();
  TextColumn get goalId => text()();
  RealColumn get amount => real()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get loggedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class RecurrenceRules {
  RecurrenceRules._();
  static const none = 'none';
  static const daily = 'daily';
  static const weekly = 'weekly';
  static const monthly = 'monthly';
  static const all = [none, daily, weekly, monthly];
}

@DataClassName('CalendarEventRow')
class CalendarEvents extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get domain => text().withDefault(const Constant(LifeDomains.personal))();
  DateTimeColumn get start => dateTime()();
  DateTimeColumn get end => dateTime()();
  BoolColumn get allDay => boolean().withDefault(const Constant(false))();
  TextColumn get location => text().nullable()();
  TextColumn get taskId => text().nullable()();
  TextColumn get projectId => text().nullable()();
  TextColumn get goalId => text().nullable()();
  TextColumn get recurrence => text().withDefault(const Constant('none'))();
  TextColumn get recurrenceGroupId => text().nullable()();
  IntColumn get reminderMinutesBefore => integer().nullable()();
  IntColumn get notificationId => integer().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('AccountRow')
class Accounts extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get type => text().withDefault(const Constant('cash'))();
  TextColumn get currency => text().withDefault(const Constant('TZS'))();
  RealColumn get openingBalance => real().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('TransactionRow')
class Transactions extends Table {
  TextColumn get id => text()();
  TextColumn get accountId => text()();
  TextColumn get type => text()();
  RealColumn get amount => real()();
  TextColumn get category => text().nullable()();
  TextColumn get merchant => text().nullable()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get occurredAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get planned => boolean().withDefault(const Constant(true))();
  BoolColumn get necessary => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('BudgetRow')
class Budgets extends Table {
  TextColumn get id => text()();
  TextColumn get category => text()();
  RealColumn get monthlyLimit => real()();
  TextColumn get month => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('JournalEntryRow')
class JournalEntries extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get win => text().nullable()();
  TextColumn get problem => text().nullable()();
  TextColumn get lesson => text().nullable()();
  TextColumn get gratitude => text().nullable()();
  TextColumn get priorityTomorrow => text().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('HabitRow')
class Habits extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get type => text().withDefault(const Constant('binary'))();
  TextColumn get unit => text().nullable()();
  IntColumn get targetPerWeek => integer().nullable()();
  RealColumn get targetAmount => real().nullable()();
  TextColumn get domain => text().nullable()();
  BoolColumn get archived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('HabitLogRow')
class HabitLogs extends Table {
  TextColumn get id => text()();
  TextColumn get habitId => text()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  RealColumn get amount => real().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('FocusSessionRow')
class FocusSessions extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get taskId => text().nullable()();
  TextColumn get projectId => text().nullable()();
  IntColumn get plannedMinutes => integer().nullable()();
  DateTimeColumn get startedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get endedAt => dateTime().nullable()();
  IntColumn get focusedMinutes => integer().nullable()();
  IntColumn get interruptions => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('HealthLogRow')
class HealthLogs extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get sleepMinutes => integer().nullable()();
  RealColumn get weightKg => real().nullable()();
  IntColumn get waterMl => integer().nullable()();
  IntColumn get mood => integer().nullable()();
  IntColumn get energy => integer().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('StudySessionRow')
class StudySessions extends Table {
  TextColumn get id => text()();
  TextColumn get subject => text()();
  TextColumn get topic => text().nullable()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  IntColumn get minutes => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('CareerPositionRow')
class CareerPositions extends Table {
  TextColumn get id => text()();
  TextColumn get employer => text()();
  TextColumn get role => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  RealColumn get salary => real().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('CareerAchievementRow')
class CareerAchievements extends Table {
  TextColumn get id => text()();
  TextColumn get positionId => text().nullable()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('BusinessClientRow')
class BusinessClients extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get contact => text().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class BusinessProjectStatuses {
  BusinessProjectStatuses._();
  static const active = 'active';
  static const completed = 'completed';
  static const onHold = 'on_hold';
  static const all = [active, completed, onHold];
}

@DataClassName('BusinessProjectRow')
class BusinessProjects extends Table {
  TextColumn get id => text()();
  TextColumn get clientId => text().nullable()();
  TextColumn get name => text()();
  TextColumn get status => text().withDefault(const Constant(BusinessProjectStatuses.active))();
  RealColumn get revenue => real().withDefault(const Constant(0))();
  RealColumn get expenses => real().withDefault(const Constant(0))();
  RealColumn get hoursSpent => real().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class VehicleTypes {
  VehicleTypes._();
  static const motorcycle = 'motorcycle';
  static const car = 'car';
  static const bicycle = 'bicycle';
  static const publicTransport = 'public_transport';
  static const all = [motorcycle, car, bicycle, publicTransport];
}

@DataClassName('VehicleRow')
class Vehicles extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get type => text().withDefault(const Constant(VehicleTypes.motorcycle))();
  RealColumn get odometerKm => real().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('VehicleFuelLogRow')
class VehicleFuelLogs extends Table {
  TextColumn get id => text()();
  TextColumn get vehicleId => text()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  RealColumn get litres => real()();
  RealColumn get cost => real()();
  RealColumn get odometerKm => real().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('VehicleMaintenanceRow')
class VehicleMaintenanceLogs extends Table {
  TextColumn get id => text()();
  TextColumn get vehicleId => text()();
  TextColumn get type => text()();
  RealColumn get cost => real().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
