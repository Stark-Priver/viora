import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_button.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_chip.dart';
import '../../../core/design_system/widgets/viora_empty_state.dart';
import '../../../core/design_system/widgets/viora_icon_button.dart';
import '../../../core/design_system/widgets/viora_input.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/design_system/widgets/viora_toast.dart';
import 'providers/health_providers.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class HealthScreen extends ConsumerStatefulWidget {
  const HealthScreen({super.key});

  @override
  ConsumerState<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends ConsumerState<HealthScreen> {
  final _sleepHours = TextEditingController();
  final _weight = TextEditingController();
  final _water = TextEditingController();
  int? _mood;
  int? _energy;
  String? _entryId;
  DateTime? _loadedForDay;

  @override
  void dispose() {
    _sleepHours.dispose();
    _weight.dispose();
    _water.dispose();
    super.dispose();
  }

  void _populate(DateTime day, {String? id, int? sleepMinutes, double? weightKg, int? waterMl, int? mood, int? energy}) {
    _entryId = id;
    _loadedForDay = day;
    _sleepHours.text = sleepMinutes == null ? '' : (sleepMinutes / 60).toStringAsFixed(1);
    _weight.text = weightKg?.toString() ?? '';
    _water.text = waterMl?.toString() ?? '';
    _mood = mood;
    _energy = energy;
  }

  @override
  Widget build(BuildContext context) {
    final day = ref.watch(healthSelectedDayProvider);
    final entryAsync = ref.watch(healthLogForDayProvider);
    final historyAsync = ref.watch(healthHistoryProvider);

    if (_loadedForDay != day && entryAsync.hasValue) {
      final entry = entryAsync.value;
      if (entry == null) {
        _populate(day);
      } else {
        _populate(day, id: entry.id, sleepMinutes: entry.sleepMinutes, weightKg: entry.weightKg, waterMl: entry.waterMl, mood: entry.mood, energy: entry.energy);
      }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VioraSection(title: 'Health', subtitle: 'Sleep, weight, water, mood'),
          VioraCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VioraIconButton(
                  icon: IconsaxPlusBroken.arrow_left_2,
                  onPressed: () => ref.read(healthSelectedDayProvider.notifier).state = day.subtract(const Duration(days: 1)),
                ),
                Text(DateFormat('EEEE, d MMMM').format(day), style: Theme.of(context).textTheme.titleMedium),
                VioraIconButton(
                  icon: IconsaxPlusBroken.arrow_right_2,
                  onPressed: () => ref.read(healthSelectedDayProvider.notifier).state = day.add(const Duration(days: 1)),
                ),
              ],
            ),
          ),
          const SizedBox(height: VioraSpacing.xl2),
          Row(
            children: [
              Expanded(child: VioraInput(controller: _sleepHours, label: 'Sleep (hours)', hint: '7.5', keyboardType: TextInputType.number)),
              const SizedBox(width: VioraSpacing.md),
              Expanded(child: VioraInput(controller: _weight, label: 'Weight (kg)', hint: '70', keyboardType: TextInputType.number)),
            ],
          ),
          const SizedBox(height: VioraSpacing.lg),
          VioraInput(controller: _water, label: 'Water (ml)', hint: '2000', keyboardType: TextInputType.number),
          const SizedBox(height: VioraSpacing.lg),
          Text('Mood', style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: VioraSpacing.sm),
          Wrap(
            spacing: VioraSpacing.sm,
            children: [
              for (var i = 1; i <= 5; i++) VioraChip(label: '$i', selected: _mood == i, onTap: () => setState(() => _mood = i)),
            ],
          ),
          const SizedBox(height: VioraSpacing.lg),
          Text('Energy', style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: VioraSpacing.sm),
          Wrap(
            spacing: VioraSpacing.sm,
            children: [
              for (var i = 1; i <= 5; i++) VioraChip(label: '$i', selected: _energy == i, onTap: () => setState(() => _energy = i)),
            ],
          ),
          const SizedBox(height: VioraSpacing.xl2),
          VioraButton(
            label: 'Save entry',
            icon: IconsaxPlusBold.check,
            expand: true,
            onPressed: () {
              final hours = double.tryParse(_sleepHours.text.trim());
              ref.read(healthActionsProvider).save(
                    day: day,
                    existingId: _entryId,
                    sleepMinutes: hours == null ? null : (hours * 60).round(),
                    weightKg: double.tryParse(_weight.text.trim()),
                    waterMl: int.tryParse(_water.text.trim()),
                    mood: _mood,
                    energy: _energy,
                  );
              VioraToast.show(context, 'Entry saved.', icon: IconsaxPlusBroken.tick_circle);
            },
          ),
          const SizedBox(height: VioraSpacing.xl2),
          const VioraSection(title: 'Recent history'),
          historyAsync.when(
            data: (rows) {
              if (rows.isEmpty) {
                return const VioraEmptyState(icon: IconsaxPlusBroken.heart, title: 'No entries yet', message: 'Log today\'s sleep, water, or mood above.');
              }
              return Column(
                children: [
                  for (final r in rows)
                    Padding(
                      padding: const EdgeInsets.only(bottom: VioraSpacing.sm),
                      child: VioraCard(
                        padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.lg, vertical: VioraSpacing.md),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(DateFormat('EEE, d MMM').format(r.date), style: Theme.of(context).textTheme.bodyLarge),
                            ),
                            if (r.sleepMinutes != null) _tag(context, IconsaxPlusBroken.moon, '${(r.sleepMinutes! / 60).toStringAsFixed(1)}h'),
                            if (r.weightKg != null) _tag(context, IconsaxPlusBroken.weight, '${r.weightKg}kg'),
                            if (r.mood != null) _tag(context, IconsaxPlusBroken.emoji_happy, '${r.mood}/5'),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
            loading: () => const Padding(padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl4), child: Center(child: CircularProgressIndicator())),
            error: (e, st) => Text('Failed to load history: $e'),
          ),
        ],
      ),
    );
  }

  Widget _tag(BuildContext context, IconData icon, String text) {
    final neu = context.neu;
    return Padding(
      padding: const EdgeInsets.only(left: VioraSpacing.sm),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: neu.textTertiary),
          const SizedBox(width: 3),
          Text(text, style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}
