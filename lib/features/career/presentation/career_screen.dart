import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_button.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_empty_state.dart';
import '../../../core/design_system/widgets/viora_form_sheet.dart';
import '../../../core/design_system/widgets/viora_icon_button.dart';
import '../../../core/design_system/widgets/viora_input.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/design_system/widgets/viora_stat.dart';
import 'providers/career_providers.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CareerScreen extends ConsumerWidget {
  const CareerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final positionsAsync = ref.watch(careerPositionsProvider);
    final achievementsAsync = ref.watch(careerAchievementsProvider);
    final actions = ref.read(careerActionsProvider);
    final positions = positionsAsync.valueOrNull ?? const [];
    final achievements = achievementsAsync.valueOrNull ?? const [];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VioraSection(
            title: 'Career',
            subtitle: 'Positions, growth, achievements',
            trailing: VioraButton(
              label: 'Add role',
              icon: IconsaxPlusBold.add,
              onPressed: () => showVioraFormSheet(context: context, title: 'New position', icon: IconsaxPlusBroken.briefcase, accentColor: context.neu.domainWork, builder: (_) => const _PositionForm()),
            ),
          ),
          if (positions.isNotEmpty) ...[
            VioraCard(
              orbColors: [context.neu.domainWork, context.neu.brand],
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'CURRENT ROLE',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: context.neu.textTertiary, letterSpacing: 0.6),
                        ),
                        const SizedBox(height: VioraSpacing.xs),
                        Text(positions.first.role, style: Theme.of(context).textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                        Text(positions.first.employer, style: Theme.of(context).textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                  Expanded(
                    child: VioraStat(
                      label: 'Roles',
                      value: positions.length.toDouble(),
                      formatter: (v) => v.toInt().toString(),
                      icon: IconsaxPlusBroken.briefcase,
                      metricSize: 22,
                    ),
                  ),
                  Expanded(
                    child: VioraStat(
                      label: 'Wins',
                      value: achievements.length.toDouble(),
                      formatter: (v) => v.toInt().toString(),
                      icon: IconsaxPlusBroken.cup,
                      metricSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: VioraSpacing.xl2),
          ],
          positionsAsync.when(
            data: (positions) {
              if (positions.isEmpty) {
                return const VioraEmptyState(icon: IconsaxPlusBroken.briefcase, title: 'No positions yet', message: 'Add your current or past roles.');
              }
              return Column(
                children: [
                  for (final p in positions)
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
                                  Text(p.role, style: Theme.of(context).textTheme.bodyLarge),
                                  Text(
                                    '${p.employer} · since ${DateFormat('MMM yyyy').format(p.startDate)}',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            VioraIconButton(icon: IconsaxPlusBroken.trash, size: 32, tooltip: 'Delete', onPressed: () => actions.deletePosition(p.id)),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
            loading: () => const Padding(padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl2), child: Center(child: CircularProgressIndicator())),
            error: (e, st) => Text('Failed to load positions: $e'),
          ),
          const SizedBox(height: VioraSpacing.xl2),
          VioraSection(
            title: 'Achievements',
            trailing: VioraButton(
              label: 'Add',
              icon: IconsaxPlusBold.add,
              onPressed: () => showVioraFormSheet(context: context, title: 'New achievement', icon: IconsaxPlusBroken.cup, accentColor: context.neu.warning, builder: (_) => const _AchievementForm()),
            ),
          ),
          achievementsAsync.when(
            data: (achievements) {
              if (achievements.isEmpty) {
                return const VioraEmptyState(icon: IconsaxPlusBroken.cup, title: 'No achievements logged', message: 'Record wins for CVs, reviews, and portfolios.');
              }
              return Column(
                children: [
                  for (final a in achievements)
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
                                  Text(a.title, style: Theme.of(context).textTheme.bodyLarge),
                                  if (a.description != null) Text(a.description!, style: Theme.of(context).textTheme.bodySmall),
                                ],
                              ),
                            ),
                            VioraIconButton(icon: IconsaxPlusBroken.trash, size: 32, tooltip: 'Delete', onPressed: () => actions.deleteAchievement(a.id)),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
            loading: () => const Padding(padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl2), child: Center(child: CircularProgressIndicator())),
            error: (e, st) => Text('Failed to load achievements: $e'),
          ),
        ],
      ),
    );
  }
}

class _PositionForm extends ConsumerStatefulWidget {
  const _PositionForm();
  @override
  ConsumerState<_PositionForm> createState() => _PositionFormState();
}

class _PositionFormState extends ConsumerState<_PositionForm> {
  final _employer = TextEditingController();
  final _role = TextEditingController();
  final _salary = TextEditingController();
  final DateTime _startDate = DateTime.now();

  @override
  void dispose() {
    _employer.dispose();
    _role.dispose();
    _salary.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VioraInput(controller: _role, label: 'Role', hint: 'e.g. Software Engineer', autofocus: true),
        const SizedBox(height: VioraSpacing.lg),
        VioraInput(controller: _employer, label: 'Employer', hint: 'e.g. ROHI'),
        const SizedBox(height: VioraSpacing.lg),
        VioraInput(controller: _salary, label: 'Salary', hint: 'Optional', keyboardType: TextInputType.number),
        const SizedBox(height: VioraSpacing.xl2),
        VioraButton(
          label: 'Add position',
          icon: IconsaxPlusBroken.briefcase,
          expand: true,
          onPressed: () {
            final role = _role.text.trim();
            final employer = _employer.text.trim();
            if (role.isEmpty || employer.isEmpty) return;
            ref.read(careerActionsProvider).addPosition(
                  PositionDraft(employer: employer, role: role, startDate: _startDate, salary: double.tryParse(_salary.text.trim())),
                );
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class _AchievementForm extends ConsumerStatefulWidget {
  const _AchievementForm();
  @override
  ConsumerState<_AchievementForm> createState() => _AchievementFormState();
}

class _AchievementFormState extends ConsumerState<_AchievementForm> {
  final _title = TextEditingController();
  final _description = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VioraInput(controller: _title, label: 'Achievement', hint: 'e.g. Shipped ROHI v2', autofocus: true),
        const SizedBox(height: VioraSpacing.lg),
        VioraInput(controller: _description, label: 'Description', hint: 'Optional', maxLines: 3),
        const SizedBox(height: VioraSpacing.xl2),
        VioraButton(
          label: 'Add achievement',
          icon: IconsaxPlusBroken.cup,
          expand: true,
          onPressed: () {
            final title = _title.text.trim();
            if (title.isEmpty) return;
            ref.read(careerActionsProvider).addAchievement(AchievementDraft(title: title, description: _description.text.trim().isEmpty ? null : _description.text.trim()));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
