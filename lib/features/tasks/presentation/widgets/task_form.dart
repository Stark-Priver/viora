import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/daos/tasks_dao.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_button.dart';
import '../../../../core/design_system/widgets/viora_chip.dart';
import '../../../../core/design_system/widgets/viora_input.dart';
import '../providers/tasks_providers.dart';

class TaskForm extends ConsumerStatefulWidget {
  const TaskForm({super.key});

  @override
  ConsumerState<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends ConsumerState<TaskForm> {
  final _titleController = TextEditingController();
  String _priority = TaskPriorities.normal;
  String? _domain;
  DateTime? _deadline;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VioraInput(controller: _titleController, label: 'Title', hint: 'What needs doing?', autofocus: true),
        const SizedBox(height: VioraSpacing.lg),
        Text('Priority', style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: VioraSpacing.sm),
        Wrap(
          spacing: VioraSpacing.sm,
          children: [
            for (final p in TaskPriorities.all)
              VioraChip(label: p, selected: _priority == p, onTap: () => setState(() => _priority = p)),
          ],
        ),
        const SizedBox(height: VioraSpacing.lg),
        Text('Deadline', style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: VioraSpacing.sm),
        Wrap(
          spacing: VioraSpacing.sm,
          children: [
            VioraChip(
              label: _deadline == null ? 'Pick a date' : '${_deadline!.year}-${_deadline!.month.toString().padLeft(2, '0')}-${_deadline!.day.toString().padLeft(2, '0')}',
              icon: Icons.event_outlined,
              selected: _deadline != null,
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
                );
                if (picked != null) setState(() => _deadline = picked);
              },
            ),
            if (_deadline != null)
              VioraChip(label: 'Clear', icon: Icons.close_rounded, onTap: () => setState(() => _deadline = null)),
          ],
        ),
        const SizedBox(height: VioraSpacing.xl2),
        VioraButton(
          label: 'Add task',
          icon: Icons.add_rounded,
          expand: true,
          onPressed: () {
            final title = _titleController.text.trim();
            if (title.isEmpty) return;
            ref.read(tasksActionsProvider).add(
                  TaskDraft(title: title, priority: _priority, domain: _domain, deadline: _deadline),
                );
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
