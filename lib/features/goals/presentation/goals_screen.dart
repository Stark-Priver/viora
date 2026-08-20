import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_button.dart';
import '../../../core/design_system/widgets/viora_empty_state.dart';
import '../../../core/design_system/widgets/viora_form_sheet.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import 'providers/goals_providers.dart';
import 'widgets/goal_card.dart';
import 'widgets/goal_form.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';

class GoalsScreen extends ConsumerWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsAsync = ref.watch(goalsStreamProvider);
    final actions = ref.read(goalsActionsProvider);

    void openAddForm() => showVioraFormSheet(context: context, title: 'New goal', icon: Icons.flag_outlined, accentColor: context.neu.brand, builder: (_) => const GoalForm());

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VioraSection(
            title: 'Goals',
            subtitle: 'Vision, tracked in numbers',
            trailing: VioraButton(label: 'Add', icon: Icons.add_rounded, onPressed: openAddForm),
          ),
          const SizedBox(height: VioraSpacing.sm),
          goalsAsync.when(
            data: (goals) {
              if (goals.isEmpty) {
                return VioraEmptyState(
                  icon: Icons.flag_outlined,
                  title: 'No goals yet',
                  message: 'Set a target and start logging progress toward it.',
                  actionLabel: 'Add goal',
                  onAction: openAddForm,
                );
              }
              return LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth >= 900 ? 2 : 1;
                  return Wrap(
                    spacing: VioraSpacing.lg,
                    runSpacing: VioraSpacing.lg,
                    children: [
                      for (final goal in goals)
                        SizedBox(
                          width: columns == 2 ? (constraints.maxWidth - VioraSpacing.lg) / 2 : constraints.maxWidth,
                          child: GoalCard(
                            goal: goal,
                            onLogProgress: () => showVioraFormSheet(
                              context: context,
                              title: 'Log progress · ${goal.title}',
                              icon: Icons.trending_up_rounded,
                              accentColor: context.neu.brand,
                              builder: (_) => LogProgressForm(goalId: goal.id),
                            ),
                            onDelete: () => actions.delete(goal.id),
                          ),
                        ),
                    ],
                  );
                },
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl4),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, st) => Text('Failed to load goals: $e'),
          ),
        ],
      ),
    );
  }
}
