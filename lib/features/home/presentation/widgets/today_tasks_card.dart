import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/daos/tasks_dao.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_card.dart';
import '../../../../core/design_system/widgets/viora_completion_check.dart';
import '../../../../core/design_system/widgets/viora_empty_state.dart';
import '../../../../core/design_system/widgets/viora_section.dart';
import '../../../tasks/presentation/providers/tasks_providers.dart';

/// A live preview of what's still open today — not a duplicate of the
/// Tasks screen, just enough to act on the top few items without leaving
/// Home. Tapping a checkbox completes the task right here.
class TodayTasksCard extends ConsumerWidget {
  const TodayTasksCard({super.key, required this.onSeeAll});

  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final neu = context.neu;
    final active = ref.watch(_activeTasksProvider).valueOrNull ?? const [];
    final actions = ref.read(tasksActionsProvider);

    return VioraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VioraSection(
            title: 'Today\'s Tasks',
            subtitle: active.isEmpty ? 'Nothing open' : '${active.length} active',
            trailing: TextButton(onPressed: onSeeAll, child: const Text('See all')),
          ),
          if (active.isEmpty)
            const VioraEmptyState(
              icon: Icons.check_circle_outline_rounded,
              title: 'All clear',
              message: 'No open tasks right now.',
            )
          else
            for (final task in active.take(4))
              Padding(
                padding: const EdgeInsets.only(bottom: VioraSpacing.md),
                child: Row(
                  children: [
                    VioraCompletionCheck(
                      completed: false,
                      onTap: () => actions.setStatus(task.id, TaskStatuses.completed),
                      size: 22,
                    ),
                    const SizedBox(width: VioraSpacing.md),
                    Expanded(
                      child: Text(
                        task.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (task.priority == TaskPriorities.urgent || task.priority == TaskPriorities.high)
                      Container(
                        width: 7,
                        height: 7,
                        margin: const EdgeInsets.only(left: VioraSpacing.sm),
                        decoration: BoxDecoration(
                          color: task.priority == TaskPriorities.urgent ? neu.danger : neu.warning,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}

final _activeTasksProvider = FutureProvider.autoDispose((ref) async {
  return ref.watch(allTasksStreamProvider.future).then(
        (tasks) => tasks.where((t) => TaskStatuses.active.contains(t.status)).toList()
          ..sort((a, b) {
            final ad = a.deadline;
            final bd = b.deadline;
            if (ad == null && bd == null) return b.createdAt.compareTo(a.createdAt);
            if (ad == null) return 1;
            if (bd == null) return -1;
            return ad.compareTo(bd);
          }),
      );
});
