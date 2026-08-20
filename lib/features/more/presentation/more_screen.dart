import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/design_system/shell/viora_nav.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/design_system/widgets/viora_toast.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

/// Overflow menu for mobile — the bottom nav only has room for four
/// destinations plus this one, so everything else (built or not) lives
/// here, grouped exactly like the desktop sidebar so the mental model
/// never splits across screen sizes.
class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VioraSection(title: 'More', subtitle: 'Everything else Viora tracks'),
          for (final group in vioraNavGroups) ...[
            Padding(
              padding: const EdgeInsets.only(top: VioraSpacing.lg, bottom: VioraSpacing.sm),
              child: Text(group.label, style: Theme.of(context).textTheme.labelSmall),
            ),
            VioraCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  for (var i = 0; i < group.items.length; i++) ...[
                    _MoreTile(
                      item: group.items[i],
                      onTap: () {
                        final item = group.items[i];
                        if (!item.enabled) {
                          VioraToast.show(context, '${item.label} is on the way — Phase 2+ of the build.', icon: IconsaxPlusBroken.timer_start);
                          return;
                        }
                        context.go(item.path!);
                      },
                    ),
                    if (i != group.items.length - 1) Divider(height: 1, color: neu.divider, indent: VioraSpacing.lg, endIndent: VioraSpacing.lg),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _MoreTile extends StatelessWidget {
  const _MoreTile({required this.item, required this.onTap});
  final VioraNavItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.lg, vertical: VioraSpacing.md),
          child: Row(
            children: [
              Icon(item.icon, size: 20, color: item.enabled ? neu.textSecondary : neu.textTertiary),
              const SizedBox(width: VioraSpacing.md),
              Expanded(
                child: Text(
                  item.label,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: item.enabled ? neu.textPrimary : neu.textTertiary),
                ),
              ),
              if (!item.enabled)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: neu.surfaceSunken, borderRadius: BorderRadius.circular(8)),
                  child: Text('soon', style: Theme.of(context).textTheme.labelSmall),
                )
              else
                Icon(IconsaxPlusBroken.arrow_right_2, size: 20, color: neu.textTertiary),
            ],
          ),
        ),
      ),
    );
  }
}
