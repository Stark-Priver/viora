import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/shell/bottom_nav_controller.dart';
import '../../../../core/design_system/shell/viora_nav.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_card.dart';
import '../../../../core/design_system/widgets/viora_chip.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class BottomNavSettingsCard extends ConsumerWidget {
  const BottomNavSettingsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPaths = ref.watch(bottomNavPathsProvider);
    final notifier = ref.read(bottomNavPathsProvider.notifier);
    final neu = context.neu;
    final selectedItems = ref.watch(bottomNavItemsProvider);

    return VioraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bottom Navigation', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: VioraSpacing.xs),
                    Text(
                      'Pick up to $maxBottomNavItems (${selectedPaths.length}/$maxBottomNavItems) — the middle one becomes the raised center button.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: neu.textSecondary),
                    ),
                  ],
                ),
              ),
              TextButton(onPressed: notifier.reset, child: const Text('Reset')),
            ],
          ),
          const SizedBox(height: VioraSpacing.md),
          if (selectedItems.isNotEmpty)
            Row(
              children: [
                for (var i = 0; i < selectedItems.length; i++) ...[
                  if (i > 0) Icon(IconsaxPlusBroken.arrow_right_2, size: 14, color: neu.textTertiary),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: i == selectedItems.length ~/ 2 ? neu.brand : neu.surfaceSunken,
                          ),
                          child: Icon(selectedItems[i].icon, size: 16, color: i == selectedItems.length ~/ 2 ? Colors.white : neu.textSecondary),
                        ),
                        const SizedBox(height: 4),
                        Text(selectedItems[i].label, style: Theme.of(context).textTheme.labelSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          const SizedBox(height: VioraSpacing.lg),
          Wrap(
            spacing: VioraSpacing.sm,
            runSpacing: VioraSpacing.sm,
            children: [
              for (final item in vioraAllSelectableNavItems.where((i) => i.enabled))
                VioraChip(
                  label: item.label,
                  icon: item.icon,
                  selected: selectedPaths.contains(item.path),
                  onTap: () => notifier.toggle(item.path!),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
