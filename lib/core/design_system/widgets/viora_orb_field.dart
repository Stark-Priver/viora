import 'package:flutter/material.dart';

/// Soft, out-of-focus color discs used as a background accent on hero
/// surfaces (the Home header, primary metric cards) — the "abstract shape"
/// layer that gives the flat neumorphic surfaces some depth and warmth
/// without resorting to a literal illustration or a busy gradient. Cheap
/// by construction: a radial gradient fading to transparent reads as a
/// blurred glow without an actual `BackdropFilter` blur pass.
class VioraOrb extends StatelessWidget {
  const VioraOrb({super.key, required this.size, required this.color, this.opacity = 0.4});

  final double size;
  final Color color;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [color.withValues(alpha: opacity), color.withValues(alpha: 0)],
          ),
        ),
      ),
    );
  }
}

/// Positions 1-2 [VioraOrb]s bleeding off opposite corners of whatever
/// [size] rect they're placed in, clipped to [borderRadius]. Meant to be
/// layered as the bottom entry of a `Stack` behind real content.
class VioraOrbField extends StatelessWidget {
  const VioraOrbField({
    super.key,
    required this.colors,
    required this.borderRadius,
  });

  final List<Color> colors;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: [
            if (colors.isNotEmpty)
              Positioned(top: -70, right: -60, child: VioraOrb(size: 220, color: colors[0])),
            if (colors.length > 1)
              Positioned(bottom: -80, left: -50, child: VioraOrb(size: 200, color: colors[1], opacity: 0.3)),
          ],
        ),
      ),
    );
  }
}
