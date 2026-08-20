import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_button.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_empty_state.dart';
import '../../../core/design_system/widgets/viora_form_sheet.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/design_system/widgets/viora_stat.dart';
import 'providers/habits_providers.dart';
import 'widgets/habit_card.dart';
import 'widgets/habit_form.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';

class HabitsScreen extends ConsumerWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitsAsync = ref.watch(habitsStreamProvider);
    final logsAsync = ref.watch(habitLogsStreamProvider);
    final actions = ref.read(habitsActionsProvider);

    void openAddForm() => showVioraFormSheet(context: context, title: 'New habit', icon: Icons.repeat_rounded, accentColor: context.neu.domainHealth, builder: (_) => const HabitForm());

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VioraSection(
            title: 'Habits',
            subtitle: 'Consistency over streaks',
            trailing: VioraButton(label: 'Add', icon: Icons.add_rounded, onPressed: openAddForm),
          ),
          const SizedBox(height: VioraSpacing.sm),
          habitsAsync.when(
            data: (habits) {
              if (habits.isEmpty) {
                return VioraEmptyState(
                  icon: Icons.repeat_rounded,
                  title: 'No habits yet',
                  message: 'Track something you want to do consistently — exercise, reading, water.',
                  actionLabel: 'Add habit',
                  onAction: openAddForm,
                );
              }
              final logs = logsAsync.valueOrNull ?? const [];
              final today = DateTime.now();
              final doneToday = habits.where((h) => logs.any((l) => l.habitId == h.id && l.completed && _sameDay(l.date, today))).length;

              return Column(
                children: [
                  VioraCard(
                    orbColors: [context.neu.domainHealth, context.neu.brand],
                    child: VioraStat(
                      label: 'Done today',
                      value: doneToday.toDouble(),
                      formatter: (v) => '${v.toInt()} / ${habits.length}',
                      icon: Icons.check_circle_outline_rounded,
                      metricSize: 26,
                    ),
                  ),
                  const SizedBox(height: VioraSpacing.xl2),
                  for (final habit in habits)
                    Padding(
                      padding: const EdgeInsets.only(bottom: VioraSpacing.md),
                      child: HabitCard(
                        habit: habit,
                        logsByDay: List.generate(7, (i) {
                          final day = DateTime(today.year, today.month, today.day).subtract(Duration(days: 6 - i));
                          return logs.any((l) => l.habitId == habit.id && l.completed && _sameDay(l.date, day));
                        }),
                        onToggleToday: () => actions.toggleToday(habit.id),
                        onArchive: () => actions.archive(habit.id),
                      ),
                    ),
                ],
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl4),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, st) => Text('Failed to load habits: $e'),
          ),
        ],
      ),
    );
  }
}

bool _sameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;
