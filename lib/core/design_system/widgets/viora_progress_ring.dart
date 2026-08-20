import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';
import '../tokens/motion.dart';

/// Animated circular progress indicator with a recessed track and a
/// raised-looking progress stroke, plus an optional centered label.
class VioraProgressRing extends StatelessWidget {
  const VioraProgressRing({
    super.key,
    required this.progress,
    this.size = 148,
    this.strokeWidth = 14,
    this.color,
    this.center,
  });

  /// 0.0–1.0. Values above 1.0 are clamped for the stroke but the label is
  /// left to the caller (e.g. "112%" for over-target).
  final double progress;
  final double size;
  final double strokeWidth;
  final Color? color;
  final Widget? center;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final ringColor = color ?? neu.brand;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: progress.clamp(0, 1)),
      duration: VioraMotion.counter,
      curve: VioraMotion.emphasized,
      builder: (context, value, _) {
        return SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(size, size),
                painter: _RingPainter(
                  progress: value,
                  strokeWidth: strokeWidth,
                  track: neu.surfaceSunken,
                  trackShadow: neu.darkShadow,
                  color: ringColor,
                ),
              ),
              if (center != null) center!,
            ],
          ),
        );
      },
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter({
    required this.progress,
    required this.strokeWidth,
    required this.track,
    required this.trackShadow,
    required this.color,
  });

  final double progress;
  final double strokeWidth;
  final Color track;
  final Color trackShadow;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide - strokeWidth) / 2;
    const start = -math.pi / 2;

    final trackPaint = Paint()
      ..color = track
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, trackPaint);

    final shadowPaint = Paint()
      ..color = trackShadow.withValues(alpha: 0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), start, 2 * math.pi, false, shadowPaint);

    if (progress > 0) {
      final progressPaint = Paint()
        ..shader = SweepGradient(
          startAngle: 0,
          endAngle: 2 * math.pi * progress,
          colors: [color.withValues(alpha: 0.75), color],
          transform: GradientRotation(start),
        ).createShader(Rect.fromCircle(center: center, radius: radius))
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        start,
        2 * math.pi * progress,
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
