import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/tokens/breakpoints.dart';
import '../../../core/design_system/widgets/viora_form_sheet.dart';
import '../../focus/presentation/providers/focus_providers.dart';
import '../../tasks/presentation/widgets/task_form.dart';
import '../../money/presentation/widgets/transaction_form.dart';
import 'providers/home_providers.dart';
import 'widgets/home_header.dart';
import 'widgets/alerts_banner.dart';
import 'widgets/quick_actions_row.dart';
import 'widgets/today_progress_card.dart';
import 'widgets/current_focus_card.dart';
import 'widgets/money_card.dart';
import 'widgets/life_snapshot_card.dart';
import 'widgets/today_tasks_card.dart';
import 'widgets/habits_mini_row.dart';
import 'widgets/goals_row.dart';

class HomeDashboardScreen extends ConsumerWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(homeDashboardProvider);
    final session = ref.watch(focusSessionProvider);
    final focusNotifier = ref.read(focusSessionProvider.notifier);

    void openAddTask() => showVioraFormSheet(context: context, title: 'New task', icon: Icons.check_circle_outline_rounded, accentColor: context.neu.domainWork, builder: (_) => const TaskForm());
    void openAddExpense() => showVioraFormSheet(context: context, title: 'New transaction', icon: Icons.receipt_long_outlined, accentColor: context.neu.domainFinance, builder: (_) => const TransactionForm());

    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= VioraBreakpoints.mobile;
        const gap = VioraSpacing.xl2;

        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            VioraSpacing.lg,
            VioraSpacing.lg,
            VioraSpacing.lg,
            VioraSpacing.xl6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              const SizedBox(height: gap),
              QuickActionsRow(
                onTaskTap: openAddTask,
                onExpenseTap: openAddExpense,
                onFocusTap: () => context.go('/focus'),
                onJournalTap: () => context.go('/journal'),
                onHabitTap: () => context.go('/habits'),
              ),
              const SizedBox(height: gap),
              AlertsBanner(alerts: data.alerts),
              if (data.alerts.isNotEmpty) const SizedBox(height: gap),
              if (wide)
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(flex: 6, child: TodayProgressCard(data: data)),
                      const SizedBox(width: VioraSpacing.lg),
                      Expanded(
                        flex: 5,
                        child: CurrentFocusCard(
                          session: session,
                          nextEvent: data.nextEvent,
                          onTogglePause: focusNotifier.togglePause,
                          onStop: focusNotifier.stop,
                          onStartFocus: () => context.go('/focus'),
                        ),
                      ),
                    ],
                  ),
                )
              else ...[
                TodayProgressCard(data: data),
                const SizedBox(height: VioraSpacing.lg),
                CurrentFocusCard(
                  session: session,
                  nextEvent: data.nextEvent,
                  onTogglePause: focusNotifier.togglePause,
                  onStop: focusNotifier.stop,
                  onStartFocus: () => context.go('/focus'),
                ),
              ],
              const SizedBox(height: gap),
              if (wide)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 4, child: MoneyCard(money: data.money)),
                    const SizedBox(width: VioraSpacing.lg),
                    Expanded(
                      flex: 7,
                      child: LifeSnapshotCard(
                        segments: data.lifeSnapshot,
                        sleepMinutes: data.sleepMinutes,
                        focusScore: data.focusScore,
                        planAdherence: data.planAdherence,
                      ),
                    ),
                  ],
                )
              else ...[
                MoneyCard(money: data.money),
                const SizedBox(height: VioraSpacing.lg),
                LifeSnapshotCard(
                  segments: data.lifeSnapshot,
                  sleepMinutes: data.sleepMinutes,
                  focusScore: data.focusScore,
                  planAdherence: data.planAdherence,
                ),
              ],
              const SizedBox(height: gap),
              if (wide)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: TodayTasksCard(onSeeAll: () => context.go('/tasks'))),
                    const SizedBox(width: VioraSpacing.lg),
                    Expanded(child: HabitsMiniRow(onSeeAll: () => context.go('/habits'))),
                  ],
                )
              else ...[
                TodayTasksCard(onSeeAll: () => context.go('/tasks')),
                const SizedBox(height: VioraSpacing.lg),
                HabitsMiniRow(onSeeAll: () => context.go('/habits')),
              ],
              const SizedBox(height: gap),
              GoalsRow(goals: data.goals, onAddGoal: () => context.go('/goals')),
            ],
          ),
        );
      },
    );
  }
}
