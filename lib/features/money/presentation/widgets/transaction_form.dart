import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/daos/money_dao.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_button.dart';
import '../../../../core/design_system/widgets/viora_chip.dart';
import '../../../../core/design_system/widgets/viora_input.dart';
import '../providers/money_providers.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class TransactionForm extends ConsumerStatefulWidget {
  const TransactionForm({super.key});

  @override
  ConsumerState<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends ConsumerState<TransactionForm> {
  final _amount = TextEditingController();
  final _category = TextEditingController();
  String _type = TransactionTypes.expense;

  @override
  void dispose() {
    _amount.dispose();
    _category.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accounts = ref.watch(accountsStreamProvider).valueOrNull ?? const [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          spacing: VioraSpacing.sm,
          children: [
            VioraChip(label: 'Expense', selected: _type == TransactionTypes.expense, onTap: () => setState(() => _type = TransactionTypes.expense)),
            VioraChip(label: 'Income', selected: _type == TransactionTypes.income, onTap: () => setState(() => _type = TransactionTypes.income)),
          ],
        ),
        const SizedBox(height: VioraSpacing.lg),
        VioraInput(controller: _amount, label: 'Amount', hint: '13500', keyboardType: TextInputType.number, autofocus: true),
        const SizedBox(height: VioraSpacing.lg),
        VioraInput(controller: _category, label: 'Category', hint: 'e.g. Transport, Food'),
        const SizedBox(height: VioraSpacing.xl2),
        VioraButton(
          label: _type == TransactionTypes.expense ? 'Add expense' : 'Add income',
          icon: IconsaxPlusBold.add,
          expand: true,
          onPressed: accounts.isEmpty
              ? null
              : () {
                  final amount = double.tryParse(_amount.text.trim());
                  if (amount == null || amount <= 0) return;
                  ref.read(moneyActionsProvider).addTransaction(
                        TransactionDraft(
                          accountId: accounts.first.id,
                          type: _type,
                          amount: amount,
                          category: _category.text.trim().isEmpty ? null : _category.text.trim(),
                        ),
                      );
                  Navigator.of(context).pop();
                },
        ),
      ],
    );
  }
}
