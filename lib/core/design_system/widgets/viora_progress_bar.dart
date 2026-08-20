import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';
import '../tokens/motion.dart';

/// Linear progress indicator on a recessed track — used for budgets,
/// habit targets, and any planned-vs-actual bar that isn't a ring.
class VioraProgressBar extends StatelessWidget {
  const VioraProgressBar({
    super.key,
    required this.progress,
    this.height = 10,
    this.color,
    this.overTargetColor,
  });

  /// 0.0–1.0+. Values beyond 1.0 render full-width in [overTargetColor].
  final double progress;
  final double height;
  final Color? color;
  final Color? overTargetColor;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final over = progress > 1.0;
    final fillColor = over ? (overTargetColor ?? neu.warning) : (color ?? neu.brand);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: progress.clamp(0, 1)),
      duration: VioraMotion.slow,
      curve: VioraMotion.standard,
      builder: (context, value, _) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(height / 2),
          child: Stack(
            children: [
              Container(height: height, color: neu.surfaceSunken),
              FractionallySizedBox(
                widthFactor: value,
                child: Container(height: height, color: fillColor),
              ),
            ],
          ),
        );
      },
    );
  }
}
