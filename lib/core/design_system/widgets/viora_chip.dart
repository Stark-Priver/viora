import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';
import '../tokens/spacing.dart';

/// Small pill for statuses, priorities, domain tags, and filter bars.
class VioraChip extends StatelessWidget {
  const VioraChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
    this.color,
    this.icon,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final Color? color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final accent = color ?? neu.brand;
    final bg = selected ? accent.withValues(alpha: 0.14) : neu.surfaceSunken;
    final fg = selected ? accent : neu.textSecondary;

    // `alignment:` on Container makes it expand to fill the Wrap's row
    // width (Align semantics) — deliberately omitted so the pill still
    // shrink-wraps to its content; Center below only affects the child's
    // position within the enforced minHeight, not Container's own size.
    final chip = Container(
      constraints: const BoxConstraints(minHeight: 44),
      padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.lg),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999)),
      child: Center(
        widthFactor: 1,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 14, color: fg),
              const SizedBox(width: VioraSpacing.xs),
            ],
            Text(label, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: fg)),
          ],
        ),
      ),
    );

    // Old padding produced a ~33-37px tap target — fine with a mouse, easy
    // to miss with a real thumb. minHeight: 44 matches the platform's
    // minimum comfortable touch target.
    if (onTap == null) return chip;
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(borderRadius: BorderRadius.circular(999), onTap: onTap, child: chip),
    );
  }
}
