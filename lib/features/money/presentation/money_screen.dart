import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/database/daos/money_dao.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_button.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_empty_state.dart';
import '../../../core/design_system/widgets/viora_form_sheet.dart';
import '../../../core/design_system/widgets/viora_icon_button.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/design_system/widgets/viora_stat.dart';
import '../../../core/design_system/widgets/viora_surface.dart';
import 'providers/money_providers.dart';
import 'widgets/transaction_form.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class MoneyScreen extends ConsumerWidget {
  const MoneyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(ensureDefaultAccountProvider);
    final txAsync = ref.watch(transactionsStreamProvider);
    final actions = ref.read(moneyActionsProvider);
    final fmt = NumberFormat.decimalPattern();

    void openAddForm() => showVioraFormSheet(context: context, title: 'New transaction', icon: IconsaxPlusBroken.receipt_item, accentColor: context.neu.domainFinance, builder: (_) => const TransactionForm());

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VioraSection(
            title: 'Money',
            subtitle: 'Income, expenses, and balance',
            trailing: VioraButton(label: 'Add', icon: IconsaxPlusBold.add, onPressed: openAddForm),
          ),
          txAsync.when(
            data: (transactions) {
              final now = DateTime.now();
              final thisMonth = transactions.where((t) => t.occurredAt.year == now.year && t.occurredAt.month == now.month);
              final income = thisMonth.where((t) => t.type == TransactionTypes.income).fold<double>(0, (s, t) => s + t.amount);
              final expense = thisMonth.where((t) => t.type == TransactionTypes.expense).fold<double>(0, (s, t) => s + t.amount);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VioraCard(
                    elevation: VioraElevation.raisedHigh,
                    orbColors: [context.neu.domainFinance, context.neu.brand],
                    child: Row(
                      children: [
                        Expanded(child: VioraStat(label: 'Income (month)', value: income, formatter: fmt.format, icon: IconsaxPlusBroken.trend_down, iconColor: context.neu.success)),
                        Expanded(child: VioraStat(label: 'Spent (month)', value: expense, formatter: fmt.format, icon: IconsaxPlusBroken.trend_up, iconColor: context.neu.danger)),
                        Expanded(child: VioraStat(label: 'Net (month)', value: income - expense, formatter: fmt.format, icon: IconsaxPlusBroken.wallet)),
                      ],
                    ),
                  ),
                  const SizedBox(height: VioraSpacing.xl2),
                  const VioraSection(title: 'Recent transactions'),
                  if (transactions.isEmpty)
                    VioraEmptyState(
                      icon: IconsaxPlusBroken.receipt_item,
                      title: 'No transactions yet',
                      message: 'Log your first expense or income to start tracking.',
                      actionLabel: 'Add transaction',
                      onAction: openAddForm,
                    )
                  else
                    for (final tx in transactions)
                      Padding(
                        padding: const EdgeInsets.only(bottom: VioraSpacing.md),
                        child: VioraCard(
                          padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.lg, vertical: VioraSpacing.lg),
                          child: Row(
                            children: [
                              Icon(
                                tx.type == TransactionTypes.income ? IconsaxPlusBroken.trend_down : IconsaxPlusBroken.trend_up,
                                color: tx.type == TransactionTypes.income ? context.neu.success : context.neu.danger,
                                size: 18,
                              ),
                              const SizedBox(width: VioraSpacing.md),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(tx.category ?? tx.type, style: Theme.of(context).textTheme.bodyLarge),
                                    Text(DateFormat('d MMM, HH:mm').format(tx.occurredAt), style: Theme.of(context).textTheme.bodySmall),
                                  ],
                                ),
                              ),
                              Text(
                                fmt.format(tx.amount),
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: tx.type == TransactionTypes.income ? context.neu.success : context.neu.textPrimary,
                                    ),
                              ),
                              VioraIconButton(icon: IconsaxPlusBroken.trash, size: 32, tooltip: 'Delete', onPressed: () => actions.deleteTransaction(tx.id)),
                            ],
                          ),
                        ),
                      ),
                ],
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl4),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, st) => Text('Failed to load transactions: $e'),
          ),
        ],
      ),
    );
  }
}
