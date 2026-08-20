import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/database/daos/tasks_dao.dart';
import '../../../core/database/daos/money_dao.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/design_system/widgets/viora_surface.dart';
import '../../focus/presentation/providers/focus_providers.dart';
import '../../goals/presentation/providers/goals_providers.dart';
import '../../habits/presentation/providers/habits_providers.dart';
import '../../money/presentation/providers/money_providers.dart';
import '../../tasks/presentation/providers/tasks_providers.dart';
import '../../education/presentation/providers/education_providers.dart';

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;
    final fmt = NumberFormat.decimalPattern();

    final tasks = ref.watch(allTasksStreamProvider).valueOrNull ?? const [];
    final sessions = ref.watch(recentSessionsProvider).valueOrNull ?? const [];
    final transactions = ref.watch(transactionsStreamProvider).valueOrNull ?? const [];
    final habits = ref.watch(habitsStreamProvider).valueOrNull ?? const [];
    final habitLogs = ref.watch(habitLogsStreamProvider).valueOrNull ?? const [];
    final goals = ref.watch(goalsStreamProvider).valueOrNull ?? const [];
    final studySessions = ref.watch(studySessionsProvider).valueOrNull ?? const [];

    final now = DateTime.now();
    final weekStart = DateTime(now.year, now.month, now.day).subtract(Duration(days: now.weekday - 1));
    final weekEnd = weekStart.add(const Duration(days: 7));
    bool inWeek(DateTime d) => d.isAfter(weekStart.subtract(const Duration(seconds: 1))) && d.isBefore(weekEnd);

    final tasksThisWeek = tasks.where((t) => inWeek(t.createdAt)).toList();
    final completedThisWeek = tasksThisWeek.where((t) => t.status == TaskStatuses.completed).length;

    final sessionsThisWeek = sessions.where((s) => inWeek(s.startedAt) && s.focusedMinutes != null).toList();
    final focusMinutes = sessionsThisWeek.fold<int>(0, (s, x) => s + x.focusedMinutes!);

    final txThisWeek = transactions.where((t) => inWeek(t.occurredAt));
    final income = txThisWeek.where((t) => t.type == TransactionTypes.income).fold<double>(0, (s, t) => s + t.amount);
    final expense = txThisWeek.where((t) => t.type == TransactionTypes.expense).fold<double>(0, (s, t) => s + t.amount);

    final habitLogsThisWeek = habitLogs.where((l) => l.completed && inWeek(l.date)).length;
    final possibleHabitDays = habits.length * 7;
    final habitConsistency = possibleHabitDays == 0 ? 0.0 : habitLogsThisWeek / possibleHabitDays;

    final studyMinutes = studySessions.where((s) => inWeek(s.date)).fold<int>(0, (s, x) => s + x.minutes);

    final goalsWithTarget = goals.where((g) => (g.targetValue ?? 0) > 0).toList();
    final avgGoalProgress = goalsWithTarget.isEmpty
        ? 0.0
        : goalsWithTarget.map((g) => (g.currentValue / g.targetValue!).clamp(0, 1)).reduce((a, b) => a + b) / goalsWithTarget.length;

    final narrative = _buildNarrative(
      completedThisWeek: completedThisWeek,
      totalTasks: tasksThisWeek.length,
      focusMinutes: focusMinutes,
      income: income,
      expense: expense,
      habitConsistency: habitConsistency,
      studyMinutes: studyMinutes,
      avgGoalProgress: avgGoalProgress,
      fmt: fmt,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VioraSection(title: 'Reports', subtitle: '${DateFormat('d MMM').format(weekStart)} – ${DateFormat('d MMM').format(weekEnd.subtract(const Duration(days: 1)))}'),
          VioraCard(
            elevation: VioraElevation.raisedHigh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Weekly Review', style: textTheme.headlineSmall),
                const SizedBox(height: VioraSpacing.lg),
                for (final line in narrative) ...[
                  Text(line, style: textTheme.bodyMedium?.copyWith(color: neu.textSecondary, height: 1.5)),
                  const SizedBox(height: VioraSpacing.md),
                ],
              ],
            ),
          ),
          const SizedBox(height: VioraSpacing.xl2),
          const VioraSection(title: 'By the numbers'),
          LayoutBuilder(builder: (context, constraints) {
            final columns = constraints.maxWidth >= 700 ? 3 : (constraints.maxWidth >= 420 ? 2 : 1);
            final cardWidth = (constraints.maxWidth - (columns - 1) * VioraSpacing.lg) / columns;
            Widget stat(String label, String value) => SizedBox(
                  width: cardWidth,
                  child: VioraCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(label, style: textTheme.labelMedium),
                        const SizedBox(height: VioraSpacing.xs),
                        Text(value, style: textTheme.headlineSmall),
                      ],
                    ),
                  ),
                );
            return Wrap(
              spacing: VioraSpacing.lg,
              runSpacing: VioraSpacing.lg,
              children: [
                stat('Tasks completed', '$completedThisWeek / ${tasksThisWeek.length}'),
                stat('Focused time', '${focusMinutes ~/ 60}h ${focusMinutes % 60}m'),
                stat('Study time', '${studyMinutes ~/ 60}h ${studyMinutes % 60}m'),
                stat('Income', fmt.format(income)),
                stat('Spent', fmt.format(expense)),
                stat('Habit consistency', '${(habitConsistency * 100).round()}%'),
              ],
            );
          }),
        ],
      ),
    );
  }

  List<String> _buildNarrative({
    required int completedThisWeek,
    required int totalTasks,
    required int focusMinutes,
    required double income,
    required double expense,
    required double habitConsistency,
    required int studyMinutes,
    required double avgGoalProgress,
    required NumberFormat fmt,
  }) {
    final lines = <String>[];

    if (totalTasks == 0) {
      lines.add("No tasks were created this week — Reports will get more useful once there's a week of real activity behind it.");
    } else {
      final rate = (completedThisWeek / totalTasks * 100).round();
      lines.add('You completed $completedThisWeek of $totalTasks tasks this week ($rate%).');
    }

    if (focusMinutes > 0) {
      lines.add('${focusMinutes ~/ 60}h ${focusMinutes % 60}m went into focus sessions.${studyMinutes > 0 ? ' On top of that, ${studyMinutes ~/ 60}h ${studyMinutes % 60}m was logged as study time.' : ''}');
    } else if (studyMinutes > 0) {
      lines.add('${studyMinutes ~/ 60}h ${studyMinutes % 60}m was logged as study time this week.');
    }

    if (income > 0 || expense > 0) {
      final net = income - expense;
      lines.add(
        'Income was ${fmt.format(income)} against ${fmt.format(expense)} spent — a net of ${net >= 0 ? '+' : ''}${fmt.format(net)}.',
      );
    }

    if (habitConsistency > 0) {
      lines.add('Habits were kept ${(habitConsistency * 100).round()}% of the time across the week.');
    }

    if (avgGoalProgress > 0) {
      lines.add('Goals with a target are averaging ${(avgGoalProgress * 100).round()}% progress.');
    }

    if (lines.isEmpty) {
      lines.add("Nothing logged yet this week — once you're using Tasks, Focus, Money, and Habits, this review writes itself.");
    }

    return lines;
  }
}
