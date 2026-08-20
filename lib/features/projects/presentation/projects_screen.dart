import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/database/daos/projects_dao.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_button.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_empty_state.dart';
import '../../../core/design_system/widgets/viora_form_sheet.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/design_system/widgets/viora_stat.dart';
import 'providers/projects_providers.dart';
import 'widgets/project_card.dart';
import 'widgets/project_form.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';

const _statusCycle = [
  ProjectStatuses.active,
  ProjectStatuses.onHold,
  ProjectStatuses.completed,
  ProjectStatuses.cancelled,
];

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(projectsStreamProvider);
    final actions = ref.read(projectsActionsProvider);

    void openAddForm() => showVioraFormSheet(context: context, title: 'New project', icon: Icons.folder_open_rounded, accentColor: context.neu.domainBusiness, builder: (_) => const ProjectForm());

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VioraSection(
            title: 'Projects',
            subtitle: 'Personal, freelance, and business work',
            trailing: VioraButton(label: 'Add', icon: Icons.add_rounded, onPressed: openAddForm),
          ),
          const SizedBox(height: VioraSpacing.sm),
          projectsAsync.when(
            data: (rows) {
              if (rows.isEmpty) {
                return VioraEmptyState(
                  icon: Icons.folder_open_rounded,
                  title: 'No projects yet',
                  message: 'Group related tasks and track budget/spend under a project.',
                  actionLabel: 'Add project',
                  onAction: openAddForm,
                );
              }
              final activeCount = rows.where((p) => p.status == ProjectStatuses.active).length;
              final completedCount = rows.where((p) => p.status == ProjectStatuses.completed).length;

              return LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth >= 900 ? 2 : 1;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VioraCard(
                        orbColors: [context.neu.domainBusiness, context.neu.brand],
                        child: Row(
                          children: [
                            Expanded(
                              child: VioraStat(
                                label: 'Total',
                                value: rows.length.toDouble(),
                                formatter: (v) => v.toInt().toString(),
                                icon: Icons.folder_open_rounded,
                                metricSize: 24,
                              ),
                            ),
                            Expanded(
                              child: VioraStat(
                                label: 'Active',
                                value: activeCount.toDouble(),
                                formatter: (v) => v.toInt().toString(),
                                icon: Icons.bolt_rounded,
                                iconColor: context.neu.info,
                                metricSize: 24,
                              ),
                            ),
                            Expanded(
                              child: VioraStat(
                                label: 'Completed',
                                value: completedCount.toDouble(),
                                formatter: (v) => v.toInt().toString(),
                                icon: Icons.check_circle_outline_rounded,
                                iconColor: context.neu.success,
                                metricSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: VioraSpacing.xl2),
                      Wrap(
                        spacing: VioraSpacing.lg,
                        runSpacing: VioraSpacing.lg,
                        children: [
                          for (final project in rows)
                            SizedBox(
                              width: columns == 2 ? (constraints.maxWidth - VioraSpacing.lg) / 2 : constraints.maxWidth,
                              child: ProjectCard(
                                project: project,
                                onCycleStatus: () {
                                  final next = _statusCycle[(_statusCycle.indexOf(project.status) + 1) % _statusCycle.length];
                                  actions.setStatus(project.id, next);
                                },
                                onDelete: () => actions.delete(project.id),
                              ),
                            ),
                        ],
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
            error: (e, st) => Text('Failed to load projects: $e'),
          ),
        ],
      ),
    );
  }
}
