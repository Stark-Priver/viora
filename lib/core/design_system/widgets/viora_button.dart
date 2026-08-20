import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';
import '../tokens/motion.dart';
import '../tokens/spacing.dart';

enum VioraButtonVariant { primary, secondary, ghost, danger }

/// Primary interactive control. A subtle scale-down on press stands in for
/// a "pressed into the surface" neumorphic response without the cost of a
/// full inset-shadow repaint on every tap.
class VioraButton extends StatefulWidget {
  const VioraButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.variant = VioraButtonVariant.primary,
    this.expand = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final VioraButtonVariant variant;
  final bool expand;

  @override
  State<VioraButton> createState() => _VioraButtonState();
}

class _VioraButtonState extends State<VioraButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final enabled = widget.onPressed != null;

    final (Color bg, Color fg, List<BoxShadow> shadow) = switch (widget.variant) {
      VioraButtonVariant.primary => (
          neu.brand,
          neu.brandOn,
          [BoxShadow(color: neu.brand.withValues(alpha: 0.35), offset: const Offset(0, 6), blurRadius: 16)],
        ),
      VioraButtonVariant.secondary => (
          neu.surface,
          neu.textPrimary,
          [
            BoxShadow(color: neu.darkShadow.withValues(alpha: 0.5), offset: const Offset(4, 4), blurRadius: 10),
            BoxShadow(color: neu.lightShadow.withValues(alpha: 0.7), offset: const Offset(-4, -4), blurRadius: 10),
          ],
        ),
      VioraButtonVariant.ghost => (Colors.transparent, neu.textPrimary, const <BoxShadow>[]),
      VioraButtonVariant.danger => (
          neu.danger,
          neu.brandOn,
          [BoxShadow(color: neu.danger.withValues(alpha: 0.35), offset: const Offset(0, 6), blurRadius: 16)],
        ),
    };

    final opacity = enabled ? 1.0 : 0.45;

    return Opacity(
      opacity: opacity,
      child: GestureDetector(
        onTapDown: enabled ? (_) => setState(() => _pressed = true) : null,
        onTapCancel: enabled ? () => setState(() => _pressed = false) : null,
        onTapUp: enabled ? (_) => setState(() => _pressed = false) : null,
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _pressed ? 0.97 : 1.0,
          duration: VioraMotion.instant,
          curve: VioraMotion.standard,
          child: AnimatedContainer(
            duration: VioraMotion.fast,
            width: widget.expand ? double.infinity : null,
            padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.xl2, vertical: VioraSpacing.md + 2),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(16),
              boxShadow: _pressed ? const [] : shadow,
            ),
            child: Row(
              mainAxisSize: widget.expand ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  Icon(widget.icon, size: 18, color: fg),
                  const SizedBox(width: VioraSpacing.sm),
                ],
                // Flexible+ellipsis rather than a bare Text: a button
                // placed in a narrow slot (a card in a tight column, a
                // half-width layout) must degrade to truncated text
                // instead of throwing a RenderFlex overflow.
                Flexible(
                  child: Text(
                    widget.label,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(color: fg),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
