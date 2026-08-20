import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';
import 'viora_surface.dart';

/// Small raised (or selected/inset) icon control — nav rail items, header
/// actions, segmented toggles.
class VioraIconButton extends StatelessWidget {
  const VioraIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.selected = false,
    this.size = 44,
    this.tooltip,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final bool selected;
  final double size;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final button = VioraSurface(
      elevation: selected ? VioraElevation.inset : VioraElevation.raised,
      borderRadius: size / 2.6,
      width: size,
      height: size,
      onTap: onPressed,
      color: selected ? neu.surfaceSunken : null,
      child: Center(
        child: Icon(icon, size: size * 0.44, color: selected ? neu.brand : neu.textSecondary),
      ),
    );

    if (tooltip == null) return button;
    return Tooltip(message: tooltip!, child: button);
  }
}
