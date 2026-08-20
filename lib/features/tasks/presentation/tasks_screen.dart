import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_button.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_chip.dart';
import '../../../core/design_system/widgets/viora_empty_state.dart';
import '../../../core/design_system/widgets/viora_form_sheet.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/design_system/widgets/viora_stat.dart';
import '../../../core/database/daos/tasks_dao.dart';
import 'providers/tasks_providers.dart';
import 'widgets/task_form.dart';
import 'widgets/task_tile.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class TasksScreen extends ConsumerWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(tasksStreamProvider);
    final allTasks = ref.watch(allTasksStreamProvider).valueOrNull ?? const [];
    final filter = ref.watch(taskFilterProvider);
    final actions = ref.read(tasksActionsProvider);
    final activeCount = allTasks.where((t) => t.status != TaskStatuses.completed).length;
    final completedCount = allTasks.length - activeCount;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VioraSection(
            title: 'Tasks',
            subtitle: 'Everything on your plate',
            trailing: VioraButton(
              label: 'Add',
              icon: IconsaxPlusBold.add,
              onPressed: () => showVioraFormSheet(context: context, title: 'New task', icon: IconsaxPlusBroken.tick_circle, accentColor: context.neu.domainWork, builder: (_) => const TaskForm()),
            ),
          ),
          if (allTasks.isNotEmpty) ...[
            VioraCard(
              orbColors: [context.neu.domainWork, context.neu.brand],
              child: Row(
                children: [
                  Expanded(
                    child: VioraStat(
                      label: 'Active',
                      value: activeCount.toDouble(),
                      formatter: (v) => v.toInt().toString(),
                      icon: IconsaxPlusBroken.record_circle,
                      metricSize: 24,
                    ),
                  ),
                  Expanded(
                    child: VioraStat(
                      label: 'Completed',
                      value: completedCount.toDouble(),
                      formatter: (v) => v.toInt().toString(),
                      icon: IconsaxPlusBroken.tick_circle,
                      iconColor: context.neu.success,
                      metricSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: VioraSpacing.lg),
          ],
          Wrap(
            spacing: VioraSpacing.sm,
            children: [
              VioraChip(
                label: 'Active',
                selected: filter == TaskFilter.active,
                onTap: () => ref.read(taskFilterProvider.notifier).state = TaskFilter.active,
              ),
              VioraChip(
                label: 'Completed',
                selected: filter == TaskFilter.completed,
                onTap: () => ref.read(taskFilterProvider.notifier).state = TaskFilter.completed,
              ),
              VioraChip(
                label: 'All',
                selected: filter == TaskFilter.all,
                onTap: () => ref.read(taskFilterProvider.notifier).state = TaskFilter.all,
              ),
            ],
          ),
          const SizedBox(height: VioraSpacing.xl),
          tasksAsync.when(
            data: (tasks) {
              if (tasks.isEmpty) {
                return VioraEmptyState(
                  icon: IconsaxPlusBroken.tick_circle,
                  title: 'Nothing here yet',
                  message: 'Add your first task to start planning your day.',
                  actionLabel: 'Add task',
                  onAction: () => showVioraFormSheet(context: context, title: 'New task', icon: IconsaxPlusBroken.tick_circle, accentColor: context.neu.domainWork, builder: (_) => const TaskForm()),
                );
              }
              return Column(
                children: [
                  for (final task in tasks)
                    TaskTile(
                      task: task,
                      onToggle: () => actions.setStatus(
                        task.id,
                        task.status == TaskStatuses.completed ? TaskStatuses.planned : TaskStatuses.completed,
                      ),
                      onDelete: () => actions.delete(task.id),
                    ),
                ],
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl4),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, st) => Text('Failed to load tasks: $e'),
          ),
        ],
      ),
    );
  }
}
