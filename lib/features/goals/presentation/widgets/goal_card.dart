import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_card.dart';
import '../../../../core/design_system/widgets/viora_icon_button.dart';
import '../../../../core/design_system/widgets/viora_progress_bar.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({super.key, required this.goal, required this.onLogProgress, required this.onDelete});

  final GoalRow goal;
  final VoidCallback onLogProgress;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;
    final fmt = NumberFormat.decimalPattern();
    final hasTarget = goal.targetValue != null && goal.targetValue! > 0;
    final progress = hasTarget ? (goal.currentValue / goal.targetValue!).clamp(0, 1).toDouble() : 0.0;

    return VioraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(goal.title, style: textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
              VioraIconButton(icon: Icons.add_rounded, size: 34, tooltip: 'Log progress', onPressed: onLogProgress),
              const SizedBox(width: VioraSpacing.xs),
              VioraIconButton(icon: Icons.delete_outline_rounded, size: 34, tooltip: 'Delete', onPressed: onDelete),
            ],
          ),
          const SizedBox(height: VioraSpacing.xs),
          Text(
            hasTarget
                ? '${fmt.format(goal.currentValue)} / ${fmt.format(goal.targetValue)} ${goal.unit ?? ''}'
                : '${fmt.format(goal.currentValue)} ${goal.unit ?? ''} logged',
            style: textTheme.bodySmall?.copyWith(color: neu.textSecondary),
          ),
          if (hasTarget) ...[
            const SizedBox(height: VioraSpacing.md),
            VioraProgressBar(progress: progress),
            const SizedBox(height: VioraSpacing.xs),
            Align(
              alignment: Alignment.centerRight,
              child: Text('${(progress * 100).round()}%', style: textTheme.labelMedium),
            ),
          ],
        ],
      ),
    );
  }
}
