// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TasksTable extends Tasks with TableInfo<$TasksTable, TaskRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('inbox'));
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
      'priority', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('normal'));
  static const VerificationMeta _deadlineMeta =
      const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
      'deadline', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _scheduledDateMeta =
      const VerificationMeta('scheduledDate');
  @override
  late final GeneratedColumn<DateTime> scheduledDate =
      GeneratedColumn<DateTime>('scheduled_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _plannedMinutesMeta =
      const VerificationMeta('plannedMinutes');
  @override
  late final GeneratedColumn<int> plannedMinutes = GeneratedColumn<int>(
      'planned_minutes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _actualMinutesMeta =
      const VerificationMeta('actualMinutes');
  @override
  late final GeneratedColumn<int> actualMinutes = GeneratedColumn<int>(
      'actual_minutes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _goalIdMeta = const VerificationMeta('goalId');
  @override
  late final GeneratedColumn<String> goalId = GeneratedColumn<String>(
      'goal_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _domainMeta = const VerificationMeta('domain');
  @override
  late final GeneratedColumn<String> domain = GeneratedColumn<String>(
      'domain', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        status,
        priority,
        deadline,
        scheduledDate,
        plannedMinutes,
        actualMinutes,
        projectId,
        goalId,
        domain,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<TaskRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    }
    if (data.containsKey('scheduled_date')) {
      context.handle(
          _scheduledDateMeta,
          scheduledDate.isAcceptableOrUnknown(
              data['scheduled_date']!, _scheduledDateMeta));
    }
    if (data.containsKey('planned_minutes')) {
      context.handle(
          _plannedMinutesMeta,
          plannedMinutes.isAcceptableOrUnknown(
              data['planned_minutes']!, _plannedMinutesMeta));
    }
    if (data.containsKey('actual_minutes')) {
      context.handle(
          _actualMinutesMeta,
          actualMinutes.isAcceptableOrUnknown(
              data['actual_minutes']!, _actualMinutesMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    }
    if (data.containsKey('goal_id')) {
      context.handle(_goalIdMeta,
          goalId.isAcceptableOrUnknown(data['goal_id']!, _goalIdMeta));
    }
    if (data.containsKey('domain')) {
      context.handle(_domainMeta,
          domain.isAcceptableOrUnknown(data['domain']!, _domainMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority'])!,
      deadline: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline']),
      scheduledDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}scheduled_date']),
      plannedMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}planned_minutes']),
      actualMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}actual_minutes']),
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id']),
      goalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}goal_id']),
      domain: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}domain']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class TaskRow extends DataClass implements Insertable<TaskRow> {
  final String id;
  final String title;
  final String? description;
  final String status;
  final String priority;
  final DateTime? deadline;
  final DateTime? scheduledDate;
  final int? plannedMinutes;
  final int? actualMinutes;
  final String? projectId;
  final String? goalId;
  final String? domain;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TaskRow(
      {required this.id,
      required this.title,
      this.description,
      required this.status,
      required this.priority,
      this.deadline,
      this.scheduledDate,
      this.plannedMinutes,
      this.actualMinutes,
      this.projectId,
      this.goalId,
      this.domain,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['status'] = Variable<String>(status);
    map['priority'] = Variable<String>(priority);
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    if (!nullToAbsent || scheduledDate != null) {
      map['scheduled_date'] = Variable<DateTime>(scheduledDate);
    }
    if (!nullToAbsent || plannedMinutes != null) {
      map['planned_minutes'] = Variable<int>(plannedMinutes);
    }
    if (!nullToAbsent || actualMinutes != null) {
      map['actual_minutes'] = Variable<int>(actualMinutes);
    }
    if (!nullToAbsent || projectId != null) {
      map['project_id'] = Variable<String>(projectId);
    }
    if (!nullToAbsent || goalId != null) {
      map['goal_id'] = Variable<String>(goalId);
    }
    if (!nullToAbsent || domain != null) {
      map['domain'] = Variable<String>(domain);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      status: Value(status),
      priority: Value(priority),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      scheduledDate: scheduledDate == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduledDate),
      plannedMinutes: plannedMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(plannedMinutes),
      actualMinutes: actualMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(actualMinutes),
      projectId: projectId == null && nullToAbsent
          ? const Value.absent()
          : Value(projectId),
      goalId:
          goalId == null && nullToAbsent ? const Value.absent() : Value(goalId),
      domain:
          domain == null && nullToAbsent ? const Value.absent() : Value(domain),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TaskRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      status: serializer.fromJson<String>(json['status']),
      priority: serializer.fromJson<String>(json['priority']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      scheduledDate: serializer.fromJson<DateTime?>(json['scheduledDate']),
      plannedMinutes: serializer.fromJson<int?>(json['plannedMinutes']),
      actualMinutes: serializer.fromJson<int?>(json['actualMinutes']),
      projectId: serializer.fromJson<String?>(json['projectId']),
      goalId: serializer.fromJson<String?>(json['goalId']),
      domain: serializer.fromJson<String?>(json['domain']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'status': serializer.toJson<String>(status),
      'priority': serializer.toJson<String>(priority),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'scheduledDate': serializer.toJson<DateTime?>(scheduledDate),
      'plannedMinutes': serializer.toJson<int?>(plannedMinutes),
      'actualMinutes': serializer.toJson<int?>(actualMinutes),
      'projectId': serializer.toJson<String?>(projectId),
      'goalId': serializer.toJson<String?>(goalId),
      'domain': serializer.toJson<String?>(domain),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TaskRow copyWith(
          {String? id,
          String? title,
          Value<String?> description = const Value.absent(),
          String? status,
          String? priority,
          Value<DateTime?> deadline = const Value.absent(),
          Value<DateTime?> scheduledDate = const Value.absent(),
          Value<int?> plannedMinutes = const Value.absent(),
          Value<int?> actualMinutes = const Value.absent(),
          Value<String?> projectId = const Value.absent(),
          Value<String?> goalId = const Value.absent(),
          Value<String?> domain = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      TaskRow(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        status: status ?? this.status,
        priority: priority ?? this.priority,
        deadline: deadline.present ? deadline.value : this.deadline,
        scheduledDate:
            scheduledDate.present ? scheduledDate.value : this.scheduledDate,
        plannedMinutes:
            plannedMinutes.present ? plannedMinutes.value : this.plannedMinutes,
        actualMinutes:
            actualMinutes.present ? actualMinutes.value : this.actualMinutes,
        projectId: projectId.present ? projectId.value : this.projectId,
        goalId: goalId.present ? goalId.value : this.goalId,
        domain: domain.present ? domain.value : this.domain,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  TaskRow copyWithCompanion(TasksCompanion data) {
    return TaskRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      status: data.status.present ? data.status.value : this.status,
      priority: data.priority.present ? data.priority.value : this.priority,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      scheduledDate: data.scheduledDate.present
          ? data.scheduledDate.value
          : this.scheduledDate,
      plannedMinutes: data.plannedMinutes.present
          ? data.plannedMinutes.value
          : this.plannedMinutes,
      actualMinutes: data.actualMinutes.present
          ? data.actualMinutes.value
          : this.actualMinutes,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      goalId: data.goalId.present ? data.goalId.value : this.goalId,
      domain: data.domain.present ? data.domain.value : this.domain,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('deadline: $deadline, ')
          ..write('scheduledDate: $scheduledDate, ')
          ..write('plannedMinutes: $plannedMinutes, ')
          ..write('actualMinutes: $actualMinutes, ')
          ..write('projectId: $projectId, ')
          ..write('goalId: $goalId, ')
          ..write('domain: $domain, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      description,
      status,
      priority,
      deadline,
      scheduledDate,
      plannedMinutes,
      actualMinutes,
      projectId,
      goalId,
      domain,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.status == this.status &&
          other.priority == this.priority &&
          other.deadline == this.deadline &&
          other.scheduledDate == this.scheduledDate &&
          other.plannedMinutes == this.plannedMinutes &&
          other.actualMinutes == this.actualMinutes &&
          other.projectId == this.projectId &&
          other.goalId == this.goalId &&
          other.domain == this.domain &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TasksCompanion extends UpdateCompanion<TaskRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> status;
  final Value<String> priority;
  final Value<DateTime?> deadline;
  final Value<DateTime?> scheduledDate;
  final Value<int?> plannedMinutes;
  final Value<int?> actualMinutes;
  final Value<String?> projectId;
  final Value<String?> goalId;
  final Value<String?> domain;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.priority = const Value.absent(),
    this.deadline = const Value.absent(),
    this.scheduledDate = const Value.absent(),
    this.plannedMinutes = const Value.absent(),
    this.actualMinutes = const Value.absent(),
    this.projectId = const Value.absent(),
    this.goalId = const Value.absent(),
    this.domain = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    this.status = const Value.absent(),
    this.priority = const Value.absent(),
    this.deadline = const Value.absent(),
    this.scheduledDate = const Value.absent(),
    this.plannedMinutes = const Value.absent(),
    this.actualMinutes = const Value.absent(),
    this.projectId = const Value.absent(),
    this.goalId = const Value.absent(),
    this.domain = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title);
  static Insertable<TaskRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? status,
    Expression<String>? priority,
    Expression<DateTime>? deadline,
    Expression<DateTime>? scheduledDate,
    Expression<int>? plannedMinutes,
    Expression<int>? actualMinutes,
    Expression<String>? projectId,
    Expression<String>? goalId,
    Expression<String>? domain,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (status != null) 'status': status,
      if (priority != null) 'priority': priority,
      if (deadline != null) 'deadline': deadline,
      if (scheduledDate != null) 'scheduled_date': scheduledDate,
      if (plannedMinutes != null) 'planned_minutes': plannedMinutes,
      if (actualMinutes != null) 'actual_minutes': actualMinutes,
      if (projectId != null) 'project_id': projectId,
      if (goalId != null) 'goal_id': goalId,
      if (domain != null) 'domain': domain,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<String>? status,
      Value<String>? priority,
      Value<DateTime?>? deadline,
      Value<DateTime?>? scheduledDate,
      Value<int?>? plannedMinutes,
      Value<int?>? actualMinutes,
      Value<String?>? projectId,
      Value<String?>? goalId,
      Value<String?>? domain,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      deadline: deadline ?? this.deadline,
      scheduledDate: scheduledDate ?? this.scheduledDate,
      plannedMinutes: plannedMinutes ?? this.plannedMinutes,
      actualMinutes: actualMinutes ?? this.actualMinutes,
      projectId: projectId ?? this.projectId,
      goalId: goalId ?? this.goalId,
      domain: domain ?? this.domain,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (scheduledDate.present) {
      map['scheduled_date'] = Variable<DateTime>(scheduledDate.value);
    }
    if (plannedMinutes.present) {
      map['planned_minutes'] = Variable<int>(plannedMinutes.value);
    }
    if (actualMinutes.present) {
      map['actual_minutes'] = Variable<int>(actualMinutes.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (goalId.present) {
      map['goal_id'] = Variable<String>(goalId.value);
    }
    if (domain.present) {
      map['domain'] = Variable<String>(domain.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('status: $status, ')
          ..write('priority: $priority, ')
          ..write('deadline: $deadline, ')
          ..write('scheduledDate: $scheduledDate, ')
          ..write('plannedMinutes: $plannedMinutes, ')
          ..write('actualMinutes: $actualMinutes, ')
          ..write('projectId: $projectId, ')
          ..write('goalId: $goalId, ')
          ..write('domain: $domain, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectsTable extends Projects
    with TableInfo<$ProjectsTable, ProjectRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _domainMeta = const VerificationMeta('domain');
  @override
  late final GeneratedColumn<String> domain = GeneratedColumn<String>(
      'domain', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('active'));
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _budgetMeta = const VerificationMeta('budget');
  @override
  late final GeneratedColumn<double> budget = GeneratedColumn<double>(
      'budget', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _revenueMeta =
      const VerificationMeta('revenue');
  @override
  late final GeneratedColumn<double> revenue = GeneratedColumn<double>(
      'revenue', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _expensesMeta =
      const VerificationMeta('expenses');
  @override
  late final GeneratedColumn<double> expenses = GeneratedColumn<double>(
      'expenses', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        domain,
        status,
        startDate,
        dueDate,
        budget,
        revenue,
        expenses,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  VerificationContext validateIntegrity(Insertable<ProjectRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('domain')) {
      context.handle(_domainMeta,
          domain.isAcceptableOrUnknown(data['domain']!, _domainMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('budget')) {
      context.handle(_budgetMeta,
          budget.isAcceptableOrUnknown(data['budget']!, _budgetMeta));
    }
    if (data.containsKey('revenue')) {
      context.handle(_revenueMeta,
          revenue.isAcceptableOrUnknown(data['revenue']!, _revenueMeta));
    }
    if (data.containsKey('expenses')) {
      context.handle(_expensesMeta,
          expenses.isAcceptableOrUnknown(data['expenses']!, _expensesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      domain: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}domain']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date']),
      budget: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}budget']),
      revenue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}revenue']),
      expenses: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}expenses']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(attachedDatabase, alias);
  }
}

class ProjectRow extends DataClass implements Insertable<ProjectRow> {
  final String id;
  final String name;
  final String? description;
  final String? domain;
  final String status;
  final DateTime? startDate;
  final DateTime? dueDate;
  final double? budget;
  final double? revenue;
  final double? expenses;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ProjectRow(
      {required this.id,
      required this.name,
      this.description,
      this.domain,
      required this.status,
      this.startDate,
      this.dueDate,
      this.budget,
      this.revenue,
      this.expenses,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || domain != null) {
      map['domain'] = Variable<String>(domain);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || budget != null) {
      map['budget'] = Variable<double>(budget);
    }
    if (!nullToAbsent || revenue != null) {
      map['revenue'] = Variable<double>(revenue);
    }
    if (!nullToAbsent || expenses != null) {
      map['expenses'] = Variable<double>(expenses);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      domain:
          domain == null && nullToAbsent ? const Value.absent() : Value(domain),
      status: Value(status),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      budget:
          budget == null && nullToAbsent ? const Value.absent() : Value(budget),
      revenue: revenue == null && nullToAbsent
          ? const Value.absent()
          : Value(revenue),
      expenses: expenses == null && nullToAbsent
          ? const Value.absent()
          : Value(expenses),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ProjectRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      domain: serializer.fromJson<String?>(json['domain']),
      status: serializer.fromJson<String>(json['status']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      budget: serializer.fromJson<double?>(json['budget']),
      revenue: serializer.fromJson<double?>(json['revenue']),
      expenses: serializer.fromJson<double?>(json['expenses']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'domain': serializer.toJson<String?>(domain),
      'status': serializer.toJson<String>(status),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'budget': serializer.toJson<double?>(budget),
      'revenue': serializer.toJson<double?>(revenue),
      'expenses': serializer.toJson<double?>(expenses),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ProjectRow copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> domain = const Value.absent(),
          String? status,
          Value<DateTime?> startDate = const Value.absent(),
          Value<DateTime?> dueDate = const Value.absent(),
          Value<double?> budget = const Value.absent(),
          Value<double?> revenue = const Value.absent(),
          Value<double?> expenses = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ProjectRow(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        domain: domain.present ? domain.value : this.domain,
        status: status ?? this.status,
        startDate: startDate.present ? startDate.value : this.startDate,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        budget: budget.present ? budget.value : this.budget,
        revenue: revenue.present ? revenue.value : this.revenue,
        expenses: expenses.present ? expenses.value : this.expenses,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ProjectRow copyWithCompanion(ProjectsCompanion data) {
    return ProjectRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      domain: data.domain.present ? data.domain.value : this.domain,
      status: data.status.present ? data.status.value : this.status,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      budget: data.budget.present ? data.budget.value : this.budget,
      revenue: data.revenue.present ? data.revenue.value : this.revenue,
      expenses: data.expenses.present ? data.expenses.value : this.expenses,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('domain: $domain, ')
          ..write('status: $status, ')
          ..write('startDate: $startDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('budget: $budget, ')
          ..write('revenue: $revenue, ')
          ..write('expenses: $expenses, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, domain, status,
      startDate, dueDate, budget, revenue, expenses, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.domain == this.domain &&
          other.status == this.status &&
          other.startDate == this.startDate &&
          other.dueDate == this.dueDate &&
          other.budget == this.budget &&
          other.revenue == this.revenue &&
          other.expenses == this.expenses &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProjectsCompanion extends UpdateCompanion<ProjectRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> domain;
  final Value<String> status;
  final Value<DateTime?> startDate;
  final Value<DateTime?> dueDate;
  final Value<double?> budget;
  final Value<double?> revenue;
  final Value<double?> expenses;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.domain = const Value.absent(),
    this.status = const Value.absent(),
    this.startDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.budget = const Value.absent(),
    this.revenue = const Value.absent(),
    this.expenses = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectsCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.domain = const Value.absent(),
    this.status = const Value.absent(),
    this.startDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.budget = const Value.absent(),
    this.revenue = const Value.absent(),
    this.expenses = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<ProjectRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? domain,
    Expression<String>? status,
    Expression<DateTime>? startDate,
    Expression<DateTime>? dueDate,
    Expression<double>? budget,
    Expression<double>? revenue,
    Expression<double>? expenses,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (domain != null) 'domain': domain,
      if (status != null) 'status': status,
      if (startDate != null) 'start_date': startDate,
      if (dueDate != null) 'due_date': dueDate,
      if (budget != null) 'budget': budget,
      if (revenue != null) 'revenue': revenue,
      if (expenses != null) 'expenses': expenses,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? domain,
      Value<String>? status,
      Value<DateTime?>? startDate,
      Value<DateTime?>? dueDate,
      Value<double?>? budget,
      Value<double?>? revenue,
      Value<double?>? expenses,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return ProjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      domain: domain ?? this.domain,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      dueDate: dueDate ?? this.dueDate,
      budget: budget ?? this.budget,
      revenue: revenue ?? this.revenue,
      expenses: expenses ?? this.expenses,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (domain.present) {
      map['domain'] = Variable<String>(domain.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (budget.present) {
      map['budget'] = Variable<double>(budget.value);
    }
    if (revenue.present) {
      map['revenue'] = Variable<double>(revenue.value);
    }
    if (expenses.present) {
      map['expenses'] = Variable<double>(expenses.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('domain: $domain, ')
          ..write('status: $status, ')
          ..write('startDate: $startDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('budget: $budget, ')
          ..write('revenue: $revenue, ')
          ..write('expenses: $expenses, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, GoalRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _domainMeta = const VerificationMeta('domain');
  @override
  late final GeneratedColumn<String> domain = GeneratedColumn<String>(
      'domain', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _targetValueMeta =
      const VerificationMeta('targetValue');
  @override
  late final GeneratedColumn<double> targetValue = GeneratedColumn<double>(
      'target_value', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _currentValueMeta =
      const VerificationMeta('currentValue');
  @override
  late final GeneratedColumn<double> currentValue = GeneratedColumn<double>(
      'current_value', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deadlineMeta =
      const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
      'deadline', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        domain,
        targetValue,
        currentValue,
        unit,
        deadline,
        projectId,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(Insertable<GoalRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('domain')) {
      context.handle(_domainMeta,
          domain.isAcceptableOrUnknown(data['domain']!, _domainMeta));
    }
    if (data.containsKey('target_value')) {
      context.handle(
          _targetValueMeta,
          targetValue.isAcceptableOrUnknown(
              data['target_value']!, _targetValueMeta));
    }
    if (data.containsKey('current_value')) {
      context.handle(
          _currentValueMeta,
          currentValue.isAcceptableOrUnknown(
              data['current_value']!, _currentValueMeta));
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    }
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoalRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      domain: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}domain']),
      targetValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}target_value']),
      currentValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}current_value'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit']),
      deadline: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline']),
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }
}

class GoalRow extends DataClass implements Insertable<GoalRow> {
  final String id;
  final String title;
  final String? description;
  final String? domain;
  final double? targetValue;
  final double currentValue;
  final String? unit;
  final DateTime? deadline;
  final String? projectId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const GoalRow(
      {required this.id,
      required this.title,
      this.description,
      this.domain,
      this.targetValue,
      required this.currentValue,
      this.unit,
      this.deadline,
      this.projectId,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || domain != null) {
      map['domain'] = Variable<String>(domain);
    }
    if (!nullToAbsent || targetValue != null) {
      map['target_value'] = Variable<double>(targetValue);
    }
    map['current_value'] = Variable<double>(currentValue);
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    if (!nullToAbsent || projectId != null) {
      map['project_id'] = Variable<String>(projectId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      domain:
          domain == null && nullToAbsent ? const Value.absent() : Value(domain),
      targetValue: targetValue == null && nullToAbsent
          ? const Value.absent()
          : Value(targetValue),
      currentValue: Value(currentValue),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      projectId: projectId == null && nullToAbsent
          ? const Value.absent()
          : Value(projectId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory GoalRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      domain: serializer.fromJson<String?>(json['domain']),
      targetValue: serializer.fromJson<double?>(json['targetValue']),
      currentValue: serializer.fromJson<double>(json['currentValue']),
      unit: serializer.fromJson<String?>(json['unit']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      projectId: serializer.fromJson<String?>(json['projectId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'domain': serializer.toJson<String?>(domain),
      'targetValue': serializer.toJson<double?>(targetValue),
      'currentValue': serializer.toJson<double>(currentValue),
      'unit': serializer.toJson<String?>(unit),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'projectId': serializer.toJson<String?>(projectId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  GoalRow copyWith(
          {String? id,
          String? title,
          Value<String?> description = const Value.absent(),
          Value<String?> domain = const Value.absent(),
          Value<double?> targetValue = const Value.absent(),
          double? currentValue,
          Value<String?> unit = const Value.absent(),
          Value<DateTime?> deadline = const Value.absent(),
          Value<String?> projectId = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      GoalRow(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        domain: domain.present ? domain.value : this.domain,
        targetValue: targetValue.present ? targetValue.value : this.targetValue,
        currentValue: currentValue ?? this.currentValue,
        unit: unit.present ? unit.value : this.unit,
        deadline: deadline.present ? deadline.value : this.deadline,
        projectId: projectId.present ? projectId.value : this.projectId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  GoalRow copyWithCompanion(GoalsCompanion data) {
    return GoalRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      domain: data.domain.present ? data.domain.value : this.domain,
      targetValue:
          data.targetValue.present ? data.targetValue.value : this.targetValue,
      currentValue: data.currentValue.present
          ? data.currentValue.value
          : this.currentValue,
      unit: data.unit.present ? data.unit.value : this.unit,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('domain: $domain, ')
          ..write('targetValue: $targetValue, ')
          ..write('currentValue: $currentValue, ')
          ..write('unit: $unit, ')
          ..write('deadline: $deadline, ')
          ..write('projectId: $projectId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, domain, targetValue,
      currentValue, unit, deadline, projectId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.domain == this.domain &&
          other.targetValue == this.targetValue &&
          other.currentValue == this.currentValue &&
          other.unit == this.unit &&
          other.deadline == this.deadline &&
          other.projectId == this.projectId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GoalsCompanion extends UpdateCompanion<GoalRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<String?> domain;
  final Value<double?> targetValue;
  final Value<double> currentValue;
  final Value<String?> unit;
  final Value<DateTime?> deadline;
  final Value<String?> projectId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.domain = const Value.absent(),
    this.targetValue = const Value.absent(),
    this.currentValue = const Value.absent(),
    this.unit = const Value.absent(),
    this.deadline = const Value.absent(),
    this.projectId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalsCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    this.domain = const Value.absent(),
    this.targetValue = const Value.absent(),
    this.currentValue = const Value.absent(),
    this.unit = const Value.absent(),
    this.deadline = const Value.absent(),
    this.projectId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title);
  static Insertable<GoalRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? domain,
    Expression<double>? targetValue,
    Expression<double>? currentValue,
    Expression<String>? unit,
    Expression<DateTime>? deadline,
    Expression<String>? projectId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (domain != null) 'domain': domain,
      if (targetValue != null) 'target_value': targetValue,
      if (currentValue != null) 'current_value': currentValue,
      if (unit != null) 'unit': unit,
      if (deadline != null) 'deadline': deadline,
      if (projectId != null) 'project_id': projectId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<String?>? domain,
      Value<double?>? targetValue,
      Value<double>? currentValue,
      Value<String?>? unit,
      Value<DateTime?>? deadline,
      Value<String?>? projectId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return GoalsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      domain: domain ?? this.domain,
      targetValue: targetValue ?? this.targetValue,
      currentValue: currentValue ?? this.currentValue,
      unit: unit ?? this.unit,
      deadline: deadline ?? this.deadline,
      projectId: projectId ?? this.projectId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (domain.present) {
      map['domain'] = Variable<String>(domain.value);
    }
    if (targetValue.present) {
      map['target_value'] = Variable<double>(targetValue.value);
    }
    if (currentValue.present) {
      map['current_value'] = Variable<double>(currentValue.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('domain: $domain, ')
          ..write('targetValue: $targetValue, ')
          ..write('currentValue: $currentValue, ')
          ..write('unit: $unit, ')
          ..write('deadline: $deadline, ')
          ..write('projectId: $projectId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GoalProgressEntriesTable extends GoalProgressEntries
    with TableInfo<$GoalProgressEntriesTable, GoalProgressRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalProgressEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _goalIdMeta = const VerificationMeta('goalId');
  @override
  late final GeneratedColumn<String> goalId = GeneratedColumn<String>(
      'goal_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _loggedAtMeta =
      const VerificationMeta('loggedAt');
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
      'logged_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, goalId, amount, note, loggedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goal_progress_entries';
  @override
  VerificationContext validateIntegrity(Insertable<GoalProgressRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('goal_id')) {
      context.handle(_goalIdMeta,
          goalId.isAcceptableOrUnknown(data['goal_id']!, _goalIdMeta));
    } else if (isInserting) {
      context.missing(_goalIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('logged_at')) {
      context.handle(_loggedAtMeta,
          loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GoalProgressRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalProgressRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      goalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}goal_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      loggedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}logged_at'])!,
    );
  }

  @override
  $GoalProgressEntriesTable createAlias(String alias) {
    return $GoalProgressEntriesTable(attachedDatabase, alias);
  }
}

class GoalProgressRow extends DataClass implements Insertable<GoalProgressRow> {
  final String id;
  final String goalId;
  final double amount;
  final String? note;
  final DateTime loggedAt;
  const GoalProgressRow(
      {required this.id,
      required this.goalId,
      required this.amount,
      this.note,
      required this.loggedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['goal_id'] = Variable<String>(goalId);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['logged_at'] = Variable<DateTime>(loggedAt);
    return map;
  }

  GoalProgressEntriesCompanion toCompanion(bool nullToAbsent) {
    return GoalProgressEntriesCompanion(
      id: Value(id),
      goalId: Value(goalId),
      amount: Value(amount),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      loggedAt: Value(loggedAt),
    );
  }

  factory GoalProgressRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalProgressRow(
      id: serializer.fromJson<String>(json['id']),
      goalId: serializer.fromJson<String>(json['goalId']),
      amount: serializer.fromJson<double>(json['amount']),
      note: serializer.fromJson<String?>(json['note']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'goalId': serializer.toJson<String>(goalId),
      'amount': serializer.toJson<double>(amount),
      'note': serializer.toJson<String?>(note),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
    };
  }

  GoalProgressRow copyWith(
          {String? id,
          String? goalId,
          double? amount,
          Value<String?> note = const Value.absent(),
          DateTime? loggedAt}) =>
      GoalProgressRow(
        id: id ?? this.id,
        goalId: goalId ?? this.goalId,
        amount: amount ?? this.amount,
        note: note.present ? note.value : this.note,
        loggedAt: loggedAt ?? this.loggedAt,
      );
  GoalProgressRow copyWithCompanion(GoalProgressEntriesCompanion data) {
    return GoalProgressRow(
      id: data.id.present ? data.id.value : this.id,
      goalId: data.goalId.present ? data.goalId.value : this.goalId,
      amount: data.amount.present ? data.amount.value : this.amount,
      note: data.note.present ? data.note.value : this.note,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalProgressRow(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, goalId, amount, note, loggedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalProgressRow &&
          other.id == this.id &&
          other.goalId == this.goalId &&
          other.amount == this.amount &&
          other.note == this.note &&
          other.loggedAt == this.loggedAt);
}

class GoalProgressEntriesCompanion extends UpdateCompanion<GoalProgressRow> {
  final Value<String> id;
  final Value<String> goalId;
  final Value<double> amount;
  final Value<String?> note;
  final Value<DateTime> loggedAt;
  final Value<int> rowid;
  const GoalProgressEntriesCompanion({
    this.id = const Value.absent(),
    this.goalId = const Value.absent(),
    this.amount = const Value.absent(),
    this.note = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GoalProgressEntriesCompanion.insert({
    required String id,
    required String goalId,
    required double amount,
    this.note = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        goalId = Value(goalId),
        amount = Value(amount);
  static Insertable<GoalProgressRow> custom({
    Expression<String>? id,
    Expression<String>? goalId,
    Expression<double>? amount,
    Expression<String>? note,
    Expression<DateTime>? loggedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (goalId != null) 'goal_id': goalId,
      if (amount != null) 'amount': amount,
      if (note != null) 'note': note,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GoalProgressEntriesCompanion copyWith(
      {Value<String>? id,
      Value<String>? goalId,
      Value<double>? amount,
      Value<String?>? note,
      Value<DateTime>? loggedAt,
      Value<int>? rowid}) {
    return GoalProgressEntriesCompanion(
      id: id ?? this.id,
      goalId: goalId ?? this.goalId,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      loggedAt: loggedAt ?? this.loggedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (goalId.present) {
      map['goal_id'] = Variable<String>(goalId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalProgressEntriesCompanion(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CalendarEventsTable extends CalendarEvents
    with TableInfo<$CalendarEventsTable, CalendarEventRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _domainMeta = const VerificationMeta('domain');
  @override
  late final GeneratedColumn<String> domain = GeneratedColumn<String>(
      'domain', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(LifeDomains.personal));
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endMeta = const VerificationMeta('end');
  @override
  late final GeneratedColumn<DateTime> end = GeneratedColumn<DateTime>(
      'end', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _allDayMeta = const VerificationMeta('allDay');
  @override
  late final GeneratedColumn<bool> allDay = GeneratedColumn<bool>(
      'all_day', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("all_day" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
      'task_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _goalIdMeta = const VerificationMeta('goalId');
  @override
  late final GeneratedColumn<String> goalId = GeneratedColumn<String>(
      'goal_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _recurrenceMeta =
      const VerificationMeta('recurrence');
  @override
  late final GeneratedColumn<String> recurrence = GeneratedColumn<String>(
      'recurrence', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('none'));
  static const VerificationMeta _recurrenceGroupIdMeta =
      const VerificationMeta('recurrenceGroupId');
  @override
  late final GeneratedColumn<String> recurrenceGroupId =
      GeneratedColumn<String>('recurrence_group_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _reminderMinutesBeforeMeta =
      const VerificationMeta('reminderMinutesBefore');
  @override
  late final GeneratedColumn<int> reminderMinutesBefore = GeneratedColumn<int>(
      'reminder_minutes_before', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _notificationIdMeta =
      const VerificationMeta('notificationId');
  @override
  late final GeneratedColumn<int> notificationId = GeneratedColumn<int>(
      'notification_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        domain,
        start,
        end,
        allDay,
        location,
        taskId,
        projectId,
        goalId,
        recurrence,
        recurrenceGroupId,
        reminderMinutesBefore,
        notificationId,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_events';
  @override
  VerificationContext validateIntegrity(Insertable<CalendarEventRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('domain')) {
      context.handle(_domainMeta,
          domain.isAcceptableOrUnknown(data['domain']!, _domainMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    } else if (isInserting) {
      context.missing(_startMeta);
    }
    if (data.containsKey('end')) {
      context.handle(
          _endMeta, end.isAcceptableOrUnknown(data['end']!, _endMeta));
    } else if (isInserting) {
      context.missing(_endMeta);
    }
    if (data.containsKey('all_day')) {
      context.handle(_allDayMeta,
          allDay.isAcceptableOrUnknown(data['all_day']!, _allDayMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    }
    if (data.containsKey('goal_id')) {
      context.handle(_goalIdMeta,
          goalId.isAcceptableOrUnknown(data['goal_id']!, _goalIdMeta));
    }
    if (data.containsKey('recurrence')) {
      context.handle(
          _recurrenceMeta,
          recurrence.isAcceptableOrUnknown(
              data['recurrence']!, _recurrenceMeta));
    }
    if (data.containsKey('recurrence_group_id')) {
      context.handle(
          _recurrenceGroupIdMeta,
          recurrenceGroupId.isAcceptableOrUnknown(
              data['recurrence_group_id']!, _recurrenceGroupIdMeta));
    }
    if (data.containsKey('reminder_minutes_before')) {
      context.handle(
          _reminderMinutesBeforeMeta,
          reminderMinutesBefore.isAcceptableOrUnknown(
              data['reminder_minutes_before']!, _reminderMinutesBeforeMeta));
    }
    if (data.containsKey('notification_id')) {
      context.handle(
          _notificationIdMeta,
          notificationId.isAcceptableOrUnknown(
              data['notification_id']!, _notificationIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalendarEventRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarEventRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      domain: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}domain'])!,
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start'])!,
      end: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end'])!,
      allDay: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}all_day'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_id']),
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id']),
      goalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}goal_id']),
      recurrence: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recurrence'])!,
      recurrenceGroupId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}recurrence_group_id']),
      reminderMinutesBefore: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}reminder_minutes_before']),
      notificationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}notification_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CalendarEventsTable createAlias(String alias) {
    return $CalendarEventsTable(attachedDatabase, alias);
  }
}

class CalendarEventRow extends DataClass
    implements Insertable<CalendarEventRow> {
  final String id;
  final String title;
  final String? description;
  final String domain;
  final DateTime start;
  final DateTime end;
  final bool allDay;
  final String? location;
  final String? taskId;
  final String? projectId;
  final String? goalId;
  final String recurrence;
  final String? recurrenceGroupId;
  final int? reminderMinutesBefore;
  final int? notificationId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CalendarEventRow(
      {required this.id,
      required this.title,
      this.description,
      required this.domain,
      required this.start,
      required this.end,
      required this.allDay,
      this.location,
      this.taskId,
      this.projectId,
      this.goalId,
      required this.recurrence,
      this.recurrenceGroupId,
      this.reminderMinutesBefore,
      this.notificationId,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['domain'] = Variable<String>(domain);
    map['start'] = Variable<DateTime>(start);
    map['end'] = Variable<DateTime>(end);
    map['all_day'] = Variable<bool>(allDay);
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || taskId != null) {
      map['task_id'] = Variable<String>(taskId);
    }
    if (!nullToAbsent || projectId != null) {
      map['project_id'] = Variable<String>(projectId);
    }
    if (!nullToAbsent || goalId != null) {
      map['goal_id'] = Variable<String>(goalId);
    }
    map['recurrence'] = Variable<String>(recurrence);
    if (!nullToAbsent || recurrenceGroupId != null) {
      map['recurrence_group_id'] = Variable<String>(recurrenceGroupId);
    }
    if (!nullToAbsent || reminderMinutesBefore != null) {
      map['reminder_minutes_before'] = Variable<int>(reminderMinutesBefore);
    }
    if (!nullToAbsent || notificationId != null) {
      map['notification_id'] = Variable<int>(notificationId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CalendarEventsCompanion toCompanion(bool nullToAbsent) {
    return CalendarEventsCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      domain: Value(domain),
      start: Value(start),
      end: Value(end),
      allDay: Value(allDay),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      taskId:
          taskId == null && nullToAbsent ? const Value.absent() : Value(taskId),
      projectId: projectId == null && nullToAbsent
          ? const Value.absent()
          : Value(projectId),
      goalId:
          goalId == null && nullToAbsent ? const Value.absent() : Value(goalId),
      recurrence: Value(recurrence),
      recurrenceGroupId: recurrenceGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(recurrenceGroupId),
      reminderMinutesBefore: reminderMinutesBefore == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderMinutesBefore),
      notificationId: notificationId == null && nullToAbsent
          ? const Value.absent()
          : Value(notificationId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CalendarEventRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarEventRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      domain: serializer.fromJson<String>(json['domain']),
      start: serializer.fromJson<DateTime>(json['start']),
      end: serializer.fromJson<DateTime>(json['end']),
      allDay: serializer.fromJson<bool>(json['allDay']),
      location: serializer.fromJson<String?>(json['location']),
      taskId: serializer.fromJson<String?>(json['taskId']),
      projectId: serializer.fromJson<String?>(json['projectId']),
      goalId: serializer.fromJson<String?>(json['goalId']),
      recurrence: serializer.fromJson<String>(json['recurrence']),
      recurrenceGroupId:
          serializer.fromJson<String?>(json['recurrenceGroupId']),
      reminderMinutesBefore:
          serializer.fromJson<int?>(json['reminderMinutesBefore']),
      notificationId: serializer.fromJson<int?>(json['notificationId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'domain': serializer.toJson<String>(domain),
      'start': serializer.toJson<DateTime>(start),
      'end': serializer.toJson<DateTime>(end),
      'allDay': serializer.toJson<bool>(allDay),
      'location': serializer.toJson<String?>(location),
      'taskId': serializer.toJson<String?>(taskId),
      'projectId': serializer.toJson<String?>(projectId),
      'goalId': serializer.toJson<String?>(goalId),
      'recurrence': serializer.toJson<String>(recurrence),
      'recurrenceGroupId': serializer.toJson<String?>(recurrenceGroupId),
      'reminderMinutesBefore': serializer.toJson<int?>(reminderMinutesBefore),
      'notificationId': serializer.toJson<int?>(notificationId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CalendarEventRow copyWith(
          {String? id,
          String? title,
          Value<String?> description = const Value.absent(),
          String? domain,
          DateTime? start,
          DateTime? end,
          bool? allDay,
          Value<String?> location = const Value.absent(),
          Value<String?> taskId = const Value.absent(),
          Value<String?> projectId = const Value.absent(),
          Value<String?> goalId = const Value.absent(),
          String? recurrence,
          Value<String?> recurrenceGroupId = const Value.absent(),
          Value<int?> reminderMinutesBefore = const Value.absent(),
          Value<int?> notificationId = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      CalendarEventRow(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        domain: domain ?? this.domain,
        start: start ?? this.start,
        end: end ?? this.end,
        allDay: allDay ?? this.allDay,
        location: location.present ? location.value : this.location,
        taskId: taskId.present ? taskId.value : this.taskId,
        projectId: projectId.present ? projectId.value : this.projectId,
        goalId: goalId.present ? goalId.value : this.goalId,
        recurrence: recurrence ?? this.recurrence,
        recurrenceGroupId: recurrenceGroupId.present
            ? recurrenceGroupId.value
            : this.recurrenceGroupId,
        reminderMinutesBefore: reminderMinutesBefore.present
            ? reminderMinutesBefore.value
            : this.reminderMinutesBefore,
        notificationId:
            notificationId.present ? notificationId.value : this.notificationId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CalendarEventRow copyWithCompanion(CalendarEventsCompanion data) {
    return CalendarEventRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      domain: data.domain.present ? data.domain.value : this.domain,
      start: data.start.present ? data.start.value : this.start,
      end: data.end.present ? data.end.value : this.end,
      allDay: data.allDay.present ? data.allDay.value : this.allDay,
      location: data.location.present ? data.location.value : this.location,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      goalId: data.goalId.present ? data.goalId.value : this.goalId,
      recurrence:
          data.recurrence.present ? data.recurrence.value : this.recurrence,
      recurrenceGroupId: data.recurrenceGroupId.present
          ? data.recurrenceGroupId.value
          : this.recurrenceGroupId,
      reminderMinutesBefore: data.reminderMinutesBefore.present
          ? data.reminderMinutesBefore.value
          : this.reminderMinutesBefore,
      notificationId: data.notificationId.present
          ? data.notificationId.value
          : this.notificationId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEventRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('domain: $domain, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('allDay: $allDay, ')
          ..write('location: $location, ')
          ..write('taskId: $taskId, ')
          ..write('projectId: $projectId, ')
          ..write('goalId: $goalId, ')
          ..write('recurrence: $recurrence, ')
          ..write('recurrenceGroupId: $recurrenceGroupId, ')
          ..write('reminderMinutesBefore: $reminderMinutesBefore, ')
          ..write('notificationId: $notificationId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      description,
      domain,
      start,
      end,
      allDay,
      location,
      taskId,
      projectId,
      goalId,
      recurrence,
      recurrenceGroupId,
      reminderMinutesBefore,
      notificationId,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarEventRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.domain == this.domain &&
          other.start == this.start &&
          other.end == this.end &&
          other.allDay == this.allDay &&
          other.location == this.location &&
          other.taskId == this.taskId &&
          other.projectId == this.projectId &&
          other.goalId == this.goalId &&
          other.recurrence == this.recurrence &&
          other.recurrenceGroupId == this.recurrenceGroupId &&
          other.reminderMinutesBefore == this.reminderMinutesBefore &&
          other.notificationId == this.notificationId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CalendarEventsCompanion extends UpdateCompanion<CalendarEventRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> domain;
  final Value<DateTime> start;
  final Value<DateTime> end;
  final Value<bool> allDay;
  final Value<String?> location;
  final Value<String?> taskId;
  final Value<String?> projectId;
  final Value<String?> goalId;
  final Value<String> recurrence;
  final Value<String?> recurrenceGroupId;
  final Value<int?> reminderMinutesBefore;
  final Value<int?> notificationId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CalendarEventsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.domain = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
    this.allDay = const Value.absent(),
    this.location = const Value.absent(),
    this.taskId = const Value.absent(),
    this.projectId = const Value.absent(),
    this.goalId = const Value.absent(),
    this.recurrence = const Value.absent(),
    this.recurrenceGroupId = const Value.absent(),
    this.reminderMinutesBefore = const Value.absent(),
    this.notificationId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CalendarEventsCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    this.domain = const Value.absent(),
    required DateTime start,
    required DateTime end,
    this.allDay = const Value.absent(),
    this.location = const Value.absent(),
    this.taskId = const Value.absent(),
    this.projectId = const Value.absent(),
    this.goalId = const Value.absent(),
    this.recurrence = const Value.absent(),
    this.recurrenceGroupId = const Value.absent(),
    this.reminderMinutesBefore = const Value.absent(),
    this.notificationId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        start = Value(start),
        end = Value(end);
  static Insertable<CalendarEventRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? domain,
    Expression<DateTime>? start,
    Expression<DateTime>? end,
    Expression<bool>? allDay,
    Expression<String>? location,
    Expression<String>? taskId,
    Expression<String>? projectId,
    Expression<String>? goalId,
    Expression<String>? recurrence,
    Expression<String>? recurrenceGroupId,
    Expression<int>? reminderMinutesBefore,
    Expression<int>? notificationId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (domain != null) 'domain': domain,
      if (start != null) 'start': start,
      if (end != null) 'end': end,
      if (allDay != null) 'all_day': allDay,
      if (location != null) 'location': location,
      if (taskId != null) 'task_id': taskId,
      if (projectId != null) 'project_id': projectId,
      if (goalId != null) 'goal_id': goalId,
      if (recurrence != null) 'recurrence': recurrence,
      if (recurrenceGroupId != null) 'recurrence_group_id': recurrenceGroupId,
      if (reminderMinutesBefore != null)
        'reminder_minutes_before': reminderMinutesBefore,
      if (notificationId != null) 'notification_id': notificationId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CalendarEventsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<String>? domain,
      Value<DateTime>? start,
      Value<DateTime>? end,
      Value<bool>? allDay,
      Value<String?>? location,
      Value<String?>? taskId,
      Value<String?>? projectId,
      Value<String?>? goalId,
      Value<String>? recurrence,
      Value<String?>? recurrenceGroupId,
      Value<int?>? reminderMinutesBefore,
      Value<int?>? notificationId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return CalendarEventsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      domain: domain ?? this.domain,
      start: start ?? this.start,
      end: end ?? this.end,
      allDay: allDay ?? this.allDay,
      location: location ?? this.location,
      taskId: taskId ?? this.taskId,
      projectId: projectId ?? this.projectId,
      goalId: goalId ?? this.goalId,
      recurrence: recurrence ?? this.recurrence,
      recurrenceGroupId: recurrenceGroupId ?? this.recurrenceGroupId,
      reminderMinutesBefore:
          reminderMinutesBefore ?? this.reminderMinutesBefore,
      notificationId: notificationId ?? this.notificationId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (domain.present) {
      map['domain'] = Variable<String>(domain.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (end.present) {
      map['end'] = Variable<DateTime>(end.value);
    }
    if (allDay.present) {
      map['all_day'] = Variable<bool>(allDay.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (goalId.present) {
      map['goal_id'] = Variable<String>(goalId.value);
    }
    if (recurrence.present) {
      map['recurrence'] = Variable<String>(recurrence.value);
    }
    if (recurrenceGroupId.present) {
      map['recurrence_group_id'] = Variable<String>(recurrenceGroupId.value);
    }
    if (reminderMinutesBefore.present) {
      map['reminder_minutes_before'] =
          Variable<int>(reminderMinutesBefore.value);
    }
    if (notificationId.present) {
      map['notification_id'] = Variable<int>(notificationId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEventsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('domain: $domain, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('allDay: $allDay, ')
          ..write('location: $location, ')
          ..write('taskId: $taskId, ')
          ..write('projectId: $projectId, ')
          ..write('goalId: $goalId, ')
          ..write('recurrence: $recurrence, ')
          ..write('recurrenceGroupId: $recurrenceGroupId, ')
          ..write('reminderMinutesBefore: $reminderMinutesBefore, ')
          ..write('notificationId: $notificationId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AccountsTable extends Accounts
    with TableInfo<$AccountsTable, AccountRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('cash'));
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('TZS'));
  static const VerificationMeta _openingBalanceMeta =
      const VerificationMeta('openingBalance');
  @override
  late final GeneratedColumn<double> openingBalance = GeneratedColumn<double>(
      'opening_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, type, currency, openingBalance, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<AccountRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
          _openingBalanceMeta,
          openingBalance.isAcceptableOrUnknown(
              data['opening_balance']!, _openingBalanceMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      openingBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}opening_balance'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }
}

class AccountRow extends DataClass implements Insertable<AccountRow> {
  final String id;
  final String name;
  final String type;
  final String currency;
  final double openingBalance;
  final DateTime createdAt;
  const AccountRow(
      {required this.id,
      required this.name,
      required this.type,
      required this.currency,
      required this.openingBalance,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['currency'] = Variable<String>(currency);
    map['opening_balance'] = Variable<double>(openingBalance);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      currency: Value(currency),
      openingBalance: Value(openingBalance),
      createdAt: Value(createdAt),
    );
  }

  factory AccountRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      currency: serializer.fromJson<String>(json['currency']),
      openingBalance: serializer.fromJson<double>(json['openingBalance']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'currency': serializer.toJson<String>(currency),
      'openingBalance': serializer.toJson<double>(openingBalance),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AccountRow copyWith(
          {String? id,
          String? name,
          String? type,
          String? currency,
          double? openingBalance,
          DateTime? createdAt}) =>
      AccountRow(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        currency: currency ?? this.currency,
        openingBalance: openingBalance ?? this.openingBalance,
        createdAt: createdAt ?? this.createdAt,
      );
  AccountRow copyWithCompanion(AccountsCompanion data) {
    return AccountRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      currency: data.currency.present ? data.currency.value : this.currency,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('currency: $currency, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, type, currency, openingBalance, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.currency == this.currency &&
          other.openingBalance == this.openingBalance &&
          other.createdAt == this.createdAt);
}

class AccountsCompanion extends UpdateCompanion<AccountRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<String> currency;
  final Value<double> openingBalance;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.currency = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountsCompanion.insert({
    required String id,
    required String name,
    this.type = const Value.absent(),
    this.currency = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<AccountRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? currency,
    Expression<double>? openingBalance,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (currency != null) 'currency': currency,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? type,
      Value<String>? currency,
      Value<double>? openingBalance,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return AccountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      currency: currency ?? this.currency,
      openingBalance: openingBalance ?? this.openingBalance,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<double>(openingBalance.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('currency: $currency, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, TransactionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
      'account_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _merchantMeta =
      const VerificationMeta('merchant');
  @override
  late final GeneratedColumn<String> merchant = GeneratedColumn<String>(
      'merchant', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _occurredAtMeta =
      const VerificationMeta('occurredAt');
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
      'occurred_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _plannedMeta =
      const VerificationMeta('planned');
  @override
  late final GeneratedColumn<bool> planned = GeneratedColumn<bool>(
      'planned', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("planned" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _necessaryMeta =
      const VerificationMeta('necessary');
  @override
  late final GeneratedColumn<bool> necessary = GeneratedColumn<bool>(
      'necessary', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("necessary" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        accountId,
        type,
        amount,
        category,
        merchant,
        note,
        occurredAt,
        planned,
        necessary,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('merchant')) {
      context.handle(_merchantMeta,
          merchant.isAcceptableOrUnknown(data['merchant']!, _merchantMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
          _occurredAtMeta,
          occurredAt.isAcceptableOrUnknown(
              data['occurred_at']!, _occurredAtMeta));
    }
    if (data.containsKey('planned')) {
      context.handle(_plannedMeta,
          planned.isAcceptableOrUnknown(data['planned']!, _plannedMeta));
    }
    if (data.containsKey('necessary')) {
      context.handle(_necessaryMeta,
          necessary.isAcceptableOrUnknown(data['necessary']!, _necessaryMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      merchant: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}merchant']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      occurredAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}occurred_at'])!,
      planned: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}planned'])!,
      necessary: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}necessary'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class TransactionRow extends DataClass implements Insertable<TransactionRow> {
  final String id;
  final String accountId;
  final String type;
  final double amount;
  final String? category;
  final String? merchant;
  final String? note;
  final DateTime occurredAt;
  final bool planned;
  final bool necessary;
  final DateTime createdAt;
  const TransactionRow(
      {required this.id,
      required this.accountId,
      required this.type,
      required this.amount,
      this.category,
      this.merchant,
      this.note,
      required this.occurredAt,
      required this.planned,
      required this.necessary,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['account_id'] = Variable<String>(accountId);
    map['type'] = Variable<String>(type);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || merchant != null) {
      map['merchant'] = Variable<String>(merchant);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    map['planned'] = Variable<bool>(planned);
    map['necessary'] = Variable<bool>(necessary);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      accountId: Value(accountId),
      type: Value(type),
      amount: Value(amount),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      merchant: merchant == null && nullToAbsent
          ? const Value.absent()
          : Value(merchant),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      occurredAt: Value(occurredAt),
      planned: Value(planned),
      necessary: Value(necessary),
      createdAt: Value(createdAt),
    );
  }

  factory TransactionRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionRow(
      id: serializer.fromJson<String>(json['id']),
      accountId: serializer.fromJson<String>(json['accountId']),
      type: serializer.fromJson<String>(json['type']),
      amount: serializer.fromJson<double>(json['amount']),
      category: serializer.fromJson<String?>(json['category']),
      merchant: serializer.fromJson<String?>(json['merchant']),
      note: serializer.fromJson<String?>(json['note']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      planned: serializer.fromJson<bool>(json['planned']),
      necessary: serializer.fromJson<bool>(json['necessary']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'accountId': serializer.toJson<String>(accountId),
      'type': serializer.toJson<String>(type),
      'amount': serializer.toJson<double>(amount),
      'category': serializer.toJson<String?>(category),
      'merchant': serializer.toJson<String?>(merchant),
      'note': serializer.toJson<String?>(note),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'planned': serializer.toJson<bool>(planned),
      'necessary': serializer.toJson<bool>(necessary),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TransactionRow copyWith(
          {String? id,
          String? accountId,
          String? type,
          double? amount,
          Value<String?> category = const Value.absent(),
          Value<String?> merchant = const Value.absent(),
          Value<String?> note = const Value.absent(),
          DateTime? occurredAt,
          bool? planned,
          bool? necessary,
          DateTime? createdAt}) =>
      TransactionRow(
        id: id ?? this.id,
        accountId: accountId ?? this.accountId,
        type: type ?? this.type,
        amount: amount ?? this.amount,
        category: category.present ? category.value : this.category,
        merchant: merchant.present ? merchant.value : this.merchant,
        note: note.present ? note.value : this.note,
        occurredAt: occurredAt ?? this.occurredAt,
        planned: planned ?? this.planned,
        necessary: necessary ?? this.necessary,
        createdAt: createdAt ?? this.createdAt,
      );
  TransactionRow copyWithCompanion(TransactionsCompanion data) {
    return TransactionRow(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      type: data.type.present ? data.type.value : this.type,
      amount: data.amount.present ? data.amount.value : this.amount,
      category: data.category.present ? data.category.value : this.category,
      merchant: data.merchant.present ? data.merchant.value : this.merchant,
      note: data.note.present ? data.note.value : this.note,
      occurredAt:
          data.occurredAt.present ? data.occurredAt.value : this.occurredAt,
      planned: data.planned.present ? data.planned.value : this.planned,
      necessary: data.necessary.present ? data.necessary.value : this.necessary,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRow(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('category: $category, ')
          ..write('merchant: $merchant, ')
          ..write('note: $note, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('planned: $planned, ')
          ..write('necessary: $necessary, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, accountId, type, amount, category,
      merchant, note, occurredAt, planned, necessary, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionRow &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.type == this.type &&
          other.amount == this.amount &&
          other.category == this.category &&
          other.merchant == this.merchant &&
          other.note == this.note &&
          other.occurredAt == this.occurredAt &&
          other.planned == this.planned &&
          other.necessary == this.necessary &&
          other.createdAt == this.createdAt);
}

class TransactionsCompanion extends UpdateCompanion<TransactionRow> {
  final Value<String> id;
  final Value<String> accountId;
  final Value<String> type;
  final Value<double> amount;
  final Value<String?> category;
  final Value<String?> merchant;
  final Value<String?> note;
  final Value<DateTime> occurredAt;
  final Value<bool> planned;
  final Value<bool> necessary;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.type = const Value.absent(),
    this.amount = const Value.absent(),
    this.category = const Value.absent(),
    this.merchant = const Value.absent(),
    this.note = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.planned = const Value.absent(),
    this.necessary = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionsCompanion.insert({
    required String id,
    required String accountId,
    required String type,
    required double amount,
    this.category = const Value.absent(),
    this.merchant = const Value.absent(),
    this.note = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.planned = const Value.absent(),
    this.necessary = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        accountId = Value(accountId),
        type = Value(type),
        amount = Value(amount);
  static Insertable<TransactionRow> custom({
    Expression<String>? id,
    Expression<String>? accountId,
    Expression<String>? type,
    Expression<double>? amount,
    Expression<String>? category,
    Expression<String>? merchant,
    Expression<String>? note,
    Expression<DateTime>? occurredAt,
    Expression<bool>? planned,
    Expression<bool>? necessary,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (type != null) 'type': type,
      if (amount != null) 'amount': amount,
      if (category != null) 'category': category,
      if (merchant != null) 'merchant': merchant,
      if (note != null) 'note': note,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (planned != null) 'planned': planned,
      if (necessary != null) 'necessary': necessary,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? accountId,
      Value<String>? type,
      Value<double>? amount,
      Value<String?>? category,
      Value<String?>? merchant,
      Value<String?>? note,
      Value<DateTime>? occurredAt,
      Value<bool>? planned,
      Value<bool>? necessary,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      merchant: merchant ?? this.merchant,
      note: note ?? this.note,
      occurredAt: occurredAt ?? this.occurredAt,
      planned: planned ?? this.planned,
      necessary: necessary ?? this.necessary,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (merchant.present) {
      map['merchant'] = Variable<String>(merchant.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (planned.present) {
      map['planned'] = Variable<bool>(planned.value);
    }
    if (necessary.present) {
      map['necessary'] = Variable<bool>(necessary.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('category: $category, ')
          ..write('merchant: $merchant, ')
          ..write('note: $note, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('planned: $planned, ')
          ..write('necessary: $necessary, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BudgetsTable extends Budgets with TableInfo<$BudgetsTable, BudgetRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _monthlyLimitMeta =
      const VerificationMeta('monthlyLimit');
  @override
  late final GeneratedColumn<double> monthlyLimit = GeneratedColumn<double>(
      'monthly_limit', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedColumn<String> month = GeneratedColumn<String>(
      'month', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, category, monthlyLimit, month, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budgets';
  @override
  VerificationContext validateIntegrity(Insertable<BudgetRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('monthly_limit')) {
      context.handle(
          _monthlyLimitMeta,
          monthlyLimit.isAcceptableOrUnknown(
              data['monthly_limit']!, _monthlyLimitMeta));
    } else if (isInserting) {
      context.missing(_monthlyLimitMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month']!, _monthMeta));
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BudgetRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BudgetRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      monthlyLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}monthly_limit'])!,
      month: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}month'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $BudgetsTable createAlias(String alias) {
    return $BudgetsTable(attachedDatabase, alias);
  }
}

class BudgetRow extends DataClass implements Insertable<BudgetRow> {
  final String id;
  final String category;
  final double monthlyLimit;
  final String month;
  final DateTime createdAt;
  const BudgetRow(
      {required this.id,
      required this.category,
      required this.monthlyLimit,
      required this.month,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['category'] = Variable<String>(category);
    map['monthly_limit'] = Variable<double>(monthlyLimit);
    map['month'] = Variable<String>(month);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BudgetsCompanion toCompanion(bool nullToAbsent) {
    return BudgetsCompanion(
      id: Value(id),
      category: Value(category),
      monthlyLimit: Value(monthlyLimit),
      month: Value(month),
      createdAt: Value(createdAt),
    );
  }

  factory BudgetRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BudgetRow(
      id: serializer.fromJson<String>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      monthlyLimit: serializer.fromJson<double>(json['monthlyLimit']),
      month: serializer.fromJson<String>(json['month']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'category': serializer.toJson<String>(category),
      'monthlyLimit': serializer.toJson<double>(monthlyLimit),
      'month': serializer.toJson<String>(month),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BudgetRow copyWith(
          {String? id,
          String? category,
          double? monthlyLimit,
          String? month,
          DateTime? createdAt}) =>
      BudgetRow(
        id: id ?? this.id,
        category: category ?? this.category,
        monthlyLimit: monthlyLimit ?? this.monthlyLimit,
        month: month ?? this.month,
        createdAt: createdAt ?? this.createdAt,
      );
  BudgetRow copyWithCompanion(BudgetsCompanion data) {
    return BudgetRow(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      monthlyLimit: data.monthlyLimit.present
          ? data.monthlyLimit.value
          : this.monthlyLimit,
      month: data.month.present ? data.month.value : this.month,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BudgetRow(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('monthlyLimit: $monthlyLimit, ')
          ..write('month: $month, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, category, monthlyLimit, month, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BudgetRow &&
          other.id == this.id &&
          other.category == this.category &&
          other.monthlyLimit == this.monthlyLimit &&
          other.month == this.month &&
          other.createdAt == this.createdAt);
}

class BudgetsCompanion extends UpdateCompanion<BudgetRow> {
  final Value<String> id;
  final Value<String> category;
  final Value<double> monthlyLimit;
  final Value<String> month;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const BudgetsCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.monthlyLimit = const Value.absent(),
    this.month = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BudgetsCompanion.insert({
    required String id,
    required String category,
    required double monthlyLimit,
    required String month,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        category = Value(category),
        monthlyLimit = Value(monthlyLimit),
        month = Value(month);
  static Insertable<BudgetRow> custom({
    Expression<String>? id,
    Expression<String>? category,
    Expression<double>? monthlyLimit,
    Expression<String>? month,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (monthlyLimit != null) 'monthly_limit': monthlyLimit,
      if (month != null) 'month': month,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BudgetsCompanion copyWith(
      {Value<String>? id,
      Value<String>? category,
      Value<double>? monthlyLimit,
      Value<String>? month,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return BudgetsCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      monthlyLimit: monthlyLimit ?? this.monthlyLimit,
      month: month ?? this.month,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (monthlyLimit.present) {
      map['monthly_limit'] = Variable<double>(monthlyLimit.value);
    }
    if (month.present) {
      map['month'] = Variable<String>(month.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetsCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('monthlyLimit: $monthlyLimit, ')
          ..write('month: $month, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $JournalEntriesTable extends JournalEntries
    with TableInfo<$JournalEntriesTable, JournalEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _winMeta = const VerificationMeta('win');
  @override
  late final GeneratedColumn<String> win = GeneratedColumn<String>(
      'win', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _problemMeta =
      const VerificationMeta('problem');
  @override
  late final GeneratedColumn<String> problem = GeneratedColumn<String>(
      'problem', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lessonMeta = const VerificationMeta('lesson');
  @override
  late final GeneratedColumn<String> lesson = GeneratedColumn<String>(
      'lesson', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _gratitudeMeta =
      const VerificationMeta('gratitude');
  @override
  late final GeneratedColumn<String> gratitude = GeneratedColumn<String>(
      'gratitude', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priorityTomorrowMeta =
      const VerificationMeta('priorityTomorrow');
  @override
  late final GeneratedColumn<String> priorityTomorrow = GeneratedColumn<String>(
      'priority_tomorrow', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        win,
        problem,
        lesson,
        gratitude,
        priorityTomorrow,
        notes,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_entries';
  @override
  VerificationContext validateIntegrity(Insertable<JournalEntryRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('win')) {
      context.handle(
          _winMeta, win.isAcceptableOrUnknown(data['win']!, _winMeta));
    }
    if (data.containsKey('problem')) {
      context.handle(_problemMeta,
          problem.isAcceptableOrUnknown(data['problem']!, _problemMeta));
    }
    if (data.containsKey('lesson')) {
      context.handle(_lessonMeta,
          lesson.isAcceptableOrUnknown(data['lesson']!, _lessonMeta));
    }
    if (data.containsKey('gratitude')) {
      context.handle(_gratitudeMeta,
          gratitude.isAcceptableOrUnknown(data['gratitude']!, _gratitudeMeta));
    }
    if (data.containsKey('priority_tomorrow')) {
      context.handle(
          _priorityTomorrowMeta,
          priorityTomorrow.isAcceptableOrUnknown(
              data['priority_tomorrow']!, _priorityTomorrowMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalEntryRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      win: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}win']),
      problem: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}problem']),
      lesson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lesson']),
      gratitude: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gratitude']),
      priorityTomorrow: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}priority_tomorrow']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $JournalEntriesTable createAlias(String alias) {
    return $JournalEntriesTable(attachedDatabase, alias);
  }
}

class JournalEntryRow extends DataClass implements Insertable<JournalEntryRow> {
  final String id;
  final DateTime date;
  final String? win;
  final String? problem;
  final String? lesson;
  final String? gratitude;
  final String? priorityTomorrow;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const JournalEntryRow(
      {required this.id,
      required this.date,
      this.win,
      this.problem,
      this.lesson,
      this.gratitude,
      this.priorityTomorrow,
      this.notes,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || win != null) {
      map['win'] = Variable<String>(win);
    }
    if (!nullToAbsent || problem != null) {
      map['problem'] = Variable<String>(problem);
    }
    if (!nullToAbsent || lesson != null) {
      map['lesson'] = Variable<String>(lesson);
    }
    if (!nullToAbsent || gratitude != null) {
      map['gratitude'] = Variable<String>(gratitude);
    }
    if (!nullToAbsent || priorityTomorrow != null) {
      map['priority_tomorrow'] = Variable<String>(priorityTomorrow);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  JournalEntriesCompanion toCompanion(bool nullToAbsent) {
    return JournalEntriesCompanion(
      id: Value(id),
      date: Value(date),
      win: win == null && nullToAbsent ? const Value.absent() : Value(win),
      problem: problem == null && nullToAbsent
          ? const Value.absent()
          : Value(problem),
      lesson:
          lesson == null && nullToAbsent ? const Value.absent() : Value(lesson),
      gratitude: gratitude == null && nullToAbsent
          ? const Value.absent()
          : Value(gratitude),
      priorityTomorrow: priorityTomorrow == null && nullToAbsent
          ? const Value.absent()
          : Value(priorityTomorrow),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory JournalEntryRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalEntryRow(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      win: serializer.fromJson<String?>(json['win']),
      problem: serializer.fromJson<String?>(json['problem']),
      lesson: serializer.fromJson<String?>(json['lesson']),
      gratitude: serializer.fromJson<String?>(json['gratitude']),
      priorityTomorrow: serializer.fromJson<String?>(json['priorityTomorrow']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'win': serializer.toJson<String?>(win),
      'problem': serializer.toJson<String?>(problem),
      'lesson': serializer.toJson<String?>(lesson),
      'gratitude': serializer.toJson<String?>(gratitude),
      'priorityTomorrow': serializer.toJson<String?>(priorityTomorrow),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  JournalEntryRow copyWith(
          {String? id,
          DateTime? date,
          Value<String?> win = const Value.absent(),
          Value<String?> problem = const Value.absent(),
          Value<String?> lesson = const Value.absent(),
          Value<String?> gratitude = const Value.absent(),
          Value<String?> priorityTomorrow = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      JournalEntryRow(
        id: id ?? this.id,
        date: date ?? this.date,
        win: win.present ? win.value : this.win,
        problem: problem.present ? problem.value : this.problem,
        lesson: lesson.present ? lesson.value : this.lesson,
        gratitude: gratitude.present ? gratitude.value : this.gratitude,
        priorityTomorrow: priorityTomorrow.present
            ? priorityTomorrow.value
            : this.priorityTomorrow,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  JournalEntryRow copyWithCompanion(JournalEntriesCompanion data) {
    return JournalEntryRow(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      win: data.win.present ? data.win.value : this.win,
      problem: data.problem.present ? data.problem.value : this.problem,
      lesson: data.lesson.present ? data.lesson.value : this.lesson,
      gratitude: data.gratitude.present ? data.gratitude.value : this.gratitude,
      priorityTomorrow: data.priorityTomorrow.present
          ? data.priorityTomorrow.value
          : this.priorityTomorrow,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntryRow(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('win: $win, ')
          ..write('problem: $problem, ')
          ..write('lesson: $lesson, ')
          ..write('gratitude: $gratitude, ')
          ..write('priorityTomorrow: $priorityTomorrow, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, win, problem, lesson, gratitude,
      priorityTomorrow, notes, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalEntryRow &&
          other.id == this.id &&
          other.date == this.date &&
          other.win == this.win &&
          other.problem == this.problem &&
          other.lesson == this.lesson &&
          other.gratitude == this.gratitude &&
          other.priorityTomorrow == this.priorityTomorrow &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class JournalEntriesCompanion extends UpdateCompanion<JournalEntryRow> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<String?> win;
  final Value<String?> problem;
  final Value<String?> lesson;
  final Value<String?> gratitude;
  final Value<String?> priorityTomorrow;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const JournalEntriesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.win = const Value.absent(),
    this.problem = const Value.absent(),
    this.lesson = const Value.absent(),
    this.gratitude = const Value.absent(),
    this.priorityTomorrow = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JournalEntriesCompanion.insert({
    required String id,
    required DateTime date,
    this.win = const Value.absent(),
    this.problem = const Value.absent(),
    this.lesson = const Value.absent(),
    this.gratitude = const Value.absent(),
    this.priorityTomorrow = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        date = Value(date);
  static Insertable<JournalEntryRow> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<String>? win,
    Expression<String>? problem,
    Expression<String>? lesson,
    Expression<String>? gratitude,
    Expression<String>? priorityTomorrow,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (win != null) 'win': win,
      if (problem != null) 'problem': problem,
      if (lesson != null) 'lesson': lesson,
      if (gratitude != null) 'gratitude': gratitude,
      if (priorityTomorrow != null) 'priority_tomorrow': priorityTomorrow,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JournalEntriesCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? date,
      Value<String?>? win,
      Value<String?>? problem,
      Value<String?>? lesson,
      Value<String?>? gratitude,
      Value<String?>? priorityTomorrow,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return JournalEntriesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      win: win ?? this.win,
      problem: problem ?? this.problem,
      lesson: lesson ?? this.lesson,
      gratitude: gratitude ?? this.gratitude,
      priorityTomorrow: priorityTomorrow ?? this.priorityTomorrow,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (win.present) {
      map['win'] = Variable<String>(win.value);
    }
    if (problem.present) {
      map['problem'] = Variable<String>(problem.value);
    }
    if (lesson.present) {
      map['lesson'] = Variable<String>(lesson.value);
    }
    if (gratitude.present) {
      map['gratitude'] = Variable<String>(gratitude.value);
    }
    if (priorityTomorrow.present) {
      map['priority_tomorrow'] = Variable<String>(priorityTomorrow.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntriesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('win: $win, ')
          ..write('problem: $problem, ')
          ..write('lesson: $lesson, ')
          ..write('gratitude: $gratitude, ')
          ..write('priorityTomorrow: $priorityTomorrow, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HabitsTable extends Habits with TableInfo<$HabitsTable, HabitRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('binary'));
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _targetPerWeekMeta =
      const VerificationMeta('targetPerWeek');
  @override
  late final GeneratedColumn<int> targetPerWeek = GeneratedColumn<int>(
      'target_per_week', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _targetAmountMeta =
      const VerificationMeta('targetAmount');
  @override
  late final GeneratedColumn<double> targetAmount = GeneratedColumn<double>(
      'target_amount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _domainMeta = const VerificationMeta('domain');
  @override
  late final GeneratedColumn<String> domain = GeneratedColumn<String>(
      'domain', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _archivedMeta =
      const VerificationMeta('archived');
  @override
  late final GeneratedColumn<bool> archived = GeneratedColumn<bool>(
      'archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        type,
        unit,
        targetPerWeek,
        targetAmount,
        domain,
        archived,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habits';
  @override
  VerificationContext validateIntegrity(Insertable<HabitRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    }
    if (data.containsKey('target_per_week')) {
      context.handle(
          _targetPerWeekMeta,
          targetPerWeek.isAcceptableOrUnknown(
              data['target_per_week']!, _targetPerWeekMeta));
    }
    if (data.containsKey('target_amount')) {
      context.handle(
          _targetAmountMeta,
          targetAmount.isAcceptableOrUnknown(
              data['target_amount']!, _targetAmountMeta));
    }
    if (data.containsKey('domain')) {
      context.handle(_domainMeta,
          domain.isAcceptableOrUnknown(data['domain']!, _domainMeta));
    }
    if (data.containsKey('archived')) {
      context.handle(_archivedMeta,
          archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit']),
      targetPerWeek: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}target_per_week']),
      targetAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}target_amount']),
      domain: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}domain']),
      archived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}archived'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $HabitsTable createAlias(String alias) {
    return $HabitsTable(attachedDatabase, alias);
  }
}

class HabitRow extends DataClass implements Insertable<HabitRow> {
  final String id;
  final String title;
  final String type;
  final String? unit;
  final int? targetPerWeek;
  final double? targetAmount;
  final String? domain;
  final bool archived;
  final DateTime createdAt;
  const HabitRow(
      {required this.id,
      required this.title,
      required this.type,
      this.unit,
      this.targetPerWeek,
      this.targetAmount,
      this.domain,
      required this.archived,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || targetPerWeek != null) {
      map['target_per_week'] = Variable<int>(targetPerWeek);
    }
    if (!nullToAbsent || targetAmount != null) {
      map['target_amount'] = Variable<double>(targetAmount);
    }
    if (!nullToAbsent || domain != null) {
      map['domain'] = Variable<String>(domain);
    }
    map['archived'] = Variable<bool>(archived);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HabitsCompanion toCompanion(bool nullToAbsent) {
    return HabitsCompanion(
      id: Value(id),
      title: Value(title),
      type: Value(type),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      targetPerWeek: targetPerWeek == null && nullToAbsent
          ? const Value.absent()
          : Value(targetPerWeek),
      targetAmount: targetAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(targetAmount),
      domain:
          domain == null && nullToAbsent ? const Value.absent() : Value(domain),
      archived: Value(archived),
      createdAt: Value(createdAt),
    );
  }

  factory HabitRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<String>(json['type']),
      unit: serializer.fromJson<String?>(json['unit']),
      targetPerWeek: serializer.fromJson<int?>(json['targetPerWeek']),
      targetAmount: serializer.fromJson<double?>(json['targetAmount']),
      domain: serializer.fromJson<String?>(json['domain']),
      archived: serializer.fromJson<bool>(json['archived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<String>(type),
      'unit': serializer.toJson<String?>(unit),
      'targetPerWeek': serializer.toJson<int?>(targetPerWeek),
      'targetAmount': serializer.toJson<double?>(targetAmount),
      'domain': serializer.toJson<String?>(domain),
      'archived': serializer.toJson<bool>(archived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  HabitRow copyWith(
          {String? id,
          String? title,
          String? type,
          Value<String?> unit = const Value.absent(),
          Value<int?> targetPerWeek = const Value.absent(),
          Value<double?> targetAmount = const Value.absent(),
          Value<String?> domain = const Value.absent(),
          bool? archived,
          DateTime? createdAt}) =>
      HabitRow(
        id: id ?? this.id,
        title: title ?? this.title,
        type: type ?? this.type,
        unit: unit.present ? unit.value : this.unit,
        targetPerWeek:
            targetPerWeek.present ? targetPerWeek.value : this.targetPerWeek,
        targetAmount:
            targetAmount.present ? targetAmount.value : this.targetAmount,
        domain: domain.present ? domain.value : this.domain,
        archived: archived ?? this.archived,
        createdAt: createdAt ?? this.createdAt,
      );
  HabitRow copyWithCompanion(HabitsCompanion data) {
    return HabitRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      unit: data.unit.present ? data.unit.value : this.unit,
      targetPerWeek: data.targetPerWeek.present
          ? data.targetPerWeek.value
          : this.targetPerWeek,
      targetAmount: data.targetAmount.present
          ? data.targetAmount.value
          : this.targetAmount,
      domain: data.domain.present ? data.domain.value : this.domain,
      archived: data.archived.present ? data.archived.value : this.archived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('unit: $unit, ')
          ..write('targetPerWeek: $targetPerWeek, ')
          ..write('targetAmount: $targetAmount, ')
          ..write('domain: $domain, ')
          ..write('archived: $archived, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, type, unit, targetPerWeek,
      targetAmount, domain, archived, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.type == this.type &&
          other.unit == this.unit &&
          other.targetPerWeek == this.targetPerWeek &&
          other.targetAmount == this.targetAmount &&
          other.domain == this.domain &&
          other.archived == this.archived &&
          other.createdAt == this.createdAt);
}

class HabitsCompanion extends UpdateCompanion<HabitRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> type;
  final Value<String?> unit;
  final Value<int?> targetPerWeek;
  final Value<double?> targetAmount;
  final Value<String?> domain;
  final Value<bool> archived;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const HabitsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.unit = const Value.absent(),
    this.targetPerWeek = const Value.absent(),
    this.targetAmount = const Value.absent(),
    this.domain = const Value.absent(),
    this.archived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitsCompanion.insert({
    required String id,
    required String title,
    this.type = const Value.absent(),
    this.unit = const Value.absent(),
    this.targetPerWeek = const Value.absent(),
    this.targetAmount = const Value.absent(),
    this.domain = const Value.absent(),
    this.archived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title);
  static Insertable<HabitRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? type,
    Expression<String>? unit,
    Expression<int>? targetPerWeek,
    Expression<double>? targetAmount,
    Expression<String>? domain,
    Expression<bool>? archived,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (unit != null) 'unit': unit,
      if (targetPerWeek != null) 'target_per_week': targetPerWeek,
      if (targetAmount != null) 'target_amount': targetAmount,
      if (domain != null) 'domain': domain,
      if (archived != null) 'archived': archived,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? type,
      Value<String?>? unit,
      Value<int?>? targetPerWeek,
      Value<double?>? targetAmount,
      Value<String?>? domain,
      Value<bool>? archived,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return HabitsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      unit: unit ?? this.unit,
      targetPerWeek: targetPerWeek ?? this.targetPerWeek,
      targetAmount: targetAmount ?? this.targetAmount,
      domain: domain ?? this.domain,
      archived: archived ?? this.archived,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (targetPerWeek.present) {
      map['target_per_week'] = Variable<int>(targetPerWeek.value);
    }
    if (targetAmount.present) {
      map['target_amount'] = Variable<double>(targetAmount.value);
    }
    if (domain.present) {
      map['domain'] = Variable<String>(domain.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('unit: $unit, ')
          ..write('targetPerWeek: $targetPerWeek, ')
          ..write('targetAmount: $targetAmount, ')
          ..write('domain: $domain, ')
          ..write('archived: $archived, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HabitLogsTable extends HabitLogs
    with TableInfo<$HabitLogsTable, HabitLogRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _habitIdMeta =
      const VerificationMeta('habitId');
  @override
  late final GeneratedColumn<String> habitId = GeneratedColumn<String>(
      'habit_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
      'completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, habitId, date, completed, amount, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_logs';
  @override
  VerificationContext validateIntegrity(Insertable<HabitLogRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('habit_id')) {
      context.handle(_habitIdMeta,
          habitId.isAcceptableOrUnknown(data['habit_id']!, _habitIdMeta));
    } else if (isInserting) {
      context.missing(_habitIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitLogRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitLogRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      habitId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}habit_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completed'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $HabitLogsTable createAlias(String alias) {
    return $HabitLogsTable(attachedDatabase, alias);
  }
}

class HabitLogRow extends DataClass implements Insertable<HabitLogRow> {
  final String id;
  final String habitId;
  final DateTime date;
  final bool completed;
  final double? amount;
  final DateTime createdAt;
  const HabitLogRow(
      {required this.id,
      required this.habitId,
      required this.date,
      required this.completed,
      this.amount,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['habit_id'] = Variable<String>(habitId);
    map['date'] = Variable<DateTime>(date);
    map['completed'] = Variable<bool>(completed);
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HabitLogsCompanion toCompanion(bool nullToAbsent) {
    return HabitLogsCompanion(
      id: Value(id),
      habitId: Value(habitId),
      date: Value(date),
      completed: Value(completed),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      createdAt: Value(createdAt),
    );
  }

  factory HabitLogRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitLogRow(
      id: serializer.fromJson<String>(json['id']),
      habitId: serializer.fromJson<String>(json['habitId']),
      date: serializer.fromJson<DateTime>(json['date']),
      completed: serializer.fromJson<bool>(json['completed']),
      amount: serializer.fromJson<double?>(json['amount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'habitId': serializer.toJson<String>(habitId),
      'date': serializer.toJson<DateTime>(date),
      'completed': serializer.toJson<bool>(completed),
      'amount': serializer.toJson<double?>(amount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  HabitLogRow copyWith(
          {String? id,
          String? habitId,
          DateTime? date,
          bool? completed,
          Value<double?> amount = const Value.absent(),
          DateTime? createdAt}) =>
      HabitLogRow(
        id: id ?? this.id,
        habitId: habitId ?? this.habitId,
        date: date ?? this.date,
        completed: completed ?? this.completed,
        amount: amount.present ? amount.value : this.amount,
        createdAt: createdAt ?? this.createdAt,
      );
  HabitLogRow copyWithCompanion(HabitLogsCompanion data) {
    return HabitLogRow(
      id: data.id.present ? data.id.value : this.id,
      habitId: data.habitId.present ? data.habitId.value : this.habitId,
      date: data.date.present ? data.date.value : this.date,
      completed: data.completed.present ? data.completed.value : this.completed,
      amount: data.amount.present ? data.amount.value : this.amount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitLogRow(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('date: $date, ')
          ..write('completed: $completed, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, habitId, date, completed, amount, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitLogRow &&
          other.id == this.id &&
          other.habitId == this.habitId &&
          other.date == this.date &&
          other.completed == this.completed &&
          other.amount == this.amount &&
          other.createdAt == this.createdAt);
}

class HabitLogsCompanion extends UpdateCompanion<HabitLogRow> {
  final Value<String> id;
  final Value<String> habitId;
  final Value<DateTime> date;
  final Value<bool> completed;
  final Value<double?> amount;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const HabitLogsCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.date = const Value.absent(),
    this.completed = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitLogsCompanion.insert({
    required String id,
    required String habitId,
    required DateTime date,
    this.completed = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        habitId = Value(habitId),
        date = Value(date);
  static Insertable<HabitLogRow> custom({
    Expression<String>? id,
    Expression<String>? habitId,
    Expression<DateTime>? date,
    Expression<bool>? completed,
    Expression<double>? amount,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (date != null) 'date': date,
      if (completed != null) 'completed': completed,
      if (amount != null) 'amount': amount,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitLogsCompanion copyWith(
      {Value<String>? id,
      Value<String>? habitId,
      Value<DateTime>? date,
      Value<bool>? completed,
      Value<double?>? amount,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return HabitLogsCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      date: date ?? this.date,
      completed: completed ?? this.completed,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<String>(habitId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitLogsCompanion(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('date: $date, ')
          ..write('completed: $completed, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FocusSessionsTable extends FocusSessions
    with TableInfo<$FocusSessionsTable, FocusSessionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FocusSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
      'task_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _projectIdMeta =
      const VerificationMeta('projectId');
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
      'project_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _plannedMinutesMeta =
      const VerificationMeta('plannedMinutes');
  @override
  late final GeneratedColumn<int> plannedMinutes = GeneratedColumn<int>(
      'planned_minutes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _endedAtMeta =
      const VerificationMeta('endedAt');
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
      'ended_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _focusedMinutesMeta =
      const VerificationMeta('focusedMinutes');
  @override
  late final GeneratedColumn<int> focusedMinutes = GeneratedColumn<int>(
      'focused_minutes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _interruptionsMeta =
      const VerificationMeta('interruptions');
  @override
  late final GeneratedColumn<int> interruptions = GeneratedColumn<int>(
      'interruptions', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        taskId,
        projectId,
        plannedMinutes,
        startedAt,
        endedAt,
        focusedMinutes,
        interruptions
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'focus_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<FocusSessionRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    }
    if (data.containsKey('project_id')) {
      context.handle(_projectIdMeta,
          projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta));
    }
    if (data.containsKey('planned_minutes')) {
      context.handle(
          _plannedMinutesMeta,
          plannedMinutes.isAcceptableOrUnknown(
              data['planned_minutes']!, _plannedMinutesMeta));
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    }
    if (data.containsKey('ended_at')) {
      context.handle(_endedAtMeta,
          endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta));
    }
    if (data.containsKey('focused_minutes')) {
      context.handle(
          _focusedMinutesMeta,
          focusedMinutes.isAcceptableOrUnknown(
              data['focused_minutes']!, _focusedMinutesMeta));
    }
    if (data.containsKey('interruptions')) {
      context.handle(
          _interruptionsMeta,
          interruptions.isAcceptableOrUnknown(
              data['interruptions']!, _interruptionsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FocusSessionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FocusSessionRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_id']),
      projectId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project_id']),
      plannedMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}planned_minutes']),
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at'])!,
      endedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ended_at']),
      focusedMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}focused_minutes']),
      interruptions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}interruptions'])!,
    );
  }

  @override
  $FocusSessionsTable createAlias(String alias) {
    return $FocusSessionsTable(attachedDatabase, alias);
  }
}

class FocusSessionRow extends DataClass implements Insertable<FocusSessionRow> {
  final String id;
  final String title;
  final String? taskId;
  final String? projectId;
  final int? plannedMinutes;
  final DateTime startedAt;
  final DateTime? endedAt;
  final int? focusedMinutes;
  final int interruptions;
  const FocusSessionRow(
      {required this.id,
      required this.title,
      this.taskId,
      this.projectId,
      this.plannedMinutes,
      required this.startedAt,
      this.endedAt,
      this.focusedMinutes,
      required this.interruptions});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || taskId != null) {
      map['task_id'] = Variable<String>(taskId);
    }
    if (!nullToAbsent || projectId != null) {
      map['project_id'] = Variable<String>(projectId);
    }
    if (!nullToAbsent || plannedMinutes != null) {
      map['planned_minutes'] = Variable<int>(plannedMinutes);
    }
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    if (!nullToAbsent || focusedMinutes != null) {
      map['focused_minutes'] = Variable<int>(focusedMinutes);
    }
    map['interruptions'] = Variable<int>(interruptions);
    return map;
  }

  FocusSessionsCompanion toCompanion(bool nullToAbsent) {
    return FocusSessionsCompanion(
      id: Value(id),
      title: Value(title),
      taskId:
          taskId == null && nullToAbsent ? const Value.absent() : Value(taskId),
      projectId: projectId == null && nullToAbsent
          ? const Value.absent()
          : Value(projectId),
      plannedMinutes: plannedMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(plannedMinutes),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      focusedMinutes: focusedMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(focusedMinutes),
      interruptions: Value(interruptions),
    );
  }

  factory FocusSessionRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FocusSessionRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      taskId: serializer.fromJson<String?>(json['taskId']),
      projectId: serializer.fromJson<String?>(json['projectId']),
      plannedMinutes: serializer.fromJson<int?>(json['plannedMinutes']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
      focusedMinutes: serializer.fromJson<int?>(json['focusedMinutes']),
      interruptions: serializer.fromJson<int>(json['interruptions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'taskId': serializer.toJson<String?>(taskId),
      'projectId': serializer.toJson<String?>(projectId),
      'plannedMinutes': serializer.toJson<int?>(plannedMinutes),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
      'focusedMinutes': serializer.toJson<int?>(focusedMinutes),
      'interruptions': serializer.toJson<int>(interruptions),
    };
  }

  FocusSessionRow copyWith(
          {String? id,
          String? title,
          Value<String?> taskId = const Value.absent(),
          Value<String?> projectId = const Value.absent(),
          Value<int?> plannedMinutes = const Value.absent(),
          DateTime? startedAt,
          Value<DateTime?> endedAt = const Value.absent(),
          Value<int?> focusedMinutes = const Value.absent(),
          int? interruptions}) =>
      FocusSessionRow(
        id: id ?? this.id,
        title: title ?? this.title,
        taskId: taskId.present ? taskId.value : this.taskId,
        projectId: projectId.present ? projectId.value : this.projectId,
        plannedMinutes:
            plannedMinutes.present ? plannedMinutes.value : this.plannedMinutes,
        startedAt: startedAt ?? this.startedAt,
        endedAt: endedAt.present ? endedAt.value : this.endedAt,
        focusedMinutes:
            focusedMinutes.present ? focusedMinutes.value : this.focusedMinutes,
        interruptions: interruptions ?? this.interruptions,
      );
  FocusSessionRow copyWithCompanion(FocusSessionsCompanion data) {
    return FocusSessionRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      plannedMinutes: data.plannedMinutes.present
          ? data.plannedMinutes.value
          : this.plannedMinutes,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      focusedMinutes: data.focusedMinutes.present
          ? data.focusedMinutes.value
          : this.focusedMinutes,
      interruptions: data.interruptions.present
          ? data.interruptions.value
          : this.interruptions,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FocusSessionRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('taskId: $taskId, ')
          ..write('projectId: $projectId, ')
          ..write('plannedMinutes: $plannedMinutes, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('focusedMinutes: $focusedMinutes, ')
          ..write('interruptions: $interruptions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, taskId, projectId, plannedMinutes,
      startedAt, endedAt, focusedMinutes, interruptions);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FocusSessionRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.taskId == this.taskId &&
          other.projectId == this.projectId &&
          other.plannedMinutes == this.plannedMinutes &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.focusedMinutes == this.focusedMinutes &&
          other.interruptions == this.interruptions);
}

class FocusSessionsCompanion extends UpdateCompanion<FocusSessionRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> taskId;
  final Value<String?> projectId;
  final Value<int?> plannedMinutes;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endedAt;
  final Value<int?> focusedMinutes;
  final Value<int> interruptions;
  final Value<int> rowid;
  const FocusSessionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.taskId = const Value.absent(),
    this.projectId = const Value.absent(),
    this.plannedMinutes = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.focusedMinutes = const Value.absent(),
    this.interruptions = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FocusSessionsCompanion.insert({
    required String id,
    required String title,
    this.taskId = const Value.absent(),
    this.projectId = const Value.absent(),
    this.plannedMinutes = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.focusedMinutes = const Value.absent(),
    this.interruptions = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title);
  static Insertable<FocusSessionRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? taskId,
    Expression<String>? projectId,
    Expression<int>? plannedMinutes,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endedAt,
    Expression<int>? focusedMinutes,
    Expression<int>? interruptions,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (taskId != null) 'task_id': taskId,
      if (projectId != null) 'project_id': projectId,
      if (plannedMinutes != null) 'planned_minutes': plannedMinutes,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (focusedMinutes != null) 'focused_minutes': focusedMinutes,
      if (interruptions != null) 'interruptions': interruptions,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FocusSessionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String?>? taskId,
      Value<String?>? projectId,
      Value<int?>? plannedMinutes,
      Value<DateTime>? startedAt,
      Value<DateTime?>? endedAt,
      Value<int?>? focusedMinutes,
      Value<int>? interruptions,
      Value<int>? rowid}) {
    return FocusSessionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      taskId: taskId ?? this.taskId,
      projectId: projectId ?? this.projectId,
      plannedMinutes: plannedMinutes ?? this.plannedMinutes,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      focusedMinutes: focusedMinutes ?? this.focusedMinutes,
      interruptions: interruptions ?? this.interruptions,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (plannedMinutes.present) {
      map['planned_minutes'] = Variable<int>(plannedMinutes.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    if (focusedMinutes.present) {
      map['focused_minutes'] = Variable<int>(focusedMinutes.value);
    }
    if (interruptions.present) {
      map['interruptions'] = Variable<int>(interruptions.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FocusSessionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('taskId: $taskId, ')
          ..write('projectId: $projectId, ')
          ..write('plannedMinutes: $plannedMinutes, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('focusedMinutes: $focusedMinutes, ')
          ..write('interruptions: $interruptions, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HealthLogsTable extends HealthLogs
    with TableInfo<$HealthLogsTable, HealthLogRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HealthLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _sleepMinutesMeta =
      const VerificationMeta('sleepMinutes');
  @override
  late final GeneratedColumn<int> sleepMinutes = GeneratedColumn<int>(
      'sleep_minutes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _weightKgMeta =
      const VerificationMeta('weightKg');
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
      'weight_kg', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _waterMlMeta =
      const VerificationMeta('waterMl');
  @override
  late final GeneratedColumn<int> waterMl = GeneratedColumn<int>(
      'water_ml', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<int> mood = GeneratedColumn<int>(
      'mood', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _energyMeta = const VerificationMeta('energy');
  @override
  late final GeneratedColumn<int> energy = GeneratedColumn<int>(
      'energy', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        sleepMinutes,
        weightKg,
        waterMl,
        mood,
        energy,
        notes,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'health_logs';
  @override
  VerificationContext validateIntegrity(Insertable<HealthLogRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('sleep_minutes')) {
      context.handle(
          _sleepMinutesMeta,
          sleepMinutes.isAcceptableOrUnknown(
              data['sleep_minutes']!, _sleepMinutesMeta));
    }
    if (data.containsKey('weight_kg')) {
      context.handle(_weightKgMeta,
          weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta));
    }
    if (data.containsKey('water_ml')) {
      context.handle(_waterMlMeta,
          waterMl.isAcceptableOrUnknown(data['water_ml']!, _waterMlMeta));
    }
    if (data.containsKey('mood')) {
      context.handle(
          _moodMeta, mood.isAcceptableOrUnknown(data['mood']!, _moodMeta));
    }
    if (data.containsKey('energy')) {
      context.handle(_energyMeta,
          energy.isAcceptableOrUnknown(data['energy']!, _energyMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HealthLogRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HealthLogRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      sleepMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sleep_minutes']),
      weightKg: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight_kg']),
      waterMl: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}water_ml']),
      mood: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mood']),
      energy: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}energy']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $HealthLogsTable createAlias(String alias) {
    return $HealthLogsTable(attachedDatabase, alias);
  }
}

class HealthLogRow extends DataClass implements Insertable<HealthLogRow> {
  final String id;
  final DateTime date;
  final int? sleepMinutes;
  final double? weightKg;
  final int? waterMl;
  final int? mood;
  final int? energy;
  final String? notes;
  final DateTime createdAt;
  const HealthLogRow(
      {required this.id,
      required this.date,
      this.sleepMinutes,
      this.weightKg,
      this.waterMl,
      this.mood,
      this.energy,
      this.notes,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || sleepMinutes != null) {
      map['sleep_minutes'] = Variable<int>(sleepMinutes);
    }
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    if (!nullToAbsent || waterMl != null) {
      map['water_ml'] = Variable<int>(waterMl);
    }
    if (!nullToAbsent || mood != null) {
      map['mood'] = Variable<int>(mood);
    }
    if (!nullToAbsent || energy != null) {
      map['energy'] = Variable<int>(energy);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HealthLogsCompanion toCompanion(bool nullToAbsent) {
    return HealthLogsCompanion(
      id: Value(id),
      date: Value(date),
      sleepMinutes: sleepMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(sleepMinutes),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
      waterMl: waterMl == null && nullToAbsent
          ? const Value.absent()
          : Value(waterMl),
      mood: mood == null && nullToAbsent ? const Value.absent() : Value(mood),
      energy:
          energy == null && nullToAbsent ? const Value.absent() : Value(energy),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory HealthLogRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HealthLogRow(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      sleepMinutes: serializer.fromJson<int?>(json['sleepMinutes']),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
      waterMl: serializer.fromJson<int?>(json['waterMl']),
      mood: serializer.fromJson<int?>(json['mood']),
      energy: serializer.fromJson<int?>(json['energy']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'sleepMinutes': serializer.toJson<int?>(sleepMinutes),
      'weightKg': serializer.toJson<double?>(weightKg),
      'waterMl': serializer.toJson<int?>(waterMl),
      'mood': serializer.toJson<int?>(mood),
      'energy': serializer.toJson<int?>(energy),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  HealthLogRow copyWith(
          {String? id,
          DateTime? date,
          Value<int?> sleepMinutes = const Value.absent(),
          Value<double?> weightKg = const Value.absent(),
          Value<int?> waterMl = const Value.absent(),
          Value<int?> mood = const Value.absent(),
          Value<int?> energy = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt}) =>
      HealthLogRow(
        id: id ?? this.id,
        date: date ?? this.date,
        sleepMinutes:
            sleepMinutes.present ? sleepMinutes.value : this.sleepMinutes,
        weightKg: weightKg.present ? weightKg.value : this.weightKg,
        waterMl: waterMl.present ? waterMl.value : this.waterMl,
        mood: mood.present ? mood.value : this.mood,
        energy: energy.present ? energy.value : this.energy,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
      );
  HealthLogRow copyWithCompanion(HealthLogsCompanion data) {
    return HealthLogRow(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      sleepMinutes: data.sleepMinutes.present
          ? data.sleepMinutes.value
          : this.sleepMinutes,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      waterMl: data.waterMl.present ? data.waterMl.value : this.waterMl,
      mood: data.mood.present ? data.mood.value : this.mood,
      energy: data.energy.present ? data.energy.value : this.energy,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HealthLogRow(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('sleepMinutes: $sleepMinutes, ')
          ..write('weightKg: $weightKg, ')
          ..write('waterMl: $waterMl, ')
          ..write('mood: $mood, ')
          ..write('energy: $energy, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, sleepMinutes, weightKg, waterMl,
      mood, energy, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HealthLogRow &&
          other.id == this.id &&
          other.date == this.date &&
          other.sleepMinutes == this.sleepMinutes &&
          other.weightKg == this.weightKg &&
          other.waterMl == this.waterMl &&
          other.mood == this.mood &&
          other.energy == this.energy &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class HealthLogsCompanion extends UpdateCompanion<HealthLogRow> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<int?> sleepMinutes;
  final Value<double?> weightKg;
  final Value<int?> waterMl;
  final Value<int?> mood;
  final Value<int?> energy;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const HealthLogsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.sleepMinutes = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.waterMl = const Value.absent(),
    this.mood = const Value.absent(),
    this.energy = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HealthLogsCompanion.insert({
    required String id,
    required DateTime date,
    this.sleepMinutes = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.waterMl = const Value.absent(),
    this.mood = const Value.absent(),
    this.energy = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        date = Value(date);
  static Insertable<HealthLogRow> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<int>? sleepMinutes,
    Expression<double>? weightKg,
    Expression<int>? waterMl,
    Expression<int>? mood,
    Expression<int>? energy,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (sleepMinutes != null) 'sleep_minutes': sleepMinutes,
      if (weightKg != null) 'weight_kg': weightKg,
      if (waterMl != null) 'water_ml': waterMl,
      if (mood != null) 'mood': mood,
      if (energy != null) 'energy': energy,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HealthLogsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? date,
      Value<int?>? sleepMinutes,
      Value<double?>? weightKg,
      Value<int?>? waterMl,
      Value<int?>? mood,
      Value<int?>? energy,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return HealthLogsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      sleepMinutes: sleepMinutes ?? this.sleepMinutes,
      weightKg: weightKg ?? this.weightKg,
      waterMl: waterMl ?? this.waterMl,
      mood: mood ?? this.mood,
      energy: energy ?? this.energy,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (sleepMinutes.present) {
      map['sleep_minutes'] = Variable<int>(sleepMinutes.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (waterMl.present) {
      map['water_ml'] = Variable<int>(waterMl.value);
    }
    if (mood.present) {
      map['mood'] = Variable<int>(mood.value);
    }
    if (energy.present) {
      map['energy'] = Variable<int>(energy.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HealthLogsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('sleepMinutes: $sleepMinutes, ')
          ..write('weightKg: $weightKg, ')
          ..write('waterMl: $waterMl, ')
          ..write('mood: $mood, ')
          ..write('energy: $energy, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudySessionsTable extends StudySessions
    with TableInfo<$StudySessionsTable, StudySessionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudySessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _topicMeta = const VerificationMeta('topic');
  @override
  late final GeneratedColumn<String> topic = GeneratedColumn<String>(
      'topic', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _minutesMeta =
      const VerificationMeta('minutes');
  @override
  late final GeneratedColumn<int> minutes = GeneratedColumn<int>(
      'minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, subject, topic, date, minutes, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'study_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<StudySessionRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('topic')) {
      context.handle(
          _topicMeta, topic.isAcceptableOrUnknown(data['topic']!, _topicMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('minutes')) {
      context.handle(_minutesMeta,
          minutes.isAcceptableOrUnknown(data['minutes']!, _minutesMeta));
    } else if (isInserting) {
      context.missing(_minutesMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudySessionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudySessionRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
      topic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}topic']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      minutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}minutes'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $StudySessionsTable createAlias(String alias) {
    return $StudySessionsTable(attachedDatabase, alias);
  }
}

class StudySessionRow extends DataClass implements Insertable<StudySessionRow> {
  final String id;
  final String subject;
  final String? topic;
  final DateTime date;
  final int minutes;
  final DateTime createdAt;
  const StudySessionRow(
      {required this.id,
      required this.subject,
      this.topic,
      required this.date,
      required this.minutes,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['subject'] = Variable<String>(subject);
    if (!nullToAbsent || topic != null) {
      map['topic'] = Variable<String>(topic);
    }
    map['date'] = Variable<DateTime>(date);
    map['minutes'] = Variable<int>(minutes);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  StudySessionsCompanion toCompanion(bool nullToAbsent) {
    return StudySessionsCompanion(
      id: Value(id),
      subject: Value(subject),
      topic:
          topic == null && nullToAbsent ? const Value.absent() : Value(topic),
      date: Value(date),
      minutes: Value(minutes),
      createdAt: Value(createdAt),
    );
  }

  factory StudySessionRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudySessionRow(
      id: serializer.fromJson<String>(json['id']),
      subject: serializer.fromJson<String>(json['subject']),
      topic: serializer.fromJson<String?>(json['topic']),
      date: serializer.fromJson<DateTime>(json['date']),
      minutes: serializer.fromJson<int>(json['minutes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'subject': serializer.toJson<String>(subject),
      'topic': serializer.toJson<String?>(topic),
      'date': serializer.toJson<DateTime>(date),
      'minutes': serializer.toJson<int>(minutes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  StudySessionRow copyWith(
          {String? id,
          String? subject,
          Value<String?> topic = const Value.absent(),
          DateTime? date,
          int? minutes,
          DateTime? createdAt}) =>
      StudySessionRow(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        topic: topic.present ? topic.value : this.topic,
        date: date ?? this.date,
        minutes: minutes ?? this.minutes,
        createdAt: createdAt ?? this.createdAt,
      );
  StudySessionRow copyWithCompanion(StudySessionsCompanion data) {
    return StudySessionRow(
      id: data.id.present ? data.id.value : this.id,
      subject: data.subject.present ? data.subject.value : this.subject,
      topic: data.topic.present ? data.topic.value : this.topic,
      date: data.date.present ? data.date.value : this.date,
      minutes: data.minutes.present ? data.minutes.value : this.minutes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudySessionRow(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('topic: $topic, ')
          ..write('date: $date, ')
          ..write('minutes: $minutes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, subject, topic, date, minutes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudySessionRow &&
          other.id == this.id &&
          other.subject == this.subject &&
          other.topic == this.topic &&
          other.date == this.date &&
          other.minutes == this.minutes &&
          other.createdAt == this.createdAt);
}

class StudySessionsCompanion extends UpdateCompanion<StudySessionRow> {
  final Value<String> id;
  final Value<String> subject;
  final Value<String?> topic;
  final Value<DateTime> date;
  final Value<int> minutes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const StudySessionsCompanion({
    this.id = const Value.absent(),
    this.subject = const Value.absent(),
    this.topic = const Value.absent(),
    this.date = const Value.absent(),
    this.minutes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudySessionsCompanion.insert({
    required String id,
    required String subject,
    this.topic = const Value.absent(),
    this.date = const Value.absent(),
    required int minutes,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        subject = Value(subject),
        minutes = Value(minutes);
  static Insertable<StudySessionRow> custom({
    Expression<String>? id,
    Expression<String>? subject,
    Expression<String>? topic,
    Expression<DateTime>? date,
    Expression<int>? minutes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subject != null) 'subject': subject,
      if (topic != null) 'topic': topic,
      if (date != null) 'date': date,
      if (minutes != null) 'minutes': minutes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudySessionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? subject,
      Value<String?>? topic,
      Value<DateTime>? date,
      Value<int>? minutes,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return StudySessionsCompanion(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      topic: topic ?? this.topic,
      date: date ?? this.date,
      minutes: minutes ?? this.minutes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (topic.present) {
      map['topic'] = Variable<String>(topic.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (minutes.present) {
      map['minutes'] = Variable<int>(minutes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudySessionsCompanion(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('topic: $topic, ')
          ..write('date: $date, ')
          ..write('minutes: $minutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CareerPositionsTable extends CareerPositions
    with TableInfo<$CareerPositionsTable, CareerPositionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CareerPositionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _employerMeta =
      const VerificationMeta('employer');
  @override
  late final GeneratedColumn<String> employer = GeneratedColumn<String>(
      'employer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _salaryMeta = const VerificationMeta('salary');
  @override
  late final GeneratedColumn<double> salary = GeneratedColumn<double>(
      'salary', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, employer, role, startDate, endDate, salary, notes, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'career_positions';
  @override
  VerificationContext validateIntegrity(Insertable<CareerPositionRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('employer')) {
      context.handle(_employerMeta,
          employer.isAcceptableOrUnknown(data['employer']!, _employerMeta));
    } else if (isInserting) {
      context.missing(_employerMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('salary')) {
      context.handle(_salaryMeta,
          salary.isAcceptableOrUnknown(data['salary']!, _salaryMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CareerPositionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CareerPositionRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      employer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employer'])!,
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      salary: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}salary']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $CareerPositionsTable createAlias(String alias) {
    return $CareerPositionsTable(attachedDatabase, alias);
  }
}

class CareerPositionRow extends DataClass
    implements Insertable<CareerPositionRow> {
  final String id;
  final String employer;
  final String role;
  final DateTime startDate;
  final DateTime? endDate;
  final double? salary;
  final String? notes;
  final DateTime createdAt;
  const CareerPositionRow(
      {required this.id,
      required this.employer,
      required this.role,
      required this.startDate,
      this.endDate,
      this.salary,
      this.notes,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['employer'] = Variable<String>(employer);
    map['role'] = Variable<String>(role);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || salary != null) {
      map['salary'] = Variable<double>(salary);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CareerPositionsCompanion toCompanion(bool nullToAbsent) {
    return CareerPositionsCompanion(
      id: Value(id),
      employer: Value(employer),
      role: Value(role),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      salary:
          salary == null && nullToAbsent ? const Value.absent() : Value(salary),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory CareerPositionRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CareerPositionRow(
      id: serializer.fromJson<String>(json['id']),
      employer: serializer.fromJson<String>(json['employer']),
      role: serializer.fromJson<String>(json['role']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      salary: serializer.fromJson<double?>(json['salary']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'employer': serializer.toJson<String>(employer),
      'role': serializer.toJson<String>(role),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'salary': serializer.toJson<double?>(salary),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CareerPositionRow copyWith(
          {String? id,
          String? employer,
          String? role,
          DateTime? startDate,
          Value<DateTime?> endDate = const Value.absent(),
          Value<double?> salary = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt}) =>
      CareerPositionRow(
        id: id ?? this.id,
        employer: employer ?? this.employer,
        role: role ?? this.role,
        startDate: startDate ?? this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        salary: salary.present ? salary.value : this.salary,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
      );
  CareerPositionRow copyWithCompanion(CareerPositionsCompanion data) {
    return CareerPositionRow(
      id: data.id.present ? data.id.value : this.id,
      employer: data.employer.present ? data.employer.value : this.employer,
      role: data.role.present ? data.role.value : this.role,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      salary: data.salary.present ? data.salary.value : this.salary,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CareerPositionRow(')
          ..write('id: $id, ')
          ..write('employer: $employer, ')
          ..write('role: $role, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('salary: $salary, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, employer, role, startDate, endDate, salary, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CareerPositionRow &&
          other.id == this.id &&
          other.employer == this.employer &&
          other.role == this.role &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.salary == this.salary &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class CareerPositionsCompanion extends UpdateCompanion<CareerPositionRow> {
  final Value<String> id;
  final Value<String> employer;
  final Value<String> role;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<double?> salary;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CareerPositionsCompanion({
    this.id = const Value.absent(),
    this.employer = const Value.absent(),
    this.role = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.salary = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CareerPositionsCompanion.insert({
    required String id,
    required String employer,
    required String role,
    required DateTime startDate,
    this.endDate = const Value.absent(),
    this.salary = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        employer = Value(employer),
        role = Value(role),
        startDate = Value(startDate);
  static Insertable<CareerPositionRow> custom({
    Expression<String>? id,
    Expression<String>? employer,
    Expression<String>? role,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<double>? salary,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (employer != null) 'employer': employer,
      if (role != null) 'role': role,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (salary != null) 'salary': salary,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CareerPositionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? employer,
      Value<String>? role,
      Value<DateTime>? startDate,
      Value<DateTime?>? endDate,
      Value<double?>? salary,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return CareerPositionsCompanion(
      id: id ?? this.id,
      employer: employer ?? this.employer,
      role: role ?? this.role,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      salary: salary ?? this.salary,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (employer.present) {
      map['employer'] = Variable<String>(employer.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (salary.present) {
      map['salary'] = Variable<double>(salary.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CareerPositionsCompanion(')
          ..write('id: $id, ')
          ..write('employer: $employer, ')
          ..write('role: $role, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('salary: $salary, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CareerAchievementsTable extends CareerAchievements
    with TableInfo<$CareerAchievementsTable, CareerAchievementRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CareerAchievementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _positionIdMeta =
      const VerificationMeta('positionId');
  @override
  late final GeneratedColumn<String> positionId = GeneratedColumn<String>(
      'position_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, positionId, title, description, date, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'career_achievements';
  @override
  VerificationContext validateIntegrity(
      Insertable<CareerAchievementRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('position_id')) {
      context.handle(
          _positionIdMeta,
          positionId.isAcceptableOrUnknown(
              data['position_id']!, _positionIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CareerAchievementRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CareerAchievementRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      positionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}position_id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $CareerAchievementsTable createAlias(String alias) {
    return $CareerAchievementsTable(attachedDatabase, alias);
  }
}

class CareerAchievementRow extends DataClass
    implements Insertable<CareerAchievementRow> {
  final String id;
  final String? positionId;
  final String title;
  final String? description;
  final DateTime date;
  final DateTime createdAt;
  const CareerAchievementRow(
      {required this.id,
      this.positionId,
      required this.title,
      this.description,
      required this.date,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || positionId != null) {
      map['position_id'] = Variable<String>(positionId);
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['date'] = Variable<DateTime>(date);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CareerAchievementsCompanion toCompanion(bool nullToAbsent) {
    return CareerAchievementsCompanion(
      id: Value(id),
      positionId: positionId == null && nullToAbsent
          ? const Value.absent()
          : Value(positionId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      date: Value(date),
      createdAt: Value(createdAt),
    );
  }

  factory CareerAchievementRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CareerAchievementRow(
      id: serializer.fromJson<String>(json['id']),
      positionId: serializer.fromJson<String?>(json['positionId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      date: serializer.fromJson<DateTime>(json['date']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'positionId': serializer.toJson<String?>(positionId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'date': serializer.toJson<DateTime>(date),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CareerAchievementRow copyWith(
          {String? id,
          Value<String?> positionId = const Value.absent(),
          String? title,
          Value<String?> description = const Value.absent(),
          DateTime? date,
          DateTime? createdAt}) =>
      CareerAchievementRow(
        id: id ?? this.id,
        positionId: positionId.present ? positionId.value : this.positionId,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        date: date ?? this.date,
        createdAt: createdAt ?? this.createdAt,
      );
  CareerAchievementRow copyWithCompanion(CareerAchievementsCompanion data) {
    return CareerAchievementRow(
      id: data.id.present ? data.id.value : this.id,
      positionId:
          data.positionId.present ? data.positionId.value : this.positionId,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      date: data.date.present ? data.date.value : this.date,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CareerAchievementRow(')
          ..write('id: $id, ')
          ..write('positionId: $positionId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, positionId, title, description, date, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CareerAchievementRow &&
          other.id == this.id &&
          other.positionId == this.positionId &&
          other.title == this.title &&
          other.description == this.description &&
          other.date == this.date &&
          other.createdAt == this.createdAt);
}

class CareerAchievementsCompanion
    extends UpdateCompanion<CareerAchievementRow> {
  final Value<String> id;
  final Value<String?> positionId;
  final Value<String> title;
  final Value<String?> description;
  final Value<DateTime> date;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CareerAchievementsCompanion({
    this.id = const Value.absent(),
    this.positionId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CareerAchievementsCompanion.insert({
    required String id,
    this.positionId = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title);
  static Insertable<CareerAchievementRow> custom({
    Expression<String>? id,
    Expression<String>? positionId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? date,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (positionId != null) 'position_id': positionId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (date != null) 'date': date,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CareerAchievementsCompanion copyWith(
      {Value<String>? id,
      Value<String?>? positionId,
      Value<String>? title,
      Value<String?>? description,
      Value<DateTime>? date,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return CareerAchievementsCompanion(
      id: id ?? this.id,
      positionId: positionId ?? this.positionId,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (positionId.present) {
      map['position_id'] = Variable<String>(positionId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CareerAchievementsCompanion(')
          ..write('id: $id, ')
          ..write('positionId: $positionId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BusinessClientsTable extends BusinessClients
    with TableInfo<$BusinessClientsTable, BusinessClientRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusinessClientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contactMeta =
      const VerificationMeta('contact');
  @override
  late final GeneratedColumn<String> contact = GeneratedColumn<String>(
      'contact', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, name, contact, notes, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'business_clients';
  @override
  VerificationContext validateIntegrity(Insertable<BusinessClientRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('contact')) {
      context.handle(_contactMeta,
          contact.isAcceptableOrUnknown(data['contact']!, _contactMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BusinessClientRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusinessClientRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      contact: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $BusinessClientsTable createAlias(String alias) {
    return $BusinessClientsTable(attachedDatabase, alias);
  }
}

class BusinessClientRow extends DataClass
    implements Insertable<BusinessClientRow> {
  final String id;
  final String name;
  final String? contact;
  final String? notes;
  final DateTime createdAt;
  const BusinessClientRow(
      {required this.id,
      required this.name,
      this.contact,
      this.notes,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || contact != null) {
      map['contact'] = Variable<String>(contact);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BusinessClientsCompanion toCompanion(bool nullToAbsent) {
    return BusinessClientsCompanion(
      id: Value(id),
      name: Value(name),
      contact: contact == null && nullToAbsent
          ? const Value.absent()
          : Value(contact),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory BusinessClientRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusinessClientRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      contact: serializer.fromJson<String?>(json['contact']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'contact': serializer.toJson<String?>(contact),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BusinessClientRow copyWith(
          {String? id,
          String? name,
          Value<String?> contact = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt}) =>
      BusinessClientRow(
        id: id ?? this.id,
        name: name ?? this.name,
        contact: contact.present ? contact.value : this.contact,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
      );
  BusinessClientRow copyWithCompanion(BusinessClientsCompanion data) {
    return BusinessClientRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      contact: data.contact.present ? data.contact.value : this.contact,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusinessClientRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('contact: $contact, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, contact, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusinessClientRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.contact == this.contact &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class BusinessClientsCompanion extends UpdateCompanion<BusinessClientRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> contact;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const BusinessClientsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.contact = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BusinessClientsCompanion.insert({
    required String id,
    required String name,
    this.contact = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<BusinessClientRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? contact,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (contact != null) 'contact': contact,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BusinessClientsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? contact,
      Value<String?>? notes,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return BusinessClientsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      contact: contact ?? this.contact,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(contact.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessClientsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('contact: $contact, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BusinessProjectsTable extends BusinessProjects
    with TableInfo<$BusinessProjectsTable, BusinessProjectRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusinessProjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
      'client_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(BusinessProjectStatuses.active));
  static const VerificationMeta _revenueMeta =
      const VerificationMeta('revenue');
  @override
  late final GeneratedColumn<double> revenue = GeneratedColumn<double>(
      'revenue', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _expensesMeta =
      const VerificationMeta('expenses');
  @override
  late final GeneratedColumn<double> expenses = GeneratedColumn<double>(
      'expenses', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _hoursSpentMeta =
      const VerificationMeta('hoursSpent');
  @override
  late final GeneratedColumn<double> hoursSpent = GeneratedColumn<double>(
      'hours_spent', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, clientId, name, status, revenue, expenses, hoursSpent, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'business_projects';
  @override
  VerificationContext validateIntegrity(Insertable<BusinessProjectRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('revenue')) {
      context.handle(_revenueMeta,
          revenue.isAcceptableOrUnknown(data['revenue']!, _revenueMeta));
    }
    if (data.containsKey('expenses')) {
      context.handle(_expensesMeta,
          expenses.isAcceptableOrUnknown(data['expenses']!, _expensesMeta));
    }
    if (data.containsKey('hours_spent')) {
      context.handle(
          _hoursSpentMeta,
          hoursSpent.isAcceptableOrUnknown(
              data['hours_spent']!, _hoursSpentMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BusinessProjectRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusinessProjectRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}client_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      revenue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}revenue'])!,
      expenses: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}expenses'])!,
      hoursSpent: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}hours_spent'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $BusinessProjectsTable createAlias(String alias) {
    return $BusinessProjectsTable(attachedDatabase, alias);
  }
}

class BusinessProjectRow extends DataClass
    implements Insertable<BusinessProjectRow> {
  final String id;
  final String? clientId;
  final String name;
  final String status;
  final double revenue;
  final double expenses;
  final double hoursSpent;
  final DateTime createdAt;
  const BusinessProjectRow(
      {required this.id,
      this.clientId,
      required this.name,
      required this.status,
      required this.revenue,
      required this.expenses,
      required this.hoursSpent,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || clientId != null) {
      map['client_id'] = Variable<String>(clientId);
    }
    map['name'] = Variable<String>(name);
    map['status'] = Variable<String>(status);
    map['revenue'] = Variable<double>(revenue);
    map['expenses'] = Variable<double>(expenses);
    map['hours_spent'] = Variable<double>(hoursSpent);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BusinessProjectsCompanion toCompanion(bool nullToAbsent) {
    return BusinessProjectsCompanion(
      id: Value(id),
      clientId: clientId == null && nullToAbsent
          ? const Value.absent()
          : Value(clientId),
      name: Value(name),
      status: Value(status),
      revenue: Value(revenue),
      expenses: Value(expenses),
      hoursSpent: Value(hoursSpent),
      createdAt: Value(createdAt),
    );
  }

  factory BusinessProjectRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusinessProjectRow(
      id: serializer.fromJson<String>(json['id']),
      clientId: serializer.fromJson<String?>(json['clientId']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<String>(json['status']),
      revenue: serializer.fromJson<double>(json['revenue']),
      expenses: serializer.fromJson<double>(json['expenses']),
      hoursSpent: serializer.fromJson<double>(json['hoursSpent']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'clientId': serializer.toJson<String?>(clientId),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<String>(status),
      'revenue': serializer.toJson<double>(revenue),
      'expenses': serializer.toJson<double>(expenses),
      'hoursSpent': serializer.toJson<double>(hoursSpent),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BusinessProjectRow copyWith(
          {String? id,
          Value<String?> clientId = const Value.absent(),
          String? name,
          String? status,
          double? revenue,
          double? expenses,
          double? hoursSpent,
          DateTime? createdAt}) =>
      BusinessProjectRow(
        id: id ?? this.id,
        clientId: clientId.present ? clientId.value : this.clientId,
        name: name ?? this.name,
        status: status ?? this.status,
        revenue: revenue ?? this.revenue,
        expenses: expenses ?? this.expenses,
        hoursSpent: hoursSpent ?? this.hoursSpent,
        createdAt: createdAt ?? this.createdAt,
      );
  BusinessProjectRow copyWithCompanion(BusinessProjectsCompanion data) {
    return BusinessProjectRow(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      name: data.name.present ? data.name.value : this.name,
      status: data.status.present ? data.status.value : this.status,
      revenue: data.revenue.present ? data.revenue.value : this.revenue,
      expenses: data.expenses.present ? data.expenses.value : this.expenses,
      hoursSpent:
          data.hoursSpent.present ? data.hoursSpent.value : this.hoursSpent,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusinessProjectRow(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('revenue: $revenue, ')
          ..write('expenses: $expenses, ')
          ..write('hoursSpent: $hoursSpent, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, clientId, name, status, revenue, expenses, hoursSpent, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusinessProjectRow &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.name == this.name &&
          other.status == this.status &&
          other.revenue == this.revenue &&
          other.expenses == this.expenses &&
          other.hoursSpent == this.hoursSpent &&
          other.createdAt == this.createdAt);
}

class BusinessProjectsCompanion extends UpdateCompanion<BusinessProjectRow> {
  final Value<String> id;
  final Value<String?> clientId;
  final Value<String> name;
  final Value<String> status;
  final Value<double> revenue;
  final Value<double> expenses;
  final Value<double> hoursSpent;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const BusinessProjectsCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.revenue = const Value.absent(),
    this.expenses = const Value.absent(),
    this.hoursSpent = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BusinessProjectsCompanion.insert({
    required String id,
    this.clientId = const Value.absent(),
    required String name,
    this.status = const Value.absent(),
    this.revenue = const Value.absent(),
    this.expenses = const Value.absent(),
    this.hoursSpent = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<BusinessProjectRow> custom({
    Expression<String>? id,
    Expression<String>? clientId,
    Expression<String>? name,
    Expression<String>? status,
    Expression<double>? revenue,
    Expression<double>? expenses,
    Expression<double>? hoursSpent,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (revenue != null) 'revenue': revenue,
      if (expenses != null) 'expenses': expenses,
      if (hoursSpent != null) 'hours_spent': hoursSpent,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BusinessProjectsCompanion copyWith(
      {Value<String>? id,
      Value<String?>? clientId,
      Value<String>? name,
      Value<String>? status,
      Value<double>? revenue,
      Value<double>? expenses,
      Value<double>? hoursSpent,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return BusinessProjectsCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      name: name ?? this.name,
      status: status ?? this.status,
      revenue: revenue ?? this.revenue,
      expenses: expenses ?? this.expenses,
      hoursSpent: hoursSpent ?? this.hoursSpent,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (revenue.present) {
      map['revenue'] = Variable<double>(revenue.value);
    }
    if (expenses.present) {
      map['expenses'] = Variable<double>(expenses.value);
    }
    if (hoursSpent.present) {
      map['hours_spent'] = Variable<double>(hoursSpent.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessProjectsCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('revenue: $revenue, ')
          ..write('expenses: $expenses, ')
          ..write('hoursSpent: $hoursSpent, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VehiclesTable extends Vehicles
    with TableInfo<$VehiclesTable, VehicleRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehiclesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(VehicleTypes.motorcycle));
  static const VerificationMeta _odometerKmMeta =
      const VerificationMeta('odometerKm');
  @override
  late final GeneratedColumn<double> odometerKm = GeneratedColumn<double>(
      'odometer_km', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, name, type, odometerKm, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicles';
  @override
  VerificationContext validateIntegrity(Insertable<VehicleRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('odometer_km')) {
      context.handle(
          _odometerKmMeta,
          odometerKm.isAcceptableOrUnknown(
              data['odometer_km']!, _odometerKmMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehicleRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      odometerKm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}odometer_km'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $VehiclesTable createAlias(String alias) {
    return $VehiclesTable(attachedDatabase, alias);
  }
}

class VehicleRow extends DataClass implements Insertable<VehicleRow> {
  final String id;
  final String name;
  final String type;
  final double odometerKm;
  final DateTime createdAt;
  const VehicleRow(
      {required this.id,
      required this.name,
      required this.type,
      required this.odometerKm,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['odometer_km'] = Variable<double>(odometerKm);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  VehiclesCompanion toCompanion(bool nullToAbsent) {
    return VehiclesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      odometerKm: Value(odometerKm),
      createdAt: Value(createdAt),
    );
  }

  factory VehicleRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      odometerKm: serializer.fromJson<double>(json['odometerKm']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'odometerKm': serializer.toJson<double>(odometerKm),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  VehicleRow copyWith(
          {String? id,
          String? name,
          String? type,
          double? odometerKm,
          DateTime? createdAt}) =>
      VehicleRow(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        odometerKm: odometerKm ?? this.odometerKm,
        createdAt: createdAt ?? this.createdAt,
      );
  VehicleRow copyWithCompanion(VehiclesCompanion data) {
    return VehicleRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      odometerKm:
          data.odometerKm.present ? data.odometerKm.value : this.odometerKm,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('odometerKm: $odometerKm, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, odometerKm, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.odometerKm == this.odometerKm &&
          other.createdAt == this.createdAt);
}

class VehiclesCompanion extends UpdateCompanion<VehicleRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<double> odometerKm;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const VehiclesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.odometerKm = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VehiclesCompanion.insert({
    required String id,
    required String name,
    this.type = const Value.absent(),
    this.odometerKm = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<VehicleRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<double>? odometerKm,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (odometerKm != null) 'odometer_km': odometerKm,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VehiclesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? type,
      Value<double>? odometerKm,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return VehiclesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      odometerKm: odometerKm ?? this.odometerKm,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (odometerKm.present) {
      map['odometer_km'] = Variable<double>(odometerKm.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehiclesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('odometerKm: $odometerKm, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VehicleFuelLogsTable extends VehicleFuelLogs
    with TableInfo<$VehicleFuelLogsTable, VehicleFuelLogRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehicleFuelLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _vehicleIdMeta =
      const VerificationMeta('vehicleId');
  @override
  late final GeneratedColumn<String> vehicleId = GeneratedColumn<String>(
      'vehicle_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _litresMeta = const VerificationMeta('litres');
  @override
  late final GeneratedColumn<double> litres = GeneratedColumn<double>(
      'litres', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
      'cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _odometerKmMeta =
      const VerificationMeta('odometerKm');
  @override
  late final GeneratedColumn<double> odometerKm = GeneratedColumn<double>(
      'odometer_km', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, vehicleId, date, litres, cost, odometerKm, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicle_fuel_logs';
  @override
  VerificationContext validateIntegrity(Insertable<VehicleFuelLogRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(_vehicleIdMeta,
          vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta));
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('litres')) {
      context.handle(_litresMeta,
          litres.isAcceptableOrUnknown(data['litres']!, _litresMeta));
    } else if (isInserting) {
      context.missing(_litresMeta);
    }
    if (data.containsKey('cost')) {
      context.handle(
          _costMeta, cost.isAcceptableOrUnknown(data['cost']!, _costMeta));
    } else if (isInserting) {
      context.missing(_costMeta);
    }
    if (data.containsKey('odometer_km')) {
      context.handle(
          _odometerKmMeta,
          odometerKm.isAcceptableOrUnknown(
              data['odometer_km']!, _odometerKmMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehicleFuelLogRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleFuelLogRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      vehicleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vehicle_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      litres: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}litres'])!,
      cost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost'])!,
      odometerKm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}odometer_km']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $VehicleFuelLogsTable createAlias(String alias) {
    return $VehicleFuelLogsTable(attachedDatabase, alias);
  }
}

class VehicleFuelLogRow extends DataClass
    implements Insertable<VehicleFuelLogRow> {
  final String id;
  final String vehicleId;
  final DateTime date;
  final double litres;
  final double cost;
  final double? odometerKm;
  final DateTime createdAt;
  const VehicleFuelLogRow(
      {required this.id,
      required this.vehicleId,
      required this.date,
      required this.litres,
      required this.cost,
      this.odometerKm,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['vehicle_id'] = Variable<String>(vehicleId);
    map['date'] = Variable<DateTime>(date);
    map['litres'] = Variable<double>(litres);
    map['cost'] = Variable<double>(cost);
    if (!nullToAbsent || odometerKm != null) {
      map['odometer_km'] = Variable<double>(odometerKm);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  VehicleFuelLogsCompanion toCompanion(bool nullToAbsent) {
    return VehicleFuelLogsCompanion(
      id: Value(id),
      vehicleId: Value(vehicleId),
      date: Value(date),
      litres: Value(litres),
      cost: Value(cost),
      odometerKm: odometerKm == null && nullToAbsent
          ? const Value.absent()
          : Value(odometerKm),
      createdAt: Value(createdAt),
    );
  }

  factory VehicleFuelLogRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleFuelLogRow(
      id: serializer.fromJson<String>(json['id']),
      vehicleId: serializer.fromJson<String>(json['vehicleId']),
      date: serializer.fromJson<DateTime>(json['date']),
      litres: serializer.fromJson<double>(json['litres']),
      cost: serializer.fromJson<double>(json['cost']),
      odometerKm: serializer.fromJson<double?>(json['odometerKm']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'vehicleId': serializer.toJson<String>(vehicleId),
      'date': serializer.toJson<DateTime>(date),
      'litres': serializer.toJson<double>(litres),
      'cost': serializer.toJson<double>(cost),
      'odometerKm': serializer.toJson<double?>(odometerKm),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  VehicleFuelLogRow copyWith(
          {String? id,
          String? vehicleId,
          DateTime? date,
          double? litres,
          double? cost,
          Value<double?> odometerKm = const Value.absent(),
          DateTime? createdAt}) =>
      VehicleFuelLogRow(
        id: id ?? this.id,
        vehicleId: vehicleId ?? this.vehicleId,
        date: date ?? this.date,
        litres: litres ?? this.litres,
        cost: cost ?? this.cost,
        odometerKm: odometerKm.present ? odometerKm.value : this.odometerKm,
        createdAt: createdAt ?? this.createdAt,
      );
  VehicleFuelLogRow copyWithCompanion(VehicleFuelLogsCompanion data) {
    return VehicleFuelLogRow(
      id: data.id.present ? data.id.value : this.id,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      date: data.date.present ? data.date.value : this.date,
      litres: data.litres.present ? data.litres.value : this.litres,
      cost: data.cost.present ? data.cost.value : this.cost,
      odometerKm:
          data.odometerKm.present ? data.odometerKm.value : this.odometerKm,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleFuelLogRow(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('litres: $litres, ')
          ..write('cost: $cost, ')
          ..write('odometerKm: $odometerKm, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, vehicleId, date, litres, cost, odometerKm, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleFuelLogRow &&
          other.id == this.id &&
          other.vehicleId == this.vehicleId &&
          other.date == this.date &&
          other.litres == this.litres &&
          other.cost == this.cost &&
          other.odometerKm == this.odometerKm &&
          other.createdAt == this.createdAt);
}

class VehicleFuelLogsCompanion extends UpdateCompanion<VehicleFuelLogRow> {
  final Value<String> id;
  final Value<String> vehicleId;
  final Value<DateTime> date;
  final Value<double> litres;
  final Value<double> cost;
  final Value<double?> odometerKm;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const VehicleFuelLogsCompanion({
    this.id = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.date = const Value.absent(),
    this.litres = const Value.absent(),
    this.cost = const Value.absent(),
    this.odometerKm = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VehicleFuelLogsCompanion.insert({
    required String id,
    required String vehicleId,
    this.date = const Value.absent(),
    required double litres,
    required double cost,
    this.odometerKm = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        vehicleId = Value(vehicleId),
        litres = Value(litres),
        cost = Value(cost);
  static Insertable<VehicleFuelLogRow> custom({
    Expression<String>? id,
    Expression<String>? vehicleId,
    Expression<DateTime>? date,
    Expression<double>? litres,
    Expression<double>? cost,
    Expression<double>? odometerKm,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (date != null) 'date': date,
      if (litres != null) 'litres': litres,
      if (cost != null) 'cost': cost,
      if (odometerKm != null) 'odometer_km': odometerKm,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VehicleFuelLogsCompanion copyWith(
      {Value<String>? id,
      Value<String>? vehicleId,
      Value<DateTime>? date,
      Value<double>? litres,
      Value<double>? cost,
      Value<double?>? odometerKm,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return VehicleFuelLogsCompanion(
      id: id ?? this.id,
      vehicleId: vehicleId ?? this.vehicleId,
      date: date ?? this.date,
      litres: litres ?? this.litres,
      cost: cost ?? this.cost,
      odometerKm: odometerKm ?? this.odometerKm,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<String>(vehicleId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (litres.present) {
      map['litres'] = Variable<double>(litres.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (odometerKm.present) {
      map['odometer_km'] = Variable<double>(odometerKm.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehicleFuelLogsCompanion(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('litres: $litres, ')
          ..write('cost: $cost, ')
          ..write('odometerKm: $odometerKm, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VehicleMaintenanceLogsTable extends VehicleMaintenanceLogs
    with TableInfo<$VehicleMaintenanceLogsTable, VehicleMaintenanceRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehicleMaintenanceLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _vehicleIdMeta =
      const VerificationMeta('vehicleId');
  @override
  late final GeneratedColumn<String> vehicleId = GeneratedColumn<String>(
      'vehicle_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
      'cost', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, vehicleId, type, cost, notes, date, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicle_maintenance_logs';
  @override
  VerificationContext validateIntegrity(
      Insertable<VehicleMaintenanceRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(_vehicleIdMeta,
          vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta));
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('cost')) {
      context.handle(
          _costMeta, cost.isAcceptableOrUnknown(data['cost']!, _costMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehicleMaintenanceRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleMaintenanceRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      vehicleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vehicle_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      cost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $VehicleMaintenanceLogsTable createAlias(String alias) {
    return $VehicleMaintenanceLogsTable(attachedDatabase, alias);
  }
}

class VehicleMaintenanceRow extends DataClass
    implements Insertable<VehicleMaintenanceRow> {
  final String id;
  final String vehicleId;
  final String type;
  final double? cost;
  final String? notes;
  final DateTime date;
  final DateTime createdAt;
  const VehicleMaintenanceRow(
      {required this.id,
      required this.vehicleId,
      required this.type,
      this.cost,
      this.notes,
      required this.date,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['vehicle_id'] = Variable<String>(vehicleId);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || cost != null) {
      map['cost'] = Variable<double>(cost);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['date'] = Variable<DateTime>(date);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  VehicleMaintenanceLogsCompanion toCompanion(bool nullToAbsent) {
    return VehicleMaintenanceLogsCompanion(
      id: Value(id),
      vehicleId: Value(vehicleId),
      type: Value(type),
      cost: cost == null && nullToAbsent ? const Value.absent() : Value(cost),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      date: Value(date),
      createdAt: Value(createdAt),
    );
  }

  factory VehicleMaintenanceRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleMaintenanceRow(
      id: serializer.fromJson<String>(json['id']),
      vehicleId: serializer.fromJson<String>(json['vehicleId']),
      type: serializer.fromJson<String>(json['type']),
      cost: serializer.fromJson<double?>(json['cost']),
      notes: serializer.fromJson<String?>(json['notes']),
      date: serializer.fromJson<DateTime>(json['date']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'vehicleId': serializer.toJson<String>(vehicleId),
      'type': serializer.toJson<String>(type),
      'cost': serializer.toJson<double?>(cost),
      'notes': serializer.toJson<String?>(notes),
      'date': serializer.toJson<DateTime>(date),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  VehicleMaintenanceRow copyWith(
          {String? id,
          String? vehicleId,
          String? type,
          Value<double?> cost = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          DateTime? date,
          DateTime? createdAt}) =>
      VehicleMaintenanceRow(
        id: id ?? this.id,
        vehicleId: vehicleId ?? this.vehicleId,
        type: type ?? this.type,
        cost: cost.present ? cost.value : this.cost,
        notes: notes.present ? notes.value : this.notes,
        date: date ?? this.date,
        createdAt: createdAt ?? this.createdAt,
      );
  VehicleMaintenanceRow copyWithCompanion(
      VehicleMaintenanceLogsCompanion data) {
    return VehicleMaintenanceRow(
      id: data.id.present ? data.id.value : this.id,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      type: data.type.present ? data.type.value : this.type,
      cost: data.cost.present ? data.cost.value : this.cost,
      notes: data.notes.present ? data.notes.value : this.notes,
      date: data.date.present ? data.date.value : this.date,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleMaintenanceRow(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('type: $type, ')
          ..write('cost: $cost, ')
          ..write('notes: $notes, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, vehicleId, type, cost, notes, date, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleMaintenanceRow &&
          other.id == this.id &&
          other.vehicleId == this.vehicleId &&
          other.type == this.type &&
          other.cost == this.cost &&
          other.notes == this.notes &&
          other.date == this.date &&
          other.createdAt == this.createdAt);
}

class VehicleMaintenanceLogsCompanion
    extends UpdateCompanion<VehicleMaintenanceRow> {
  final Value<String> id;
  final Value<String> vehicleId;
  final Value<String> type;
  final Value<double?> cost;
  final Value<String?> notes;
  final Value<DateTime> date;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const VehicleMaintenanceLogsCompanion({
    this.id = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.type = const Value.absent(),
    this.cost = const Value.absent(),
    this.notes = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VehicleMaintenanceLogsCompanion.insert({
    required String id,
    required String vehicleId,
    required String type,
    this.cost = const Value.absent(),
    this.notes = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        vehicleId = Value(vehicleId),
        type = Value(type);
  static Insertable<VehicleMaintenanceRow> custom({
    Expression<String>? id,
    Expression<String>? vehicleId,
    Expression<String>? type,
    Expression<double>? cost,
    Expression<String>? notes,
    Expression<DateTime>? date,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (type != null) 'type': type,
      if (cost != null) 'cost': cost,
      if (notes != null) 'notes': notes,
      if (date != null) 'date': date,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VehicleMaintenanceLogsCompanion copyWith(
      {Value<String>? id,
      Value<String>? vehicleId,
      Value<String>? type,
      Value<double?>? cost,
      Value<String?>? notes,
      Value<DateTime>? date,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return VehicleMaintenanceLogsCompanion(
      id: id ?? this.id,
      vehicleId: vehicleId ?? this.vehicleId,
      type: type ?? this.type,
      cost: cost ?? this.cost,
      notes: notes ?? this.notes,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<String>(vehicleId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehicleMaintenanceLogsCompanion(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('type: $type, ')
          ..write('cost: $cost, ')
          ..write('notes: $notes, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $ProjectsTable projects = $ProjectsTable(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final $GoalProgressEntriesTable goalProgressEntries =
      $GoalProgressEntriesTable(this);
  late final $CalendarEventsTable calendarEvents = $CalendarEventsTable(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $BudgetsTable budgets = $BudgetsTable(this);
  late final $JournalEntriesTable journalEntries = $JournalEntriesTable(this);
  late final $HabitsTable habits = $HabitsTable(this);
  late final $HabitLogsTable habitLogs = $HabitLogsTable(this);
  late final $FocusSessionsTable focusSessions = $FocusSessionsTable(this);
  late final $HealthLogsTable healthLogs = $HealthLogsTable(this);
  late final $StudySessionsTable studySessions = $StudySessionsTable(this);
  late final $CareerPositionsTable careerPositions =
      $CareerPositionsTable(this);
  late final $CareerAchievementsTable careerAchievements =
      $CareerAchievementsTable(this);
  late final $BusinessClientsTable businessClients =
      $BusinessClientsTable(this);
  late final $BusinessProjectsTable businessProjects =
      $BusinessProjectsTable(this);
  late final $VehiclesTable vehicles = $VehiclesTable(this);
  late final $VehicleFuelLogsTable vehicleFuelLogs =
      $VehicleFuelLogsTable(this);
  late final $VehicleMaintenanceLogsTable vehicleMaintenanceLogs =
      $VehicleMaintenanceLogsTable(this);
  late final TasksDao tasksDao = TasksDao(this as AppDatabase);
  late final ProjectsDao projectsDao = ProjectsDao(this as AppDatabase);
  late final GoalsDao goalsDao = GoalsDao(this as AppDatabase);
  late final CalendarDao calendarDao = CalendarDao(this as AppDatabase);
  late final MoneyDao moneyDao = MoneyDao(this as AppDatabase);
  late final JournalDao journalDao = JournalDao(this as AppDatabase);
  late final HabitsDao habitsDao = HabitsDao(this as AppDatabase);
  late final FocusDao focusDao = FocusDao(this as AppDatabase);
  late final HealthDao healthDao = HealthDao(this as AppDatabase);
  late final EducationDao educationDao = EducationDao(this as AppDatabase);
  late final CareerDao careerDao = CareerDao(this as AppDatabase);
  late final BusinessDao businessDao = BusinessDao(this as AppDatabase);
  late final TransportDao transportDao = TransportDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        tasks,
        projects,
        goals,
        goalProgressEntries,
        calendarEvents,
        accounts,
        transactions,
        budgets,
        journalEntries,
        habits,
        habitLogs,
        focusSessions,
        healthLogs,
        studySessions,
        careerPositions,
        careerAchievements,
        businessClients,
        businessProjects,
        vehicles,
        vehicleFuelLogs,
        vehicleMaintenanceLogs
      ];
}

typedef $$TasksTableCreateCompanionBuilder = TasksCompanion Function({
  required String id,
  required String title,
  Value<String?> description,
  Value<String> status,
  Value<String> priority,
  Value<DateTime?> deadline,
  Value<DateTime?> scheduledDate,
  Value<int?> plannedMinutes,
  Value<int?> actualMinutes,
  Value<String?> projectId,
  Value<String?> goalId,
  Value<String?> domain,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$TasksTableUpdateCompanionBuilder = TasksCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String?> description,
  Value<String> status,
  Value<String> priority,
  Value<DateTime?> deadline,
  Value<DateTime?> scheduledDate,
  Value<int?> plannedMinutes,
  Value<int?> actualMinutes,
  Value<String?> projectId,
  Value<String?> goalId,
  Value<String?> domain,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get scheduledDate => $composableBuilder(
      column: $table.scheduledDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get plannedMinutes => $composableBuilder(
      column: $table.plannedMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get actualMinutes => $composableBuilder(
      column: $table.actualMinutes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get goalId => $composableBuilder(
      column: $table.goalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get domain => $composableBuilder(
      column: $table.domain, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$TasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get scheduledDate => $composableBuilder(
      column: $table.scheduledDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get plannedMinutes => $composableBuilder(
      column: $table.plannedMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get actualMinutes => $composableBuilder(
      column: $table.actualMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get goalId => $composableBuilder(
      column: $table.goalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get domain => $composableBuilder(
      column: $table.domain, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$TasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledDate => $composableBuilder(
      column: $table.scheduledDate, builder: (column) => column);

  GeneratedColumn<int> get plannedMinutes => $composableBuilder(
      column: $table.plannedMinutes, builder: (column) => column);

  GeneratedColumn<int> get actualMinutes => $composableBuilder(
      column: $table.actualMinutes, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get goalId =>
      $composableBuilder(column: $table.goalId, builder: (column) => column);

  GeneratedColumn<String> get domain =>
      $composableBuilder(column: $table.domain, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TasksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TasksTable,
    TaskRow,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableAnnotationComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (TaskRow, BaseReferences<_$AppDatabase, $TasksTable, TaskRow>),
    TaskRow,
    PrefetchHooks Function()> {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> priority = const Value.absent(),
            Value<DateTime?> deadline = const Value.absent(),
            Value<DateTime?> scheduledDate = const Value.absent(),
            Value<int?> plannedMinutes = const Value.absent(),
            Value<int?> actualMinutes = const Value.absent(),
            Value<String?> projectId = const Value.absent(),
            Value<String?> goalId = const Value.absent(),
            Value<String?> domain = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TasksCompanion(
            id: id,
            title: title,
            description: description,
            status: status,
            priority: priority,
            deadline: deadline,
            scheduledDate: scheduledDate,
            plannedMinutes: plannedMinutes,
            actualMinutes: actualMinutes,
            projectId: projectId,
            goalId: goalId,
            domain: domain,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            Value<String?> description = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> priority = const Value.absent(),
            Value<DateTime?> deadline = const Value.absent(),
            Value<DateTime?> scheduledDate = const Value.absent(),
            Value<int?> plannedMinutes = const Value.absent(),
            Value<int?> actualMinutes = const Value.absent(),
            Value<String?> projectId = const Value.absent(),
            Value<String?> goalId = const Value.absent(),
            Value<String?> domain = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TasksCompanion.insert(
            id: id,
            title: title,
            description: description,
            status: status,
            priority: priority,
            deadline: deadline,
            scheduledDate: scheduledDate,
            plannedMinutes: plannedMinutes,
            actualMinutes: actualMinutes,
            projectId: projectId,
            goalId: goalId,
            domain: domain,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TasksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TasksTable,
    TaskRow,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableAnnotationComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (TaskRow, BaseReferences<_$AppDatabase, $TasksTable, TaskRow>),
    TaskRow,
    PrefetchHooks Function()>;
typedef $$ProjectsTableCreateCompanionBuilder = ProjectsCompanion Function({
  required String id,
  required String name,
  Value<String?> description,
  Value<String?> domain,
  Value<String> status,
  Value<DateTime?> startDate,
  Value<DateTime?> dueDate,
  Value<double?> budget,
  Value<double?> revenue,
  Value<double?> expenses,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$ProjectsTableUpdateCompanionBuilder = ProjectsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> domain,
  Value<String> status,
  Value<DateTime?> startDate,
  Value<DateTime?> dueDate,
  Value<double?> budget,
  Value<double?> revenue,
  Value<double?> expenses,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$ProjectsTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get domain => $composableBuilder(
      column: $table.domain, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get budget => $composableBuilder(
      column: $table.budget, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get revenue => $composableBuilder(
      column: $table.revenue, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get expenses => $composableBuilder(
      column: $table.expenses, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$ProjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get domain => $composableBuilder(
      column: $table.domain, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get budget => $composableBuilder(
      column: $table.budget, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get revenue => $composableBuilder(
      column: $table.revenue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get expenses => $composableBuilder(
      column: $table.expenses, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ProjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get domain =>
      $composableBuilder(column: $table.domain, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<double> get budget =>
      $composableBuilder(column: $table.budget, builder: (column) => column);

  GeneratedColumn<double> get revenue =>
      $composableBuilder(column: $table.revenue, builder: (column) => column);

  GeneratedColumn<double> get expenses =>
      $composableBuilder(column: $table.expenses, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProjectsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProjectsTable,
    ProjectRow,
    $$ProjectsTableFilterComposer,
    $$ProjectsTableOrderingComposer,
    $$ProjectsTableAnnotationComposer,
    $$ProjectsTableCreateCompanionBuilder,
    $$ProjectsTableUpdateCompanionBuilder,
    (ProjectRow, BaseReferences<_$AppDatabase, $ProjectsTable, ProjectRow>),
    ProjectRow,
    PrefetchHooks Function()> {
  $$ProjectsTableTableManager(_$AppDatabase db, $ProjectsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> domain = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<double?> budget = const Value.absent(),
            Value<double?> revenue = const Value.absent(),
            Value<double?> expenses = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProjectsCompanion(
            id: id,
            name: name,
            description: description,
            domain: domain,
            status: status,
            startDate: startDate,
            dueDate: dueDate,
            budget: budget,
            revenue: revenue,
            expenses: expenses,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> domain = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<double?> budget = const Value.absent(),
            Value<double?> revenue = const Value.absent(),
            Value<double?> expenses = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProjectsCompanion.insert(
            id: id,
            name: name,
            description: description,
            domain: domain,
            status: status,
            startDate: startDate,
            dueDate: dueDate,
            budget: budget,
            revenue: revenue,
            expenses: expenses,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProjectsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProjectsTable,
    ProjectRow,
    $$ProjectsTableFilterComposer,
    $$ProjectsTableOrderingComposer,
    $$ProjectsTableAnnotationComposer,
    $$ProjectsTableCreateCompanionBuilder,
    $$ProjectsTableUpdateCompanionBuilder,
    (ProjectRow, BaseReferences<_$AppDatabase, $ProjectsTable, ProjectRow>),
    ProjectRow,
    PrefetchHooks Function()>;
typedef $$GoalsTableCreateCompanionBuilder = GoalsCompanion Function({
  required String id,
  required String title,
  Value<String?> description,
  Value<String?> domain,
  Value<double?> targetValue,
  Value<double> currentValue,
  Value<String?> unit,
  Value<DateTime?> deadline,
  Value<String?> projectId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$GoalsTableUpdateCompanionBuilder = GoalsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String?> description,
  Value<String?> domain,
  Value<double?> targetValue,
  Value<double> currentValue,
  Value<String?> unit,
  Value<DateTime?> deadline,
  Value<String?> projectId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get domain => $composableBuilder(
      column: $table.domain, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get targetValue => $composableBuilder(
      column: $table.targetValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get currentValue => $composableBuilder(
      column: $table.currentValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get domain => $composableBuilder(
      column: $table.domain, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get targetValue => $composableBuilder(
      column: $table.targetValue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get currentValue => $composableBuilder(
      column: $table.currentValue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
      column: $table.deadline, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get domain =>
      $composableBuilder(column: $table.domain, builder: (column) => column);

  GeneratedColumn<double> get targetValue => $composableBuilder(
      column: $table.targetValue, builder: (column) => column);

  GeneratedColumn<double> get currentValue => $composableBuilder(
      column: $table.currentValue, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$GoalsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GoalsTable,
    GoalRow,
    $$GoalsTableFilterComposer,
    $$GoalsTableOrderingComposer,
    $$GoalsTableAnnotationComposer,
    $$GoalsTableCreateCompanionBuilder,
    $$GoalsTableUpdateCompanionBuilder,
    (GoalRow, BaseReferences<_$AppDatabase, $GoalsTable, GoalRow>),
    GoalRow,
    PrefetchHooks Function()> {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> domain = const Value.absent(),
            Value<double?> targetValue = const Value.absent(),
            Value<double> currentValue = const Value.absent(),
            Value<String?> unit = const Value.absent(),
            Value<DateTime?> deadline = const Value.absent(),
            Value<String?> projectId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalsCompanion(
            id: id,
            title: title,
            description: description,
            domain: domain,
            targetValue: targetValue,
            currentValue: currentValue,
            unit: unit,
            deadline: deadline,
            projectId: projectId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            Value<String?> description = const Value.absent(),
            Value<String?> domain = const Value.absent(),
            Value<double?> targetValue = const Value.absent(),
            Value<double> currentValue = const Value.absent(),
            Value<String?> unit = const Value.absent(),
            Value<DateTime?> deadline = const Value.absent(),
            Value<String?> projectId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalsCompanion.insert(
            id: id,
            title: title,
            description: description,
            domain: domain,
            targetValue: targetValue,
            currentValue: currentValue,
            unit: unit,
            deadline: deadline,
            projectId: projectId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GoalsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GoalsTable,
    GoalRow,
    $$GoalsTableFilterComposer,
    $$GoalsTableOrderingComposer,
    $$GoalsTableAnnotationComposer,
    $$GoalsTableCreateCompanionBuilder,
    $$GoalsTableUpdateCompanionBuilder,
    (GoalRow, BaseReferences<_$AppDatabase, $GoalsTable, GoalRow>),
    GoalRow,
    PrefetchHooks Function()>;
typedef $$GoalProgressEntriesTableCreateCompanionBuilder
    = GoalProgressEntriesCompanion Function({
  required String id,
  required String goalId,
  required double amount,
  Value<String?> note,
  Value<DateTime> loggedAt,
  Value<int> rowid,
});
typedef $$GoalProgressEntriesTableUpdateCompanionBuilder
    = GoalProgressEntriesCompanion Function({
  Value<String> id,
  Value<String> goalId,
  Value<double> amount,
  Value<String?> note,
  Value<DateTime> loggedAt,
  Value<int> rowid,
});

class $$GoalProgressEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $GoalProgressEntriesTable> {
  $$GoalProgressEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get goalId => $composableBuilder(
      column: $table.goalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
      column: $table.loggedAt, builder: (column) => ColumnFilters(column));
}

class $$GoalProgressEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalProgressEntriesTable> {
  $$GoalProgressEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get goalId => $composableBuilder(
      column: $table.goalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
      column: $table.loggedAt, builder: (column) => ColumnOrderings(column));
}

class $$GoalProgressEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalProgressEntriesTable> {
  $$GoalProgressEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get goalId =>
      $composableBuilder(column: $table.goalId, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);
}

class $$GoalProgressEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GoalProgressEntriesTable,
    GoalProgressRow,
    $$GoalProgressEntriesTableFilterComposer,
    $$GoalProgressEntriesTableOrderingComposer,
    $$GoalProgressEntriesTableAnnotationComposer,
    $$GoalProgressEntriesTableCreateCompanionBuilder,
    $$GoalProgressEntriesTableUpdateCompanionBuilder,
    (
      GoalProgressRow,
      BaseReferences<_$AppDatabase, $GoalProgressEntriesTable, GoalProgressRow>
    ),
    GoalProgressRow,
    PrefetchHooks Function()> {
  $$GoalProgressEntriesTableTableManager(
      _$AppDatabase db, $GoalProgressEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalProgressEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalProgressEntriesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalProgressEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> goalId = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> loggedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalProgressEntriesCompanion(
            id: id,
            goalId: goalId,
            amount: amount,
            note: note,
            loggedAt: loggedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String goalId,
            required double amount,
            Value<String?> note = const Value.absent(),
            Value<DateTime> loggedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GoalProgressEntriesCompanion.insert(
            id: id,
            goalId: goalId,
            amount: amount,
            note: note,
            loggedAt: loggedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GoalProgressEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GoalProgressEntriesTable,
    GoalProgressRow,
    $$GoalProgressEntriesTableFilterComposer,
    $$GoalProgressEntriesTableOrderingComposer,
    $$GoalProgressEntriesTableAnnotationComposer,
    $$GoalProgressEntriesTableCreateCompanionBuilder,
    $$GoalProgressEntriesTableUpdateCompanionBuilder,
    (
      GoalProgressRow,
      BaseReferences<_$AppDatabase, $GoalProgressEntriesTable, GoalProgressRow>
    ),
    GoalProgressRow,
    PrefetchHooks Function()>;
typedef $$CalendarEventsTableCreateCompanionBuilder = CalendarEventsCompanion
    Function({
  required String id,
  required String title,
  Value<String?> description,
  Value<String> domain,
  required DateTime start,
  required DateTime end,
  Value<bool> allDay,
  Value<String?> location,
  Value<String?> taskId,
  Value<String?> projectId,
  Value<String?> goalId,
  Value<String> recurrence,
  Value<String?> recurrenceGroupId,
  Value<int?> reminderMinutesBefore,
  Value<int?> notificationId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$CalendarEventsTableUpdateCompanionBuilder = CalendarEventsCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<String?> description,
  Value<String> domain,
  Value<DateTime> start,
  Value<DateTime> end,
  Value<bool> allDay,
  Value<String?> location,
  Value<String?> taskId,
  Value<String?> projectId,
  Value<String?> goalId,
  Value<String> recurrence,
  Value<String?> recurrenceGroupId,
  Value<int?> reminderMinutesBefore,
  Value<int?> notificationId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$CalendarEventsTableFilterComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get domain => $composableBuilder(
      column: $table.domain, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get start => $composableBuilder(
      column: $table.start, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get end => $composableBuilder(
      column: $table.end, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get allDay => $composableBuilder(
      column: $table.allDay, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get goalId => $composableBuilder(
      column: $table.goalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recurrence => $composableBuilder(
      column: $table.recurrence, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recurrenceGroupId => $composableBuilder(
      column: $table.recurrenceGroupId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get reminderMinutesBefore => $composableBuilder(
      column: $table.reminderMinutesBefore,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get notificationId => $composableBuilder(
      column: $table.notificationId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$CalendarEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get domain => $composableBuilder(
      column: $table.domain, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get start => $composableBuilder(
      column: $table.start, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get end => $composableBuilder(
      column: $table.end, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get allDay => $composableBuilder(
      column: $table.allDay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get goalId => $composableBuilder(
      column: $table.goalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recurrence => $composableBuilder(
      column: $table.recurrence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recurrenceGroupId => $composableBuilder(
      column: $table.recurrenceGroupId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reminderMinutesBefore => $composableBuilder(
      column: $table.reminderMinutesBefore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get notificationId => $composableBuilder(
      column: $table.notificationId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CalendarEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get domain =>
      $composableBuilder(column: $table.domain, builder: (column) => column);

  GeneratedColumn<DateTime> get start =>
      $composableBuilder(column: $table.start, builder: (column) => column);

  GeneratedColumn<DateTime> get end =>
      $composableBuilder(column: $table.end, builder: (column) => column);

  GeneratedColumn<bool> get allDay =>
      $composableBuilder(column: $table.allDay, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get taskId =>
      $composableBuilder(column: $table.taskId, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<String> get goalId =>
      $composableBuilder(column: $table.goalId, builder: (column) => column);

  GeneratedColumn<String> get recurrence => $composableBuilder(
      column: $table.recurrence, builder: (column) => column);

  GeneratedColumn<String> get recurrenceGroupId => $composableBuilder(
      column: $table.recurrenceGroupId, builder: (column) => column);

  GeneratedColumn<int> get reminderMinutesBefore => $composableBuilder(
      column: $table.reminderMinutesBefore, builder: (column) => column);

  GeneratedColumn<int> get notificationId => $composableBuilder(
      column: $table.notificationId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CalendarEventsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CalendarEventsTable,
    CalendarEventRow,
    $$CalendarEventsTableFilterComposer,
    $$CalendarEventsTableOrderingComposer,
    $$CalendarEventsTableAnnotationComposer,
    $$CalendarEventsTableCreateCompanionBuilder,
    $$CalendarEventsTableUpdateCompanionBuilder,
    (
      CalendarEventRow,
      BaseReferences<_$AppDatabase, $CalendarEventsTable, CalendarEventRow>
    ),
    CalendarEventRow,
    PrefetchHooks Function()> {
  $$CalendarEventsTableTableManager(
      _$AppDatabase db, $CalendarEventsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CalendarEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalendarEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> domain = const Value.absent(),
            Value<DateTime> start = const Value.absent(),
            Value<DateTime> end = const Value.absent(),
            Value<bool> allDay = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> taskId = const Value.absent(),
            Value<String?> projectId = const Value.absent(),
            Value<String?> goalId = const Value.absent(),
            Value<String> recurrence = const Value.absent(),
            Value<String?> recurrenceGroupId = const Value.absent(),
            Value<int?> reminderMinutesBefore = const Value.absent(),
            Value<int?> notificationId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CalendarEventsCompanion(
            id: id,
            title: title,
            description: description,
            domain: domain,
            start: start,
            end: end,
            allDay: allDay,
            location: location,
            taskId: taskId,
            projectId: projectId,
            goalId: goalId,
            recurrence: recurrence,
            recurrenceGroupId: recurrenceGroupId,
            reminderMinutesBefore: reminderMinutesBefore,
            notificationId: notificationId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            Value<String?> description = const Value.absent(),
            Value<String> domain = const Value.absent(),
            required DateTime start,
            required DateTime end,
            Value<bool> allDay = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> taskId = const Value.absent(),
            Value<String?> projectId = const Value.absent(),
            Value<String?> goalId = const Value.absent(),
            Value<String> recurrence = const Value.absent(),
            Value<String?> recurrenceGroupId = const Value.absent(),
            Value<int?> reminderMinutesBefore = const Value.absent(),
            Value<int?> notificationId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CalendarEventsCompanion.insert(
            id: id,
            title: title,
            description: description,
            domain: domain,
            start: start,
            end: end,
            allDay: allDay,
            location: location,
            taskId: taskId,
            projectId: projectId,
            goalId: goalId,
            recurrence: recurrence,
            recurrenceGroupId: recurrenceGroupId,
            reminderMinutesBefore: reminderMinutesBefore,
            notificationId: notificationId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CalendarEventsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CalendarEventsTable,
    CalendarEventRow,
    $$CalendarEventsTableFilterComposer,
    $$CalendarEventsTableOrderingComposer,
    $$CalendarEventsTableAnnotationComposer,
    $$CalendarEventsTableCreateCompanionBuilder,
    $$CalendarEventsTableUpdateCompanionBuilder,
    (
      CalendarEventRow,
      BaseReferences<_$AppDatabase, $CalendarEventsTable, CalendarEventRow>
    ),
    CalendarEventRow,
    PrefetchHooks Function()>;
typedef $$AccountsTableCreateCompanionBuilder = AccountsCompanion Function({
  required String id,
  required String name,
  Value<String> type,
  Value<String> currency,
  Value<double> openingBalance,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$AccountsTableUpdateCompanionBuilder = AccountsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> type,
  Value<String> currency,
  Value<double> openingBalance,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$AccountsTableFilterComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$AccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$AccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AccountsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountsTable,
    AccountRow,
    $$AccountsTableFilterComposer,
    $$AccountsTableOrderingComposer,
    $$AccountsTableAnnotationComposer,
    $$AccountsTableCreateCompanionBuilder,
    $$AccountsTableUpdateCompanionBuilder,
    (AccountRow, BaseReferences<_$AppDatabase, $AccountsTable, AccountRow>),
    AccountRow,
    PrefetchHooks Function()> {
  $$AccountsTableTableManager(_$AppDatabase db, $AccountsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<double> openingBalance = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountsCompanion(
            id: id,
            name: name,
            type: type,
            currency: currency,
            openingBalance: openingBalance,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String> type = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<double> openingBalance = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountsCompanion.insert(
            id: id,
            name: name,
            type: type,
            currency: currency,
            openingBalance: openingBalance,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AccountsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AccountsTable,
    AccountRow,
    $$AccountsTableFilterComposer,
    $$AccountsTableOrderingComposer,
    $$AccountsTableAnnotationComposer,
    $$AccountsTableCreateCompanionBuilder,
    $$AccountsTableUpdateCompanionBuilder,
    (AccountRow, BaseReferences<_$AppDatabase, $AccountsTable, AccountRow>),
    AccountRow,
    PrefetchHooks Function()>;
typedef $$TransactionsTableCreateCompanionBuilder = TransactionsCompanion
    Function({
  required String id,
  required String accountId,
  required String type,
  required double amount,
  Value<String?> category,
  Value<String?> merchant,
  Value<String?> note,
  Value<DateTime> occurredAt,
  Value<bool> planned,
  Value<bool> necessary,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<String> id,
  Value<String> accountId,
  Value<String> type,
  Value<double> amount,
  Value<String?> category,
  Value<String?> merchant,
  Value<String?> note,
  Value<DateTime> occurredAt,
  Value<bool> planned,
  Value<bool> necessary,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$TransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountId => $composableBuilder(
      column: $table.accountId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get merchant => $composableBuilder(
      column: $table.merchant, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
      column: $table.occurredAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get planned => $composableBuilder(
      column: $table.planned, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get necessary => $composableBuilder(
      column: $table.necessary, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$TransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountId => $composableBuilder(
      column: $table.accountId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get merchant => $composableBuilder(
      column: $table.merchant, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
      column: $table.occurredAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get planned => $composableBuilder(
      column: $table.planned, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get necessary => $composableBuilder(
      column: $table.necessary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$TransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get merchant =>
      $composableBuilder(column: $table.merchant, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
      column: $table.occurredAt, builder: (column) => column);

  GeneratedColumn<bool> get planned =>
      $composableBuilder(column: $table.planned, builder: (column) => column);

  GeneratedColumn<bool> get necessary =>
      $composableBuilder(column: $table.necessary, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TransactionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionsTable,
    TransactionRow,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (
      TransactionRow,
      BaseReferences<_$AppDatabase, $TransactionsTable, TransactionRow>
    ),
    TransactionRow,
    PrefetchHooks Function()> {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> accountId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<String?> merchant = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> occurredAt = const Value.absent(),
            Value<bool> planned = const Value.absent(),
            Value<bool> necessary = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionsCompanion(
            id: id,
            accountId: accountId,
            type: type,
            amount: amount,
            category: category,
            merchant: merchant,
            note: note,
            occurredAt: occurredAt,
            planned: planned,
            necessary: necessary,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String accountId,
            required String type,
            required double amount,
            Value<String?> category = const Value.absent(),
            Value<String?> merchant = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> occurredAt = const Value.absent(),
            Value<bool> planned = const Value.absent(),
            Value<bool> necessary = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionsCompanion.insert(
            id: id,
            accountId: accountId,
            type: type,
            amount: amount,
            category: category,
            merchant: merchant,
            note: note,
            occurredAt: occurredAt,
            planned: planned,
            necessary: necessary,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TransactionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionsTable,
    TransactionRow,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (
      TransactionRow,
      BaseReferences<_$AppDatabase, $TransactionsTable, TransactionRow>
    ),
    TransactionRow,
    PrefetchHooks Function()>;
typedef $$BudgetsTableCreateCompanionBuilder = BudgetsCompanion Function({
  required String id,
  required String category,
  required double monthlyLimit,
  required String month,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$BudgetsTableUpdateCompanionBuilder = BudgetsCompanion Function({
  Value<String> id,
  Value<String> category,
  Value<double> monthlyLimit,
  Value<String> month,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$BudgetsTableFilterComposer
    extends Composer<_$AppDatabase, $BudgetsTable> {
  $$BudgetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get monthlyLimit => $composableBuilder(
      column: $table.monthlyLimit, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get month => $composableBuilder(
      column: $table.month, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$BudgetsTableOrderingComposer
    extends Composer<_$AppDatabase, $BudgetsTable> {
  $$BudgetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get monthlyLimit => $composableBuilder(
      column: $table.monthlyLimit,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get month => $composableBuilder(
      column: $table.month, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$BudgetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BudgetsTable> {
  $$BudgetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get monthlyLimit => $composableBuilder(
      column: $table.monthlyLimit, builder: (column) => column);

  GeneratedColumn<String> get month =>
      $composableBuilder(column: $table.month, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$BudgetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BudgetsTable,
    BudgetRow,
    $$BudgetsTableFilterComposer,
    $$BudgetsTableOrderingComposer,
    $$BudgetsTableAnnotationComposer,
    $$BudgetsTableCreateCompanionBuilder,
    $$BudgetsTableUpdateCompanionBuilder,
    (BudgetRow, BaseReferences<_$AppDatabase, $BudgetsTable, BudgetRow>),
    BudgetRow,
    PrefetchHooks Function()> {
  $$BudgetsTableTableManager(_$AppDatabase db, $BudgetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BudgetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BudgetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BudgetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<double> monthlyLimit = const Value.absent(),
            Value<String> month = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BudgetsCompanion(
            id: id,
            category: category,
            monthlyLimit: monthlyLimit,
            month: month,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String category,
            required double monthlyLimit,
            required String month,
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BudgetsCompanion.insert(
            id: id,
            category: category,
            monthlyLimit: monthlyLimit,
            month: month,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BudgetsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BudgetsTable,
    BudgetRow,
    $$BudgetsTableFilterComposer,
    $$BudgetsTableOrderingComposer,
    $$BudgetsTableAnnotationComposer,
    $$BudgetsTableCreateCompanionBuilder,
    $$BudgetsTableUpdateCompanionBuilder,
    (BudgetRow, BaseReferences<_$AppDatabase, $BudgetsTable, BudgetRow>),
    BudgetRow,
    PrefetchHooks Function()>;
typedef $$JournalEntriesTableCreateCompanionBuilder = JournalEntriesCompanion
    Function({
  required String id,
  required DateTime date,
  Value<String?> win,
  Value<String?> problem,
  Value<String?> lesson,
  Value<String?> gratitude,
  Value<String?> priorityTomorrow,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$JournalEntriesTableUpdateCompanionBuilder = JournalEntriesCompanion
    Function({
  Value<String> id,
  Value<DateTime> date,
  Value<String?> win,
  Value<String?> problem,
  Value<String?> lesson,
  Value<String?> gratitude,
  Value<String?> priorityTomorrow,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$JournalEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get win => $composableBuilder(
      column: $table.win, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get problem => $composableBuilder(
      column: $table.problem, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lesson => $composableBuilder(
      column: $table.lesson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gratitude => $composableBuilder(
      column: $table.gratitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priorityTomorrow => $composableBuilder(
      column: $table.priorityTomorrow,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$JournalEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get win => $composableBuilder(
      column: $table.win, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get problem => $composableBuilder(
      column: $table.problem, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lesson => $composableBuilder(
      column: $table.lesson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gratitude => $composableBuilder(
      column: $table.gratitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priorityTomorrow => $composableBuilder(
      column: $table.priorityTomorrow,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$JournalEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get win =>
      $composableBuilder(column: $table.win, builder: (column) => column);

  GeneratedColumn<String> get problem =>
      $composableBuilder(column: $table.problem, builder: (column) => column);

  GeneratedColumn<String> get lesson =>
      $composableBuilder(column: $table.lesson, builder: (column) => column);

  GeneratedColumn<String> get gratitude =>
      $composableBuilder(column: $table.gratitude, builder: (column) => column);

  GeneratedColumn<String> get priorityTomorrow => $composableBuilder(
      column: $table.priorityTomorrow, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$JournalEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JournalEntriesTable,
    JournalEntryRow,
    $$JournalEntriesTableFilterComposer,
    $$JournalEntriesTableOrderingComposer,
    $$JournalEntriesTableAnnotationComposer,
    $$JournalEntriesTableCreateCompanionBuilder,
    $$JournalEntriesTableUpdateCompanionBuilder,
    (
      JournalEntryRow,
      BaseReferences<_$AppDatabase, $JournalEntriesTable, JournalEntryRow>
    ),
    JournalEntryRow,
    PrefetchHooks Function()> {
  $$JournalEntriesTableTableManager(
      _$AppDatabase db, $JournalEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String?> win = const Value.absent(),
            Value<String?> problem = const Value.absent(),
            Value<String?> lesson = const Value.absent(),
            Value<String?> gratitude = const Value.absent(),
            Value<String?> priorityTomorrow = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JournalEntriesCompanion(
            id: id,
            date: date,
            win: win,
            problem: problem,
            lesson: lesson,
            gratitude: gratitude,
            priorityTomorrow: priorityTomorrow,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime date,
            Value<String?> win = const Value.absent(),
            Value<String?> problem = const Value.absent(),
            Value<String?> lesson = const Value.absent(),
            Value<String?> gratitude = const Value.absent(),
            Value<String?> priorityTomorrow = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JournalEntriesCompanion.insert(
            id: id,
            date: date,
            win: win,
            problem: problem,
            lesson: lesson,
            gratitude: gratitude,
            priorityTomorrow: priorityTomorrow,
            notes: notes,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$JournalEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $JournalEntriesTable,
    JournalEntryRow,
    $$JournalEntriesTableFilterComposer,
    $$JournalEntriesTableOrderingComposer,
    $$JournalEntriesTableAnnotationComposer,
    $$JournalEntriesTableCreateCompanionBuilder,
    $$JournalEntriesTableUpdateCompanionBuilder,
    (
      JournalEntryRow,
      BaseReferences<_$AppDatabase, $JournalEntriesTable, JournalEntryRow>
    ),
    JournalEntryRow,
    PrefetchHooks Function()>;
typedef $$HabitsTableCreateCompanionBuilder = HabitsCompanion Function({
  required String id,
  required String title,
  Value<String> type,
  Value<String?> unit,
  Value<int?> targetPerWeek,
  Value<double?> targetAmount,
  Value<String?> domain,
  Value<bool> archived,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$HabitsTableUpdateCompanionBuilder = HabitsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> type,
  Value<String?> unit,
  Value<int?> targetPerWeek,
  Value<double?> targetAmount,
  Value<String?> domain,
  Value<bool> archived,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$HabitsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get targetPerWeek => $composableBuilder(
      column: $table.targetPerWeek, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get targetAmount => $composableBuilder(
      column: $table.targetAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get domain => $composableBuilder(
      column: $table.domain, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$HabitsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get targetPerWeek => $composableBuilder(
      column: $table.targetPerWeek,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get targetAmount => $composableBuilder(
      column: $table.targetAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get domain => $composableBuilder(
      column: $table.domain, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get archived => $composableBuilder(
      column: $table.archived, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$HabitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<int> get targetPerWeek => $composableBuilder(
      column: $table.targetPerWeek, builder: (column) => column);

  GeneratedColumn<double> get targetAmount => $composableBuilder(
      column: $table.targetAmount, builder: (column) => column);

  GeneratedColumn<String> get domain =>
      $composableBuilder(column: $table.domain, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$HabitsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HabitsTable,
    HabitRow,
    $$HabitsTableFilterComposer,
    $$HabitsTableOrderingComposer,
    $$HabitsTableAnnotationComposer,
    $$HabitsTableCreateCompanionBuilder,
    $$HabitsTableUpdateCompanionBuilder,
    (HabitRow, BaseReferences<_$AppDatabase, $HabitsTable, HabitRow>),
    HabitRow,
    PrefetchHooks Function()> {
  $$HabitsTableTableManager(_$AppDatabase db, $HabitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> unit = const Value.absent(),
            Value<int?> targetPerWeek = const Value.absent(),
            Value<double?> targetAmount = const Value.absent(),
            Value<String?> domain = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HabitsCompanion(
            id: id,
            title: title,
            type: type,
            unit: unit,
            targetPerWeek: targetPerWeek,
            targetAmount: targetAmount,
            domain: domain,
            archived: archived,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            Value<String> type = const Value.absent(),
            Value<String?> unit = const Value.absent(),
            Value<int?> targetPerWeek = const Value.absent(),
            Value<double?> targetAmount = const Value.absent(),
            Value<String?> domain = const Value.absent(),
            Value<bool> archived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HabitsCompanion.insert(
            id: id,
            title: title,
            type: type,
            unit: unit,
            targetPerWeek: targetPerWeek,
            targetAmount: targetAmount,
            domain: domain,
            archived: archived,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HabitsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HabitsTable,
    HabitRow,
    $$HabitsTableFilterComposer,
    $$HabitsTableOrderingComposer,
    $$HabitsTableAnnotationComposer,
    $$HabitsTableCreateCompanionBuilder,
    $$HabitsTableUpdateCompanionBuilder,
    (HabitRow, BaseReferences<_$AppDatabase, $HabitsTable, HabitRow>),
    HabitRow,
    PrefetchHooks Function()>;
typedef $$HabitLogsTableCreateCompanionBuilder = HabitLogsCompanion Function({
  required String id,
  required String habitId,
  required DateTime date,
  Value<bool> completed,
  Value<double?> amount,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$HabitLogsTableUpdateCompanionBuilder = HabitLogsCompanion Function({
  Value<String> id,
  Value<String> habitId,
  Value<DateTime> date,
  Value<bool> completed,
  Value<double?> amount,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$HabitLogsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitLogsTable> {
  $$HabitLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get habitId => $composableBuilder(
      column: $table.habitId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$HabitLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitLogsTable> {
  $$HabitLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get habitId => $composableBuilder(
      column: $table.habitId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$HabitLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitLogsTable> {
  $$HabitLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get habitId =>
      $composableBuilder(column: $table.habitId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$HabitLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HabitLogsTable,
    HabitLogRow,
    $$HabitLogsTableFilterComposer,
    $$HabitLogsTableOrderingComposer,
    $$HabitLogsTableAnnotationComposer,
    $$HabitLogsTableCreateCompanionBuilder,
    $$HabitLogsTableUpdateCompanionBuilder,
    (HabitLogRow, BaseReferences<_$AppDatabase, $HabitLogsTable, HabitLogRow>),
    HabitLogRow,
    PrefetchHooks Function()> {
  $$HabitLogsTableTableManager(_$AppDatabase db, $HabitLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> habitId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<bool> completed = const Value.absent(),
            Value<double?> amount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HabitLogsCompanion(
            id: id,
            habitId: habitId,
            date: date,
            completed: completed,
            amount: amount,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String habitId,
            required DateTime date,
            Value<bool> completed = const Value.absent(),
            Value<double?> amount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HabitLogsCompanion.insert(
            id: id,
            habitId: habitId,
            date: date,
            completed: completed,
            amount: amount,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HabitLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HabitLogsTable,
    HabitLogRow,
    $$HabitLogsTableFilterComposer,
    $$HabitLogsTableOrderingComposer,
    $$HabitLogsTableAnnotationComposer,
    $$HabitLogsTableCreateCompanionBuilder,
    $$HabitLogsTableUpdateCompanionBuilder,
    (HabitLogRow, BaseReferences<_$AppDatabase, $HabitLogsTable, HabitLogRow>),
    HabitLogRow,
    PrefetchHooks Function()>;
typedef $$FocusSessionsTableCreateCompanionBuilder = FocusSessionsCompanion
    Function({
  required String id,
  required String title,
  Value<String?> taskId,
  Value<String?> projectId,
  Value<int?> plannedMinutes,
  Value<DateTime> startedAt,
  Value<DateTime?> endedAt,
  Value<int?> focusedMinutes,
  Value<int> interruptions,
  Value<int> rowid,
});
typedef $$FocusSessionsTableUpdateCompanionBuilder = FocusSessionsCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<String?> taskId,
  Value<String?> projectId,
  Value<int?> plannedMinutes,
  Value<DateTime> startedAt,
  Value<DateTime?> endedAt,
  Value<int?> focusedMinutes,
  Value<int> interruptions,
  Value<int> rowid,
});

class $$FocusSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $FocusSessionsTable> {
  $$FocusSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get plannedMinutes => $composableBuilder(
      column: $table.plannedMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endedAt => $composableBuilder(
      column: $table.endedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get focusedMinutes => $composableBuilder(
      column: $table.focusedMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get interruptions => $composableBuilder(
      column: $table.interruptions, builder: (column) => ColumnFilters(column));
}

class $$FocusSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $FocusSessionsTable> {
  $$FocusSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get projectId => $composableBuilder(
      column: $table.projectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get plannedMinutes => $composableBuilder(
      column: $table.plannedMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endedAt => $composableBuilder(
      column: $table.endedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get focusedMinutes => $composableBuilder(
      column: $table.focusedMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get interruptions => $composableBuilder(
      column: $table.interruptions,
      builder: (column) => ColumnOrderings(column));
}

class $$FocusSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FocusSessionsTable> {
  $$FocusSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get taskId =>
      $composableBuilder(column: $table.taskId, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<int> get plannedMinutes => $composableBuilder(
      column: $table.plannedMinutes, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<int> get focusedMinutes => $composableBuilder(
      column: $table.focusedMinutes, builder: (column) => column);

  GeneratedColumn<int> get interruptions => $composableBuilder(
      column: $table.interruptions, builder: (column) => column);
}

class $$FocusSessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FocusSessionsTable,
    FocusSessionRow,
    $$FocusSessionsTableFilterComposer,
    $$FocusSessionsTableOrderingComposer,
    $$FocusSessionsTableAnnotationComposer,
    $$FocusSessionsTableCreateCompanionBuilder,
    $$FocusSessionsTableUpdateCompanionBuilder,
    (
      FocusSessionRow,
      BaseReferences<_$AppDatabase, $FocusSessionsTable, FocusSessionRow>
    ),
    FocusSessionRow,
    PrefetchHooks Function()> {
  $$FocusSessionsTableTableManager(_$AppDatabase db, $FocusSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FocusSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FocusSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FocusSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> taskId = const Value.absent(),
            Value<String?> projectId = const Value.absent(),
            Value<int?> plannedMinutes = const Value.absent(),
            Value<DateTime> startedAt = const Value.absent(),
            Value<DateTime?> endedAt = const Value.absent(),
            Value<int?> focusedMinutes = const Value.absent(),
            Value<int> interruptions = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FocusSessionsCompanion(
            id: id,
            title: title,
            taskId: taskId,
            projectId: projectId,
            plannedMinutes: plannedMinutes,
            startedAt: startedAt,
            endedAt: endedAt,
            focusedMinutes: focusedMinutes,
            interruptions: interruptions,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            Value<String?> taskId = const Value.absent(),
            Value<String?> projectId = const Value.absent(),
            Value<int?> plannedMinutes = const Value.absent(),
            Value<DateTime> startedAt = const Value.absent(),
            Value<DateTime?> endedAt = const Value.absent(),
            Value<int?> focusedMinutes = const Value.absent(),
            Value<int> interruptions = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FocusSessionsCompanion.insert(
            id: id,
            title: title,
            taskId: taskId,
            projectId: projectId,
            plannedMinutes: plannedMinutes,
            startedAt: startedAt,
            endedAt: endedAt,
            focusedMinutes: focusedMinutes,
            interruptions: interruptions,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FocusSessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FocusSessionsTable,
    FocusSessionRow,
    $$FocusSessionsTableFilterComposer,
    $$FocusSessionsTableOrderingComposer,
    $$FocusSessionsTableAnnotationComposer,
    $$FocusSessionsTableCreateCompanionBuilder,
    $$FocusSessionsTableUpdateCompanionBuilder,
    (
      FocusSessionRow,
      BaseReferences<_$AppDatabase, $FocusSessionsTable, FocusSessionRow>
    ),
    FocusSessionRow,
    PrefetchHooks Function()>;
typedef $$HealthLogsTableCreateCompanionBuilder = HealthLogsCompanion Function({
  required String id,
  required DateTime date,
  Value<int?> sleepMinutes,
  Value<double?> weightKg,
  Value<int?> waterMl,
  Value<int?> mood,
  Value<int?> energy,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$HealthLogsTableUpdateCompanionBuilder = HealthLogsCompanion Function({
  Value<String> id,
  Value<DateTime> date,
  Value<int?> sleepMinutes,
  Value<double?> weightKg,
  Value<int?> waterMl,
  Value<int?> mood,
  Value<int?> energy,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$HealthLogsTableFilterComposer
    extends Composer<_$AppDatabase, $HealthLogsTable> {
  $$HealthLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sleepMinutes => $composableBuilder(
      column: $table.sleepMinutes, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weightKg => $composableBuilder(
      column: $table.weightKg, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get waterMl => $composableBuilder(
      column: $table.waterMl, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get mood => $composableBuilder(
      column: $table.mood, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get energy => $composableBuilder(
      column: $table.energy, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$HealthLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $HealthLogsTable> {
  $$HealthLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sleepMinutes => $composableBuilder(
      column: $table.sleepMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weightKg => $composableBuilder(
      column: $table.weightKg, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get waterMl => $composableBuilder(
      column: $table.waterMl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get mood => $composableBuilder(
      column: $table.mood, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get energy => $composableBuilder(
      column: $table.energy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$HealthLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HealthLogsTable> {
  $$HealthLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get sleepMinutes => $composableBuilder(
      column: $table.sleepMinutes, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<int> get waterMl =>
      $composableBuilder(column: $table.waterMl, builder: (column) => column);

  GeneratedColumn<int> get mood =>
      $composableBuilder(column: $table.mood, builder: (column) => column);

  GeneratedColumn<int> get energy =>
      $composableBuilder(column: $table.energy, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$HealthLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HealthLogsTable,
    HealthLogRow,
    $$HealthLogsTableFilterComposer,
    $$HealthLogsTableOrderingComposer,
    $$HealthLogsTableAnnotationComposer,
    $$HealthLogsTableCreateCompanionBuilder,
    $$HealthLogsTableUpdateCompanionBuilder,
    (
      HealthLogRow,
      BaseReferences<_$AppDatabase, $HealthLogsTable, HealthLogRow>
    ),
    HealthLogRow,
    PrefetchHooks Function()> {
  $$HealthLogsTableTableManager(_$AppDatabase db, $HealthLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HealthLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HealthLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HealthLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int?> sleepMinutes = const Value.absent(),
            Value<double?> weightKg = const Value.absent(),
            Value<int?> waterMl = const Value.absent(),
            Value<int?> mood = const Value.absent(),
            Value<int?> energy = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HealthLogsCompanion(
            id: id,
            date: date,
            sleepMinutes: sleepMinutes,
            weightKg: weightKg,
            waterMl: waterMl,
            mood: mood,
            energy: energy,
            notes: notes,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime date,
            Value<int?> sleepMinutes = const Value.absent(),
            Value<double?> weightKg = const Value.absent(),
            Value<int?> waterMl = const Value.absent(),
            Value<int?> mood = const Value.absent(),
            Value<int?> energy = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HealthLogsCompanion.insert(
            id: id,
            date: date,
            sleepMinutes: sleepMinutes,
            weightKg: weightKg,
            waterMl: waterMl,
            mood: mood,
            energy: energy,
            notes: notes,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HealthLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HealthLogsTable,
    HealthLogRow,
    $$HealthLogsTableFilterComposer,
    $$HealthLogsTableOrderingComposer,
    $$HealthLogsTableAnnotationComposer,
    $$HealthLogsTableCreateCompanionBuilder,
    $$HealthLogsTableUpdateCompanionBuilder,
    (
      HealthLogRow,
      BaseReferences<_$AppDatabase, $HealthLogsTable, HealthLogRow>
    ),
    HealthLogRow,
    PrefetchHooks Function()>;
typedef $$StudySessionsTableCreateCompanionBuilder = StudySessionsCompanion
    Function({
  required String id,
  required String subject,
  Value<String?> topic,
  Value<DateTime> date,
  required int minutes,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$StudySessionsTableUpdateCompanionBuilder = StudySessionsCompanion
    Function({
  Value<String> id,
  Value<String> subject,
  Value<String?> topic,
  Value<DateTime> date,
  Value<int> minutes,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$StudySessionsTableFilterComposer
    extends Composer<_$AppDatabase, $StudySessionsTable> {
  $$StudySessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get topic => $composableBuilder(
      column: $table.topic, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minutes => $composableBuilder(
      column: $table.minutes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$StudySessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudySessionsTable> {
  $$StudySessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get topic => $composableBuilder(
      column: $table.topic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minutes => $composableBuilder(
      column: $table.minutes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$StudySessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudySessionsTable> {
  $$StudySessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<String> get topic =>
      $composableBuilder(column: $table.topic, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get minutes =>
      $composableBuilder(column: $table.minutes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$StudySessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StudySessionsTable,
    StudySessionRow,
    $$StudySessionsTableFilterComposer,
    $$StudySessionsTableOrderingComposer,
    $$StudySessionsTableAnnotationComposer,
    $$StudySessionsTableCreateCompanionBuilder,
    $$StudySessionsTableUpdateCompanionBuilder,
    (
      StudySessionRow,
      BaseReferences<_$AppDatabase, $StudySessionsTable, StudySessionRow>
    ),
    StudySessionRow,
    PrefetchHooks Function()> {
  $$StudySessionsTableTableManager(_$AppDatabase db, $StudySessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudySessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudySessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudySessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> subject = const Value.absent(),
            Value<String?> topic = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> minutes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StudySessionsCompanion(
            id: id,
            subject: subject,
            topic: topic,
            date: date,
            minutes: minutes,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String subject,
            Value<String?> topic = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            required int minutes,
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StudySessionsCompanion.insert(
            id: id,
            subject: subject,
            topic: topic,
            date: date,
            minutes: minutes,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StudySessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StudySessionsTable,
    StudySessionRow,
    $$StudySessionsTableFilterComposer,
    $$StudySessionsTableOrderingComposer,
    $$StudySessionsTableAnnotationComposer,
    $$StudySessionsTableCreateCompanionBuilder,
    $$StudySessionsTableUpdateCompanionBuilder,
    (
      StudySessionRow,
      BaseReferences<_$AppDatabase, $StudySessionsTable, StudySessionRow>
    ),
    StudySessionRow,
    PrefetchHooks Function()>;
typedef $$CareerPositionsTableCreateCompanionBuilder = CareerPositionsCompanion
    Function({
  required String id,
  required String employer,
  required String role,
  required DateTime startDate,
  Value<DateTime?> endDate,
  Value<double?> salary,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$CareerPositionsTableUpdateCompanionBuilder = CareerPositionsCompanion
    Function({
  Value<String> id,
  Value<String> employer,
  Value<String> role,
  Value<DateTime> startDate,
  Value<DateTime?> endDate,
  Value<double?> salary,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$CareerPositionsTableFilterComposer
    extends Composer<_$AppDatabase, $CareerPositionsTable> {
  $$CareerPositionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get employer => $composableBuilder(
      column: $table.employer, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get salary => $composableBuilder(
      column: $table.salary, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$CareerPositionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CareerPositionsTable> {
  $$CareerPositionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get employer => $composableBuilder(
      column: $table.employer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get salary => $composableBuilder(
      column: $table.salary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$CareerPositionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CareerPositionsTable> {
  $$CareerPositionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get employer =>
      $composableBuilder(column: $table.employer, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<double> get salary =>
      $composableBuilder(column: $table.salary, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CareerPositionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CareerPositionsTable,
    CareerPositionRow,
    $$CareerPositionsTableFilterComposer,
    $$CareerPositionsTableOrderingComposer,
    $$CareerPositionsTableAnnotationComposer,
    $$CareerPositionsTableCreateCompanionBuilder,
    $$CareerPositionsTableUpdateCompanionBuilder,
    (
      CareerPositionRow,
      BaseReferences<_$AppDatabase, $CareerPositionsTable, CareerPositionRow>
    ),
    CareerPositionRow,
    PrefetchHooks Function()> {
  $$CareerPositionsTableTableManager(
      _$AppDatabase db, $CareerPositionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CareerPositionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CareerPositionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CareerPositionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> employer = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<double?> salary = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CareerPositionsCompanion(
            id: id,
            employer: employer,
            role: role,
            startDate: startDate,
            endDate: endDate,
            salary: salary,
            notes: notes,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String employer,
            required String role,
            required DateTime startDate,
            Value<DateTime?> endDate = const Value.absent(),
            Value<double?> salary = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CareerPositionsCompanion.insert(
            id: id,
            employer: employer,
            role: role,
            startDate: startDate,
            endDate: endDate,
            salary: salary,
            notes: notes,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CareerPositionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CareerPositionsTable,
    CareerPositionRow,
    $$CareerPositionsTableFilterComposer,
    $$CareerPositionsTableOrderingComposer,
    $$CareerPositionsTableAnnotationComposer,
    $$CareerPositionsTableCreateCompanionBuilder,
    $$CareerPositionsTableUpdateCompanionBuilder,
    (
      CareerPositionRow,
      BaseReferences<_$AppDatabase, $CareerPositionsTable, CareerPositionRow>
    ),
    CareerPositionRow,
    PrefetchHooks Function()>;
typedef $$CareerAchievementsTableCreateCompanionBuilder
    = CareerAchievementsCompanion Function({
  required String id,
  Value<String?> positionId,
  required String title,
  Value<String?> description,
  Value<DateTime> date,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$CareerAchievementsTableUpdateCompanionBuilder
    = CareerAchievementsCompanion Function({
  Value<String> id,
  Value<String?> positionId,
  Value<String> title,
  Value<String?> description,
  Value<DateTime> date,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$CareerAchievementsTableFilterComposer
    extends Composer<_$AppDatabase, $CareerAchievementsTable> {
  $$CareerAchievementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get positionId => $composableBuilder(
      column: $table.positionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$CareerAchievementsTableOrderingComposer
    extends Composer<_$AppDatabase, $CareerAchievementsTable> {
  $$CareerAchievementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get positionId => $composableBuilder(
      column: $table.positionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$CareerAchievementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CareerAchievementsTable> {
  $$CareerAchievementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get positionId => $composableBuilder(
      column: $table.positionId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CareerAchievementsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CareerAchievementsTable,
    CareerAchievementRow,
    $$CareerAchievementsTableFilterComposer,
    $$CareerAchievementsTableOrderingComposer,
    $$CareerAchievementsTableAnnotationComposer,
    $$CareerAchievementsTableCreateCompanionBuilder,
    $$CareerAchievementsTableUpdateCompanionBuilder,
    (
      CareerAchievementRow,
      BaseReferences<_$AppDatabase, $CareerAchievementsTable,
          CareerAchievementRow>
    ),
    CareerAchievementRow,
    PrefetchHooks Function()> {
  $$CareerAchievementsTableTableManager(
      _$AppDatabase db, $CareerAchievementsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CareerAchievementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CareerAchievementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CareerAchievementsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> positionId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CareerAchievementsCompanion(
            id: id,
            positionId: positionId,
            title: title,
            description: description,
            date: date,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> positionId = const Value.absent(),
            required String title,
            Value<String?> description = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CareerAchievementsCompanion.insert(
            id: id,
            positionId: positionId,
            title: title,
            description: description,
            date: date,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CareerAchievementsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CareerAchievementsTable,
    CareerAchievementRow,
    $$CareerAchievementsTableFilterComposer,
    $$CareerAchievementsTableOrderingComposer,
    $$CareerAchievementsTableAnnotationComposer,
    $$CareerAchievementsTableCreateCompanionBuilder,
    $$CareerAchievementsTableUpdateCompanionBuilder,
    (
      CareerAchievementRow,
      BaseReferences<_$AppDatabase, $CareerAchievementsTable,
          CareerAchievementRow>
    ),
    CareerAchievementRow,
    PrefetchHooks Function()>;
typedef $$BusinessClientsTableCreateCompanionBuilder = BusinessClientsCompanion
    Function({
  required String id,
  required String name,
  Value<String?> contact,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$BusinessClientsTableUpdateCompanionBuilder = BusinessClientsCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> contact,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$BusinessClientsTableFilterComposer
    extends Composer<_$AppDatabase, $BusinessClientsTable> {
  $$BusinessClientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$BusinessClientsTableOrderingComposer
    extends Composer<_$AppDatabase, $BusinessClientsTable> {
  $$BusinessClientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$BusinessClientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusinessClientsTable> {
  $$BusinessClientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$BusinessClientsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BusinessClientsTable,
    BusinessClientRow,
    $$BusinessClientsTableFilterComposer,
    $$BusinessClientsTableOrderingComposer,
    $$BusinessClientsTableAnnotationComposer,
    $$BusinessClientsTableCreateCompanionBuilder,
    $$BusinessClientsTableUpdateCompanionBuilder,
    (
      BusinessClientRow,
      BaseReferences<_$AppDatabase, $BusinessClientsTable, BusinessClientRow>
    ),
    BusinessClientRow,
    PrefetchHooks Function()> {
  $$BusinessClientsTableTableManager(
      _$AppDatabase db, $BusinessClientsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusinessClientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusinessClientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusinessClientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> contact = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BusinessClientsCompanion(
            id: id,
            name: name,
            contact: contact,
            notes: notes,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> contact = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BusinessClientsCompanion.insert(
            id: id,
            name: name,
            contact: contact,
            notes: notes,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BusinessClientsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BusinessClientsTable,
    BusinessClientRow,
    $$BusinessClientsTableFilterComposer,
    $$BusinessClientsTableOrderingComposer,
    $$BusinessClientsTableAnnotationComposer,
    $$BusinessClientsTableCreateCompanionBuilder,
    $$BusinessClientsTableUpdateCompanionBuilder,
    (
      BusinessClientRow,
      BaseReferences<_$AppDatabase, $BusinessClientsTable, BusinessClientRow>
    ),
    BusinessClientRow,
    PrefetchHooks Function()>;
typedef $$BusinessProjectsTableCreateCompanionBuilder
    = BusinessProjectsCompanion Function({
  required String id,
  Value<String?> clientId,
  required String name,
  Value<String> status,
  Value<double> revenue,
  Value<double> expenses,
  Value<double> hoursSpent,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$BusinessProjectsTableUpdateCompanionBuilder
    = BusinessProjectsCompanion Function({
  Value<String> id,
  Value<String?> clientId,
  Value<String> name,
  Value<String> status,
  Value<double> revenue,
  Value<double> expenses,
  Value<double> hoursSpent,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$BusinessProjectsTableFilterComposer
    extends Composer<_$AppDatabase, $BusinessProjectsTable> {
  $$BusinessProjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clientId => $composableBuilder(
      column: $table.clientId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get revenue => $composableBuilder(
      column: $table.revenue, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get expenses => $composableBuilder(
      column: $table.expenses, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get hoursSpent => $composableBuilder(
      column: $table.hoursSpent, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$BusinessProjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $BusinessProjectsTable> {
  $$BusinessProjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clientId => $composableBuilder(
      column: $table.clientId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get revenue => $composableBuilder(
      column: $table.revenue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get expenses => $composableBuilder(
      column: $table.expenses, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get hoursSpent => $composableBuilder(
      column: $table.hoursSpent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$BusinessProjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusinessProjectsTable> {
  $$BusinessProjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get revenue =>
      $composableBuilder(column: $table.revenue, builder: (column) => column);

  GeneratedColumn<double> get expenses =>
      $composableBuilder(column: $table.expenses, builder: (column) => column);

  GeneratedColumn<double> get hoursSpent => $composableBuilder(
      column: $table.hoursSpent, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$BusinessProjectsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BusinessProjectsTable,
    BusinessProjectRow,
    $$BusinessProjectsTableFilterComposer,
    $$BusinessProjectsTableOrderingComposer,
    $$BusinessProjectsTableAnnotationComposer,
    $$BusinessProjectsTableCreateCompanionBuilder,
    $$BusinessProjectsTableUpdateCompanionBuilder,
    (
      BusinessProjectRow,
      BaseReferences<_$AppDatabase, $BusinessProjectsTable, BusinessProjectRow>
    ),
    BusinessProjectRow,
    PrefetchHooks Function()> {
  $$BusinessProjectsTableTableManager(
      _$AppDatabase db, $BusinessProjectsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusinessProjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusinessProjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusinessProjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> clientId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<double> revenue = const Value.absent(),
            Value<double> expenses = const Value.absent(),
            Value<double> hoursSpent = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BusinessProjectsCompanion(
            id: id,
            clientId: clientId,
            name: name,
            status: status,
            revenue: revenue,
            expenses: expenses,
            hoursSpent: hoursSpent,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> clientId = const Value.absent(),
            required String name,
            Value<String> status = const Value.absent(),
            Value<double> revenue = const Value.absent(),
            Value<double> expenses = const Value.absent(),
            Value<double> hoursSpent = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BusinessProjectsCompanion.insert(
            id: id,
            clientId: clientId,
            name: name,
            status: status,
            revenue: revenue,
            expenses: expenses,
            hoursSpent: hoursSpent,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BusinessProjectsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BusinessProjectsTable,
    BusinessProjectRow,
    $$BusinessProjectsTableFilterComposer,
    $$BusinessProjectsTableOrderingComposer,
    $$BusinessProjectsTableAnnotationComposer,
    $$BusinessProjectsTableCreateCompanionBuilder,
    $$BusinessProjectsTableUpdateCompanionBuilder,
    (
      BusinessProjectRow,
      BaseReferences<_$AppDatabase, $BusinessProjectsTable, BusinessProjectRow>
    ),
    BusinessProjectRow,
    PrefetchHooks Function()>;
typedef $$VehiclesTableCreateCompanionBuilder = VehiclesCompanion Function({
  required String id,
  required String name,
  Value<String> type,
  Value<double> odometerKm,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$VehiclesTableUpdateCompanionBuilder = VehiclesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> type,
  Value<double> odometerKm,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$VehiclesTableFilterComposer
    extends Composer<_$AppDatabase, $VehiclesTable> {
  $$VehiclesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get odometerKm => $composableBuilder(
      column: $table.odometerKm, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$VehiclesTableOrderingComposer
    extends Composer<_$AppDatabase, $VehiclesTable> {
  $$VehiclesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get odometerKm => $composableBuilder(
      column: $table.odometerKm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$VehiclesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VehiclesTable> {
  $$VehiclesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get odometerKm => $composableBuilder(
      column: $table.odometerKm, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$VehiclesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VehiclesTable,
    VehicleRow,
    $$VehiclesTableFilterComposer,
    $$VehiclesTableOrderingComposer,
    $$VehiclesTableAnnotationComposer,
    $$VehiclesTableCreateCompanionBuilder,
    $$VehiclesTableUpdateCompanionBuilder,
    (VehicleRow, BaseReferences<_$AppDatabase, $VehiclesTable, VehicleRow>),
    VehicleRow,
    PrefetchHooks Function()> {
  $$VehiclesTableTableManager(_$AppDatabase db, $VehiclesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehiclesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehiclesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehiclesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<double> odometerKm = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VehiclesCompanion(
            id: id,
            name: name,
            type: type,
            odometerKm: odometerKm,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String> type = const Value.absent(),
            Value<double> odometerKm = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VehiclesCompanion.insert(
            id: id,
            name: name,
            type: type,
            odometerKm: odometerKm,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$VehiclesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VehiclesTable,
    VehicleRow,
    $$VehiclesTableFilterComposer,
    $$VehiclesTableOrderingComposer,
    $$VehiclesTableAnnotationComposer,
    $$VehiclesTableCreateCompanionBuilder,
    $$VehiclesTableUpdateCompanionBuilder,
    (VehicleRow, BaseReferences<_$AppDatabase, $VehiclesTable, VehicleRow>),
    VehicleRow,
    PrefetchHooks Function()>;
typedef $$VehicleFuelLogsTableCreateCompanionBuilder = VehicleFuelLogsCompanion
    Function({
  required String id,
  required String vehicleId,
  Value<DateTime> date,
  required double litres,
  required double cost,
  Value<double?> odometerKm,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$VehicleFuelLogsTableUpdateCompanionBuilder = VehicleFuelLogsCompanion
    Function({
  Value<String> id,
  Value<String> vehicleId,
  Value<DateTime> date,
  Value<double> litres,
  Value<double> cost,
  Value<double?> odometerKm,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$VehicleFuelLogsTableFilterComposer
    extends Composer<_$AppDatabase, $VehicleFuelLogsTable> {
  $$VehicleFuelLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get vehicleId => $composableBuilder(
      column: $table.vehicleId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get litres => $composableBuilder(
      column: $table.litres, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get odometerKm => $composableBuilder(
      column: $table.odometerKm, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$VehicleFuelLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $VehicleFuelLogsTable> {
  $$VehicleFuelLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get vehicleId => $composableBuilder(
      column: $table.vehicleId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get litres => $composableBuilder(
      column: $table.litres, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get odometerKm => $composableBuilder(
      column: $table.odometerKm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$VehicleFuelLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VehicleFuelLogsTable> {
  $$VehicleFuelLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get vehicleId =>
      $composableBuilder(column: $table.vehicleId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get litres =>
      $composableBuilder(column: $table.litres, builder: (column) => column);

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<double> get odometerKm => $composableBuilder(
      column: $table.odometerKm, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$VehicleFuelLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VehicleFuelLogsTable,
    VehicleFuelLogRow,
    $$VehicleFuelLogsTableFilterComposer,
    $$VehicleFuelLogsTableOrderingComposer,
    $$VehicleFuelLogsTableAnnotationComposer,
    $$VehicleFuelLogsTableCreateCompanionBuilder,
    $$VehicleFuelLogsTableUpdateCompanionBuilder,
    (
      VehicleFuelLogRow,
      BaseReferences<_$AppDatabase, $VehicleFuelLogsTable, VehicleFuelLogRow>
    ),
    VehicleFuelLogRow,
    PrefetchHooks Function()> {
  $$VehicleFuelLogsTableTableManager(
      _$AppDatabase db, $VehicleFuelLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehicleFuelLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehicleFuelLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehicleFuelLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> vehicleId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<double> litres = const Value.absent(),
            Value<double> cost = const Value.absent(),
            Value<double?> odometerKm = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VehicleFuelLogsCompanion(
            id: id,
            vehicleId: vehicleId,
            date: date,
            litres: litres,
            cost: cost,
            odometerKm: odometerKm,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String vehicleId,
            Value<DateTime> date = const Value.absent(),
            required double litres,
            required double cost,
            Value<double?> odometerKm = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VehicleFuelLogsCompanion.insert(
            id: id,
            vehicleId: vehicleId,
            date: date,
            litres: litres,
            cost: cost,
            odometerKm: odometerKm,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$VehicleFuelLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VehicleFuelLogsTable,
    VehicleFuelLogRow,
    $$VehicleFuelLogsTableFilterComposer,
    $$VehicleFuelLogsTableOrderingComposer,
    $$VehicleFuelLogsTableAnnotationComposer,
    $$VehicleFuelLogsTableCreateCompanionBuilder,
    $$VehicleFuelLogsTableUpdateCompanionBuilder,
    (
      VehicleFuelLogRow,
      BaseReferences<_$AppDatabase, $VehicleFuelLogsTable, VehicleFuelLogRow>
    ),
    VehicleFuelLogRow,
    PrefetchHooks Function()>;
typedef $$VehicleMaintenanceLogsTableCreateCompanionBuilder
    = VehicleMaintenanceLogsCompanion Function({
  required String id,
  required String vehicleId,
  required String type,
  Value<double?> cost,
  Value<String?> notes,
  Value<DateTime> date,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$VehicleMaintenanceLogsTableUpdateCompanionBuilder
    = VehicleMaintenanceLogsCompanion Function({
  Value<String> id,
  Value<String> vehicleId,
  Value<String> type,
  Value<double?> cost,
  Value<String?> notes,
  Value<DateTime> date,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$VehicleMaintenanceLogsTableFilterComposer
    extends Composer<_$AppDatabase, $VehicleMaintenanceLogsTable> {
  $$VehicleMaintenanceLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get vehicleId => $composableBuilder(
      column: $table.vehicleId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$VehicleMaintenanceLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $VehicleMaintenanceLogsTable> {
  $$VehicleMaintenanceLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get vehicleId => $composableBuilder(
      column: $table.vehicleId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$VehicleMaintenanceLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VehicleMaintenanceLogsTable> {
  $$VehicleMaintenanceLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get vehicleId =>
      $composableBuilder(column: $table.vehicleId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$VehicleMaintenanceLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VehicleMaintenanceLogsTable,
    VehicleMaintenanceRow,
    $$VehicleMaintenanceLogsTableFilterComposer,
    $$VehicleMaintenanceLogsTableOrderingComposer,
    $$VehicleMaintenanceLogsTableAnnotationComposer,
    $$VehicleMaintenanceLogsTableCreateCompanionBuilder,
    $$VehicleMaintenanceLogsTableUpdateCompanionBuilder,
    (
      VehicleMaintenanceRow,
      BaseReferences<_$AppDatabase, $VehicleMaintenanceLogsTable,
          VehicleMaintenanceRow>
    ),
    VehicleMaintenanceRow,
    PrefetchHooks Function()> {
  $$VehicleMaintenanceLogsTableTableManager(
      _$AppDatabase db, $VehicleMaintenanceLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehicleMaintenanceLogsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$VehicleMaintenanceLogsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehicleMaintenanceLogsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> vehicleId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<double?> cost = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VehicleMaintenanceLogsCompanion(
            id: id,
            vehicleId: vehicleId,
            type: type,
            cost: cost,
            notes: notes,
            date: date,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String vehicleId,
            required String type,
            Value<double?> cost = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VehicleMaintenanceLogsCompanion.insert(
            id: id,
            vehicleId: vehicleId,
            type: type,
            cost: cost,
            notes: notes,
            date: date,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$VehicleMaintenanceLogsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $VehicleMaintenanceLogsTable,
        VehicleMaintenanceRow,
        $$VehicleMaintenanceLogsTableFilterComposer,
        $$VehicleMaintenanceLogsTableOrderingComposer,
        $$VehicleMaintenanceLogsTableAnnotationComposer,
        $$VehicleMaintenanceLogsTableCreateCompanionBuilder,
        $$VehicleMaintenanceLogsTableUpdateCompanionBuilder,
        (
          VehicleMaintenanceRow,
          BaseReferences<_$AppDatabase, $VehicleMaintenanceLogsTable,
              VehicleMaintenanceRow>
        ),
        VehicleMaintenanceRow,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db, _db.projects);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$GoalProgressEntriesTableTableManager get goalProgressEntries =>
      $$GoalProgressEntriesTableTableManager(_db, _db.goalProgressEntries);
  $$CalendarEventsTableTableManager get calendarEvents =>
      $$CalendarEventsTableTableManager(_db, _db.calendarEvents);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db, _db.accounts);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
  $$BudgetsTableTableManager get budgets =>
      $$BudgetsTableTableManager(_db, _db.budgets);
  $$JournalEntriesTableTableManager get journalEntries =>
      $$JournalEntriesTableTableManager(_db, _db.journalEntries);
  $$HabitsTableTableManager get habits =>
      $$HabitsTableTableManager(_db, _db.habits);
  $$HabitLogsTableTableManager get habitLogs =>
      $$HabitLogsTableTableManager(_db, _db.habitLogs);
  $$FocusSessionsTableTableManager get focusSessions =>
      $$FocusSessionsTableTableManager(_db, _db.focusSessions);
  $$HealthLogsTableTableManager get healthLogs =>
      $$HealthLogsTableTableManager(_db, _db.healthLogs);
  $$StudySessionsTableTableManager get studySessions =>
      $$StudySessionsTableTableManager(_db, _db.studySessions);
  $$CareerPositionsTableTableManager get careerPositions =>
      $$CareerPositionsTableTableManager(_db, _db.careerPositions);
  $$CareerAchievementsTableTableManager get careerAchievements =>
      $$CareerAchievementsTableTableManager(_db, _db.careerAchievements);
  $$BusinessClientsTableTableManager get businessClients =>
      $$BusinessClientsTableTableManager(_db, _db.businessClients);
  $$BusinessProjectsTableTableManager get businessProjects =>
      $$BusinessProjectsTableTableManager(_db, _db.businessProjects);
  $$VehiclesTableTableManager get vehicles =>
      $$VehiclesTableTableManager(_db, _db.vehicles);
  $$VehicleFuelLogsTableTableManager get vehicleFuelLogs =>
      $$VehicleFuelLogsTableTableManager(_db, _db.vehicleFuelLogs);
  $$VehicleMaintenanceLogsTableTableManager get vehicleMaintenanceLogs =>
      $$VehicleMaintenanceLogsTableTableManager(
          _db, _db.vehicleMaintenanceLogs);
}
