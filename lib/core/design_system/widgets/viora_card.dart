import 'package:flutter/material.dart';
import '../tokens/spacing.dart';
import 'viora_surface.dart';
import 'viora_orb_field.dart';

/// Standard content card: raised surface with default padding. Use this
/// instead of reaching for [VioraSurface] directly in feature screens.
///
/// Pass [orbColors] (1-2 colors) to give a hero card the soft abstract
/// glow treatment — reserve it for the one or two most important surfaces
/// per screen (Home's header, a primary metric card), not every card,
/// or it stops reading as emphasis.
class VioraCard extends StatelessWidget {
  const VioraCard({
    super.key,
    required this.child,
    this.elevation = VioraElevation.raised,
    this.padding = const EdgeInsets.all(VioraSpacing.xl),
    this.borderRadius = 22,
    this.onTap,
    this.color,
    this.orbColors,
  });

  final Widget child;
  final VioraElevation elevation;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final VoidCallback? onTap;
  final Color? color;
  final List<Color>? orbColors;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    final content = orbColors == null
        ? Padding(padding: padding, child: child)
        : Stack(
            children: [
              VioraOrbField(colors: orbColors!, borderRadius: radius),
              Padding(padding: padding, child: child),
            ],
          );

    return VioraSurface(
      elevation: elevation,
      borderRadius: borderRadius,
      padding: EdgeInsets.zero,
      onTap: onTap,
      color: color,
      child: content,
    );
  }
}
