import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';

enum VioraElevation {
  /// No shadow — sits flush with the background. Used for section
  /// backgrounds and full-bleed areas.
  flat,

  /// Standard raised control: cards, buttons, chips.
  raised,

  /// Higher raised control: the primary metric card on a screen, dialogs.
  raisedHigh,

  /// Recessed into the surface: input fields, progress track backgrounds,
  /// unselected segmented-control options.
  inset,
}

/// The base building block of the neumorphic design system. Every other
/// Viora surface widget (card, button, input, chip...) wraps this.
///
/// Deliberately restrained: shadow blur/offset stay small so surfaces read
/// as "gently lifted paper," not the exaggerated embossed-plastic look of
/// classic neumorphism.
class VioraSurface extends StatelessWidget {
  const VioraSurface({
    super.key,
    required this.child,
    this.elevation = VioraElevation.raised,
    this.borderRadius = 20,
    this.padding,
    this.color,
    this.width,
    this.height,
    this.onTap,
  });

  final Widget child;
  final VioraElevation elevation;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? width;
  final double? height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final radius = BorderRadius.circular(borderRadius);
    final base = color ?? neu.surface;

    Widget content = Padding(
      padding: padding ?? EdgeInsets.zero,
      child: child,
    );

    Widget surface;
    switch (elevation) {
      case VioraElevation.flat:
        surface = DecoratedBox(
          decoration: BoxDecoration(color: base, borderRadius: radius),
          child: content,
        );
        break;
      case VioraElevation.raised:
        surface = DecoratedBox(
          decoration: BoxDecoration(
            color: base,
            borderRadius: radius,
            boxShadow: [
              BoxShadow(color: neu.darkShadow.withValues(alpha: 0.55), offset: const Offset(5, 5), blurRadius: 14),
              BoxShadow(color: neu.lightShadow.withValues(alpha: 0.75), offset: const Offset(-5, -5), blurRadius: 14),
            ],
          ),
          child: content,
        );
        break;
      case VioraElevation.raisedHigh:
        surface = DecoratedBox(
          decoration: BoxDecoration(
            color: base,
            borderRadius: radius,
            boxShadow: [
              BoxShadow(color: neu.darkShadow.withValues(alpha: 0.65), offset: const Offset(9, 9), blurRadius: 22),
              BoxShadow(color: neu.lightShadow.withValues(alpha: 0.85), offset: const Offset(-9, -9), blurRadius: 22),
            ],
          ),
          child: content,
        );
        break;
      case VioraElevation.inset:
        surface = CustomPaint(
          painter: _InsetShadowPainter(
            radius: borderRadius,
            base: color ?? neu.surfaceSunken,
            darkShadow: neu.darkShadow,
            lightShadow: neu.lightShadow,
          ),
          child: content,
        );
        break;
    }

    if (width != null || height != null) {
      surface = SizedBox(width: width, height: height, child: surface);
    }

    if (onTap != null) {
      surface = Material(
        color: Colors.transparent,
        borderRadius: radius,
        child: InkWell(borderRadius: radius, onTap: onTap, child: surface),
      );
    }

    return surface;
  }
}

/// Paints a soft inner shadow by drawing two blurred, offset shadow shapes
/// clipped to only render inside the already-painted base shape
/// (`BlendMode.srcATop`). This is the standard technique for approximating
/// CSS-style `inset` box-shadow, which Flutter has no native primitive for.
class _InsetShadowPainter extends CustomPainter {
  const _InsetShadowPainter({
    required this.radius,
    required this.base,
    required this.darkShadow,
    required this.lightShadow,
  });

  final double radius;
  final Color base;
  final Color darkShadow;
  final Color lightShadow;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    const distance = 4.0;
    const blur = 9.0;

    canvas.saveLayer(rect, Paint());
    canvas.drawRRect(rrect, Paint()..color = base);

    canvas.drawRRect(
      rrect.shift(const Offset(distance, distance)),
      Paint()
        ..color = darkShadow.withValues(alpha: 0.5)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, blur)
        ..blendMode = BlendMode.srcATop,
    );
    canvas.drawRRect(
      rrect.shift(const Offset(-distance, -distance)),
      Paint()
        ..color = lightShadow.withValues(alpha: 0.6)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, blur)
        ..blendMode = BlendMode.srcATop,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _InsetShadowPainter oldDelegate) {
    return oldDelegate.radius != radius ||
        oldDelegate.base != base ||
        oldDelegate.darkShadow != darkShadow ||
        oldDelegate.lightShadow != lightShadow;
  }
}
