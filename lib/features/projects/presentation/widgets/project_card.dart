import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/projects_dao.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_card.dart';
import '../../../../core/design_system/widgets/viora_chip.dart';
import '../../../../core/design_system/widgets/viora_icon_button.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

Color _statusColor(VioraNeuTheme neu, String status) {
  switch (status) {
    case ProjectStatuses.completed:
      return neu.success;
    case ProjectStatuses.onHold:
      return neu.warning;
    case ProjectStatuses.cancelled:
      return neu.danger;
    default:
      return neu.info;
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, required this.onCycleStatus, required this.onDelete});

  final ProjectRow project;
  final VoidCallback onCycleStatus;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;
    final fmt = NumberFormat.decimalPattern();

    return VioraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(project.name, style: textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis)),
              VioraIconButton(icon: IconsaxPlusBroken.trash, size: 34, tooltip: 'Delete', onPressed: onDelete),
            ],
          ),
          if (project.description != null) ...[
            const SizedBox(height: VioraSpacing.xs),
            Text(project.description!, style: textTheme.bodySmall?.copyWith(color: neu.textSecondary), maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
          const SizedBox(height: VioraSpacing.md),
          Row(
            children: [
              VioraChip(label: project.status.replaceAll('_', ' '), color: _statusColor(neu, project.status), onTap: onCycleStatus),
              if (project.budget != null) ...[
                const SizedBox(width: VioraSpacing.sm),
                VioraChip(label: '${fmt.format(project.budget)} budget', icon: IconsaxPlusBroken.wallet),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
