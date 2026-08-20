import 'package:flutter/material.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_card.dart';
import '../../../../core/design_system/widgets/viora_section.dart';
import '../../../../core/design_system/widgets/viora_progress_bar.dart';
import '../../../../core/design_system/widgets/viora_empty_state.dart';
import '../../domain/home_dashboard_data.dart';

class GoalsRow extends StatelessWidget {
  const GoalsRow({super.key, required this.goals, required this.onAddGoal});

  final List<GoalProgress> goals;
  final VoidCallback onAddGoal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VioraSection(title: 'Goals', subtitle: 'Top active goals'),
        if (goals.isEmpty)
          VioraEmptyState(
            icon: Icons.flag_outlined,
            title: 'No goals yet',
            message: 'Set a target and start logging progress toward it.',
            actionLabel: 'Add goal',
            onAction: onAddGoal,
          )
        else
          LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth >= 680;
              if (!wide) {
                return Column(
                  children: [
                    for (final g in goals) ...[
                      _GoalCard(goal: g),
                      const SizedBox(height: VioraSpacing.md),
                    ],
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final g in goals) ...[
                    Expanded(child: _GoalCard(goal: g)),
                    if (g != goals.last) const SizedBox(width: VioraSpacing.lg),
                  ],
                ],
              );
            },
          ),
      ],
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({required this.goal});

  final GoalProgress goal;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;
    final pct = (goal.progress * 100).round();

    return VioraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(goal.title, style: textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: VioraSpacing.xs),
          Text(goal.detail, style: textTheme.bodySmall?.copyWith(color: neu.textSecondary)),
          const SizedBox(height: VioraSpacing.md),
          VioraProgressBar(progress: goal.progress),
          const SizedBox(height: VioraSpacing.xs),
          Align(
            alignment: Alignment.centerRight,
            child: Text('$pct%', style: textTheme.labelMedium),
          ),
        ],
      ),
    );
  }
}
