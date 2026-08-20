import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_button.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_chip.dart';
import '../../../core/design_system/widgets/viora_empty_state.dart';
import '../../../core/design_system/widgets/viora_form_sheet.dart';
import '../../../core/design_system/widgets/viora_icon_button.dart';
import '../../../core/design_system/widgets/viora_input.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/design_system/widgets/viora_stat.dart';
import 'providers/business_providers.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';

class BusinessScreen extends ConsumerWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(businessProjectsProvider);
    final clientsAsync = ref.watch(businessClientsProvider);
    final actions = ref.read(businessActionsProvider);
    final fmt = NumberFormat.decimalPattern();
    final projects = projectsAsync.valueOrNull ?? const [];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VioraSection(
            title: 'Business',
            subtitle: 'Clients, projects, effective rate',
            trailing: VioraButton(
              label: 'Add project',
              icon: Icons.add_rounded,
              onPressed: () => showVioraFormSheet(context: context, title: 'New project', icon: Icons.storefront_outlined, accentColor: context.neu.domainBusiness, builder: (_) => const _ProjectForm()),
            ),
          ),
          if (projects.isNotEmpty) ...[
            VioraCard(
              orbColors: [context.neu.domainBusiness, context.neu.brand],
              child: Row(
                children: [
                  Expanded(
                    child: VioraStat(
                      label: 'Revenue',
                      value: projects.fold<double>(0, (s, p) => s + p.revenue),
                      formatter: fmt.format,
                      icon: Icons.trending_up_rounded,
                      metricSize: 22,
                    ),
                  ),
                  Expanded(
                    child: VioraStat(
                      label: 'Expenses',
                      value: projects.fold<double>(0, (s, p) => s + p.expenses),
                      formatter: fmt.format,
                      icon: Icons.trending_down_rounded,
                      metricSize: 22,
                    ),
                  ),
                  Expanded(
                    child: VioraStat(
                      label: 'Net',
                      value: projects.fold<double>(0, (s, p) => s + (p.revenue - p.expenses)),
                      formatter: fmt.format,
                      icon: Icons.account_balance_wallet_outlined,
                      metricSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: VioraSpacing.xl2),
          ],
          projectsAsync.when(
            data: (projects) {
              if (projects.isEmpty) {
                return VioraEmptyState(
                  icon: Icons.storefront_outlined,
                  title: 'No projects yet',
                  message: 'Track revenue, expenses, and hours to see your effective hourly rate.',
                  actionLabel: 'Add project',
                  onAction: () => showVioraFormSheet(context: context, title: 'New project', icon: Icons.storefront_outlined, accentColor: context.neu.domainBusiness, builder: (_) => const _ProjectForm()),
                );
              }
              return Column(
                children: [
                  for (final p in projects)
                    Padding(
                      padding: const EdgeInsets.only(bottom: VioraSpacing.md),
                      child: VioraCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(child: Text(p.name, style: Theme.of(context).textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis)),
                                VioraIconButton(icon: Icons.delete_outline_rounded, size: 34, tooltip: 'Delete', onPressed: () => actions.deleteProject(p.id)),
                              ],
                            ),
                            const SizedBox(height: VioraSpacing.sm),
                            Wrap(
                              spacing: VioraSpacing.sm,
                              runSpacing: VioraSpacing.xs,
                              children: [
                                VioraChip(label: p.status.replaceAll('_', ' '), onTap: () => actions.cycleStatus(p.id, p.status)),
                                VioraChip(label: 'Revenue ${fmt.format(p.revenue)}', icon: Icons.trending_up_rounded),
                                VioraChip(label: 'Expenses ${fmt.format(p.expenses)}', icon: Icons.trending_down_rounded),
                                if (p.hoursSpent > 0)
                                  VioraChip(label: '${fmt.format((p.revenue - p.expenses) / p.hoursSpent)}/hr', icon: Icons.schedule_rounded),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
            loading: () => const Padding(padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl2), child: Center(child: CircularProgressIndicator())),
            error: (e, st) => Text('Failed to load projects: $e'),
          ),
          const SizedBox(height: VioraSpacing.xl2),
          VioraSection(
            title: 'Clients',
            trailing: VioraButton(
              label: 'Add',
              icon: Icons.add_rounded,
              onPressed: () => showVioraFormSheet(context: context, title: 'New client', icon: Icons.person_add_alt_1_rounded, accentColor: context.neu.domainBusiness, builder: (_) => const _ClientForm()),
            ),
          ),
          clientsAsync.when(
            data: (clients) {
              if (clients.isEmpty) {
                return const VioraEmptyState(icon: Icons.people_outline_rounded, title: 'No clients yet', message: 'Add clients to link them to projects.');
              }
              return Column(
                children: [
                  for (final c in clients)
                    Padding(
                      padding: const EdgeInsets.only(bottom: VioraSpacing.md),
                      child: VioraCard(
                        padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.lg, vertical: VioraSpacing.lg),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(c.name, style: Theme.of(context).textTheme.bodyLarge),
                                  if (c.contact != null) Text(c.contact!, style: Theme.of(context).textTheme.bodySmall),
                                ],
                              ),
                            ),
                            VioraIconButton(icon: Icons.delete_outline_rounded, size: 32, tooltip: 'Delete', onPressed: () => actions.deleteClient(c.id)),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
            loading: () => const Padding(padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl2), child: Center(child: CircularProgressIndicator())),
            error: (e, st) => Text('Failed to load clients: $e'),
          ),
        ],
      ),
    );
  }
}

class _ProjectForm extends ConsumerStatefulWidget {
  const _ProjectForm();
  @override
  ConsumerState<_ProjectForm> createState() => _ProjectFormState();
}

class _ProjectFormState extends ConsumerState<_ProjectForm> {
  final _name = TextEditingController();
  final _revenue = TextEditingController();
  final _expenses = TextEditingController();
  final _hours = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _revenue.dispose();
    _expenses.dispose();
    _hours.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VioraInput(controller: _name, label: 'Project name', hint: 'e.g. Client website', autofocus: true),
        const SizedBox(height: VioraSpacing.lg),
        Row(
          children: [
            Expanded(child: VioraInput(controller: _revenue, label: 'Revenue', hint: '0', keyboardType: TextInputType.number)),
            const SizedBox(width: VioraSpacing.md),
            Expanded(child: VioraInput(controller: _expenses, label: 'Expenses', hint: '0', keyboardType: TextInputType.number)),
          ],
        ),
        const SizedBox(height: VioraSpacing.lg),
        VioraInput(controller: _hours, label: 'Hours spent', hint: '0', keyboardType: TextInputType.number),
        const SizedBox(height: VioraSpacing.xl2),
        VioraButton(
          label: 'Add project',
          icon: Icons.storefront_outlined,
          expand: true,
          onPressed: () {
            final name = _name.text.trim();
            if (name.isEmpty) return;
            ref.read(businessActionsProvider).addProject(
                  BusinessProjectDraft(
                    name: name,
                    revenue: double.tryParse(_revenue.text.trim()) ?? 0,
                    expenses: double.tryParse(_expenses.text.trim()) ?? 0,
                    hoursSpent: double.tryParse(_hours.text.trim()) ?? 0,
                  ),
                );
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class _ClientForm extends ConsumerStatefulWidget {
  const _ClientForm();
  @override
  ConsumerState<_ClientForm> createState() => _ClientFormState();
}

class _ClientFormState extends ConsumerState<_ClientForm> {
  final _name = TextEditingController();
  final _contact = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _contact.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VioraInput(controller: _name, label: 'Client name', autofocus: true),
        const SizedBox(height: VioraSpacing.lg),
        VioraInput(controller: _contact, label: 'Contact', hint: 'Optional'),
        const SizedBox(height: VioraSpacing.xl2),
        VioraButton(
          label: 'Add client',
          icon: Icons.person_add_alt_1_rounded,
          expand: true,
          onPressed: () {
            final name = _name.text.trim();
            if (name.isEmpty) return;
            ref.read(businessActionsProvider).addClient(ClientDraft(name: name, contact: _contact.text.trim().isEmpty ? null : _contact.text.trim()));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
