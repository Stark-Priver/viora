import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_button.dart';
import '../../../../core/design_system/widgets/viora_input.dart';
import '../providers/projects_providers.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ProjectForm extends ConsumerStatefulWidget {
  const ProjectForm({super.key});

  @override
  ConsumerState<ProjectForm> createState() => _ProjectFormState();
}

class _ProjectFormState extends ConsumerState<ProjectForm> {
  final _name = TextEditingController();
  final _description = TextEditingController();
  final _budget = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    _budget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VioraInput(controller: _name, label: 'Project name', hint: 'e.g. ROHI Development', autofocus: true),
        const SizedBox(height: VioraSpacing.lg),
        VioraInput(controller: _description, label: 'Description', hint: 'Optional', maxLines: 3),
        const SizedBox(height: VioraSpacing.lg),
        VioraInput(controller: _budget, label: 'Budget', hint: 'Optional', keyboardType: TextInputType.number),
        const SizedBox(height: VioraSpacing.xl2),
        VioraButton(
          label: 'Add project',
          icon: IconsaxPlusBroken.folder_open,
          expand: true,
          onPressed: () {
            final name = _name.text.trim();
            if (name.isEmpty) return;
            ref.read(projectsActionsProvider).add(
                  ProjectDraft(
                    name: name,
                    description: _description.text.trim().isEmpty ? null : _description.text.trim(),
                    budget: double.tryParse(_budget.text.trim()),
                  ),
                );
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
