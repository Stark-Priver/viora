import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_button.dart';
import '../../../../core/design_system/widgets/viora_input.dart';
import '../providers/goals_providers.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class GoalForm extends ConsumerStatefulWidget {
  const GoalForm({super.key});

  @override
  ConsumerState<GoalForm> createState() => _GoalFormState();
}

class _GoalFormState extends ConsumerState<GoalForm> {
  final _title = TextEditingController();
  final _target = TextEditingController();
  final _unit = TextEditingController(text: 'TZS');

  @override
  void dispose() {
    _title.dispose();
    _target.dispose();
    _unit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VioraInput(controller: _title, label: 'Goal', hint: 'e.g. Emergency Fund', autofocus: true),
        const SizedBox(height: VioraSpacing.lg),
        Row(
          children: [
            Expanded(child: VioraInput(controller: _target, label: 'Target', hint: '2000000', keyboardType: TextInputType.number)),
            const SizedBox(width: VioraSpacing.md),
            SizedBox(width: 100, child: VioraInput(controller: _unit, label: 'Unit', hint: 'TZS')),
          ],
        ),
        const SizedBox(height: VioraSpacing.xl2),
        VioraButton(
          label: 'Add goal',
          icon: IconsaxPlusBroken.flag,
          expand: true,
          onPressed: () {
            final title = _title.text.trim();
            if (title.isEmpty) return;
            ref.read(goalsActionsProvider).add(
                  GoalDraft(title: title, targetValue: double.tryParse(_target.text.trim()), unit: _unit.text.trim().isEmpty ? null : _unit.text.trim()),
                );
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class LogProgressForm extends ConsumerStatefulWidget {
  const LogProgressForm({super.key, required this.goalId});
  final String goalId;

  @override
  ConsumerState<LogProgressForm> createState() => _LogProgressFormState();
}

class _LogProgressFormState extends ConsumerState<LogProgressForm> {
  final _amount = TextEditingController();

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VioraInput(controller: _amount, label: 'Amount to add', hint: '50000', keyboardType: TextInputType.number, autofocus: true),
        const SizedBox(height: VioraSpacing.xl2),
        VioraButton(
          label: 'Log progress',
          icon: IconsaxPlusBold.add,
          expand: true,
          onPressed: () {
            final amount = double.tryParse(_amount.text.trim());
            if (amount == null) return;
            ref.read(goalsActionsProvider).logProgress(widget.goalId, amount);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
