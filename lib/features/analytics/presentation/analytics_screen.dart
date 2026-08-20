import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/database/daos/tasks_dao.dart';
import '../../../core/database/daos/money_dao.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_progress_bar.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/design_system/widgets/viora_stat.dart';
import '../../focus/presentation/providers/focus_providers.dart';
import '../../goals/presentation/providers/goals_providers.dart';
import '../../habits/presentation/providers/habits_providers.dart';
import '../../money/presentation/providers/money_providers.dart';
import '../../tasks/presentation/providers/tasks_providers.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(allTasksStreamProvider).valueOrNull ?? const [];
    final goals = ref.watch(goalsStreamProvider).valueOrNull ?? const [];
    final transactions = ref.watch(transactionsStreamProvider).valueOrNull ?? const [];
    final habits = ref.watch(habitsStreamProvider).valueOrNull ?? const [];
    final habitLogs = ref.watch(habitLogsStreamProvider).valueOrNull ?? const [];
    final sessions = ref.watch(recentSessionsProvider).valueOrNull ?? const [];

    final now = DateTime.now();
    final weekStart = DateTime(now.year, now.month, now.day).subtract(Duration(days: now.weekday - 1));

    final tasksThisWeek = tasks.where((t) => t.createdAt.isAfter(weekStart)).toList();
    final completedThisWeek = tasksThisWeek.where((t) => t.status == TaskStatuses.completed).length;
    final taskCompletionRate = tasksThisWeek.isEmpty ? 0.0 : completedThisWeek / tasksThisWeek.length;

    final monthStart = DateTime(now.year, now.month, 1);
    final spendThisMonth = transactions
        .where((t) => t.type == TransactionTypes.expense && t.occurredAt.isAfter(monthStart))
        .fold<double>(0, (s, t) => s + t.amount);

    final focusMinutesThisWeek = sessions
        .where((s) => s.startedAt.isAfter(weekStart) && s.focusedMinutes != null)
        .fold<int>(0, (s, session) => s + session.focusedMinutes!);

    final habitLogsThisWeek = habitLogs.where((l) => l.completed && l.date.isAfter(weekStart.subtract(const Duration(seconds: 1))));
    final possibleHabitDays = habits.length * 7;
    final habitConsistency = possibleHabitDays == 0 ? 0.0 : habitLogsThisWeek.length / possibleHabitDays;

    final goalsWithTarget = goals.where((g) => (g.targetValue ?? 0) > 0).toList();
    final avgGoalProgress = goalsWithTarget.isEmpty
        ? 0.0
        : goalsWithTarget.map((g) => (g.currentValue / g.targetValue!).clamp(0, 1)).reduce((a, b) => a + b) / goalsWithTarget.length;

    final fmt = NumberFormat.decimalPattern();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VioraSection(title: 'Analytics', subtitle: 'This week, by the numbers'),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth >= 700 ? 3 : (constraints.maxWidth >= 420 ? 2 : 1);
              final cardWidth = (constraints.maxWidth - (columns - 1) * VioraSpacing.lg) / columns;
              return Wrap(
                spacing: VioraSpacing.lg,
                runSpacing: VioraSpacing.lg,
                children: [
                  SizedBox(
                    width: cardWidth,
                    child: VioraCard(
                      child: VioraStat(label: 'Focused time', value: focusMinutesThisWeek.toDouble(), formatter: (v) => '${(v ~/ 60)}h ${(v % 60).round()}m', icon: Icons.center_focus_strong_rounded, metricSize: 24),
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: VioraCard(
                      child: VioraStat(label: 'Task completion', value: taskCompletionRate * 100, formatter: (v) => '${v.round()}%', icon: Icons.check_circle_outline_rounded, metricSize: 24),
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: VioraCard(
                      child: VioraStat(label: 'Spend (month)', value: spendThisMonth, formatter: fmt.format, icon: Icons.account_balance_wallet_outlined, metricSize: 24),
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: VioraCard(
                      child: VioraStat(label: 'Habit consistency', value: habitConsistency * 100, formatter: (v) => '${v.round()}%', icon: Icons.repeat_rounded, metricSize: 24),
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: VioraCard(
                      child: VioraStat(label: 'Active goals', value: goals.length.toDouble(), formatter: (v) => v.round().toString(), icon: Icons.flag_outlined, metricSize: 24),
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: VioraCard(
                      child: VioraStat(label: 'Tasks this week', value: tasksThisWeek.length.toDouble(), formatter: (v) => v.round().toString(), icon: Icons.checklist_rounded, metricSize: 24),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: VioraSpacing.xl2),
          const VioraSection(title: 'Goal velocity', subtitle: 'Average progress across goals with a target'),
          VioraCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VioraProgressBar(progress: avgGoalProgress),
                const SizedBox(height: VioraSpacing.sm),
                Text('${(avgGoalProgress * 100).round()}% average across ${goalsWithTarget.length} goal(s)', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
