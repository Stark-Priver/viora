import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/database/tables.dart';
import '../../../../core/database/daos/tasks_dao.dart';
import '../../../../core/database/daos/money_dao.dart';
import '../../../../core/design_system/tokens/colors.dart';
import '../../../calendar/presentation/providers/calendar_providers.dart';
import '../../../goals/presentation/providers/goals_providers.dart';
import '../../../money/presentation/providers/money_providers.dart';
import '../../../tasks/presentation/providers/tasks_providers.dart';
import '../../../focus/presentation/providers/focus_providers.dart';
import '../../domain/home_dashboard_data.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

bool _isToday(DateTime d) {
  final now = DateTime.now();
  return d.year == now.year && d.month == now.month && d.day == now.day;
}

(String, Color, IconData) _domainVisuals(String domain) {
  return switch (domain) {
    LifeDomains.work => ('Work', VioraColors.domainWork, IconsaxPlusBroken.briefcase),
    LifeDomains.study => ('Study', VioraColors.domainStudy, IconsaxPlusBroken.teacher),
    LifeDomains.business => ('Business', VioraColors.domainBusiness, IconsaxPlusBroken.shop),
    LifeDomains.health => ('Health', VioraColors.domainHealth, IconsaxPlusBroken.heart),
    LifeDomains.finance => ('Finance', VioraColors.domainFinance, IconsaxPlusBroken.wallet),
    LifeDomains.social => ('Social', VioraColors.domainSocial, IconsaxPlusBroken.people),
    LifeDomains.transport => ('Transport', VioraColors.domainTransport, IconsaxPlusBroken.car),
    LifeDomains.project => ('Project', VioraColors.domainBusiness, IconsaxPlusBroken.folder_open),
    _ => ('Personal', VioraColors.domainScreen, IconsaxPlusBroken.user),
  };
}

/// Home's "today" numbers, entirely derived from the same database every
/// other screen reads and writes — no sample/demo data. Recomputes whenever
/// any of the underlying feature streams change.
final homeDashboardProvider = Provider.autoDispose<HomeDashboardData>((ref) {
  final now = DateTime.now();

  final events = (ref.watch(monthEventsStreamProvider).valueOrNull ?? const []).where((e) => _isToday(e.start)).toList()
    ..sort((a, b) => a.start.compareTo(b.start));

  final sessions = ref.watch(recentSessionsProvider).valueOrNull ?? const [];
  final todaySessions = sessions.where((s) => _isToday(s.startedAt)).toList();

  final plannedMinutes = events.fold<int>(0, (sum, e) => sum + e.end.difference(e.start).inMinutes);
  final actualMinutes = todaySessions.where((s) => s.focusedMinutes != null).fold<int>(0, (sum, s) => sum + s.focusedMinutes!);

  final upcoming = events.where((e) => e.start.isAfter(now)).toList();
  final nextEvent = upcoming.isEmpty
      ? null
      : UpcomingEvent(time: DateFormat('HH:mm').format(upcoming.first.start), title: upcoming.first.title, domain: upcoming.first.domain);

  final transactions = ref.watch(transactionsStreamProvider).valueOrNull ?? const [];
  final todayTx = transactions.where((t) => _isToday(t.occurredAt));
  final income = todayTx.where((t) => t.type == TransactionTypes.income).fold<double>(0, (s, t) => s + t.amount);
  final spent = todayTx.where((t) => t.type == TransactionTypes.expense).fold<double>(0, (s, t) => s + t.amount);

  final minutesByDomain = <String, int>{};
  for (final e in events) {
    minutesByDomain.update(e.domain, (v) => v + e.end.difference(e.start).inMinutes, ifAbsent: () => e.end.difference(e.start).inMinutes);
  }
  final lifeSnapshot = minutesByDomain.entries.map((entry) {
    final (label, color, icon) = _domainVisuals(entry.key);
    return LifeDomainMinutes(label: label, minutes: entry.value, color: color, icon: icon);
  }).toList();

  final completedSessions = todaySessions.where((s) => s.focusedMinutes != null && s.plannedMinutes != null && s.plannedMinutes! > 0);
  final focusScore = completedSessions.isEmpty
      ? 0.0
      : completedSessions.map((s) => (s.focusedMinutes! / s.plannedMinutes!).clamp(0.0, 1.0)).reduce((a, b) => a + b) / completedSessions.length;

  final tasks = ref.watch(allTasksStreamProvider).valueOrNull ?? const [];
  final tasksDueToday = tasks.where((t) => t.deadline != null && _isToday(t.deadline!)).toList();
  final planAdherence = tasksDueToday.isEmpty
      ? 0.0
      : tasksDueToday.where((t) => t.status == TaskStatuses.completed).length / tasksDueToday.length;

  final goalRows = ref.watch(goalsStreamProvider).valueOrNull ?? const [];
  final fmt = NumberFormat.decimalPattern();
  final goals = goalRows.take(3).map((g) {
    final hasTarget = g.targetValue != null && g.targetValue! > 0;
    final progress = hasTarget ? (g.currentValue / g.targetValue!).clamp(0.0, 1.0) : 0.0;
    final detail = hasTarget
        ? '${fmt.format(g.currentValue)} / ${fmt.format(g.targetValue)} ${g.unit ?? ''}'
        : '${fmt.format(g.currentValue)} ${g.unit ?? ''} logged';
    return GoalProgress(title: g.title, progress: progress, detail: detail);
  }).toList();

  final overdueTasks = tasks.where((t) => t.deadline != null && t.deadline!.isBefore(now) && t.status != TaskStatuses.completed && t.status != TaskStatuses.cancelled).length;
  final alerts = <DashboardAlert>[
    if (overdueTasks > 0)
      DashboardAlert(
        message: overdueTasks == 1 ? '1 task is overdue.' : '$overdueTasks tasks are overdue.',
        severity: AlertSeverity.warning,
        icon: IconsaxPlusBroken.calendar_remove,
      ),
  ];

  return HomeDashboardData(
    date: now,
    plannedMinutes: plannedMinutes,
    actualMinutes: actualMinutes,
    nextEvent: nextEvent,
    money: MoneySnapshot(income: income, spent: spent, net: income - spent),
    lifeSnapshot: lifeSnapshot,
    sleepMinutes: 0,
    focusScore: focusScore,
    planAdherence: planAdherence,
    goals: goals,
    alerts: alerts,
  );
});
