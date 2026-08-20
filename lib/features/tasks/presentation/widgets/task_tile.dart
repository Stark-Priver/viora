import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/tasks_dao.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_card.dart';
import '../../../../core/design_system/widgets/viora_chip.dart';
import '../../../../core/design_system/widgets/viora_completion_check.dart';

Color _priorityColor(VioraNeuTheme neu, String priority) {
  switch (priority) {
    case TaskPriorities.urgent:
      return neu.danger;
    case TaskPriorities.high:
      return neu.warning;
    case TaskPriorities.low:
      return neu.textTertiary;
    default:
      return neu.info;
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task, required this.onToggle, required this.onDelete});

  final TaskRow task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;
    final done = task.status == TaskStatuses.completed;

    return Dismissible(
      key: ValueKey(task.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.xl),
        margin: const EdgeInsets.only(bottom: VioraSpacing.md),
        decoration: BoxDecoration(color: neu.danger.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(22)),
        child: Icon(Icons.delete_outline_rounded, color: neu.danger),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: VioraSpacing.md),
        child: VioraCard(
          padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.lg, vertical: VioraSpacing.md),
          child: Row(
            children: [
              VioraCompletionCheck(completed: done, onTap: onToggle),
              const SizedBox(width: VioraSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      task.title,
                      style: textTheme.bodyLarge?.copyWith(
                        color: done ? neu.textTertiary : neu.textPrimary,
                        decoration: done ? TextDecoration.lineThrough : null,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: VioraSpacing.xs),
                    Wrap(
                      spacing: VioraSpacing.sm,
                      runSpacing: VioraSpacing.xs,
                      children: [
                        VioraChip(label: task.priority, color: _priorityColor(neu, task.priority)),
                        if (task.domain != null) VioraChip(label: task.domain!),
                        if (task.deadline != null)
                          VioraChip(
                            label: DateFormat('d MMM').format(task.deadline!),
                            icon: Icons.event_outlined,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
