import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/daos/habits_dao.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_button.dart';
import '../../../../core/design_system/widgets/viora_chip.dart';
import '../../../../core/design_system/widgets/viora_input.dart';
import '../providers/habits_providers.dart';

class HabitForm extends ConsumerStatefulWidget {
  const HabitForm({super.key});

  @override
  ConsumerState<HabitForm> createState() => _HabitFormState();
}

class _HabitFormState extends ConsumerState<HabitForm> {
  final _title = TextEditingController();
  String _type = HabitTypes.binary;

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VioraInput(controller: _title, label: 'Habit', hint: 'e.g. Exercise', autofocus: true),
        const SizedBox(height: VioraSpacing.lg),
        Text('Type', style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: VioraSpacing.sm),
        Wrap(
          spacing: VioraSpacing.sm,
          children: [
            VioraChip(label: 'Binary', selected: _type == HabitTypes.binary, onTap: () => setState(() => _type = HabitTypes.binary)),
            VioraChip(label: 'Quantitative', selected: _type == HabitTypes.quantitative, onTap: () => setState(() => _type = HabitTypes.quantitative)),
          ],
        ),
        const SizedBox(height: VioraSpacing.xl2),
        VioraButton(
          label: 'Add habit',
          icon: Icons.repeat_rounded,
          expand: true,
          onPressed: () {
            final title = _title.text.trim();
            if (title.isEmpty) return;
            ref.read(habitsActionsProvider).add(title: title, type: _type);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
