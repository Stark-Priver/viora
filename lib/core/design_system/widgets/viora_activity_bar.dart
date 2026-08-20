import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';
import '../tokens/motion.dart';
import '../tokens/spacing.dart';

class VioraActivitySegment {
  const VioraActivitySegment({required this.label, required this.minutes, required this.color, this.icon});

  final String label;
  final int minutes;
  final Color color;
  final IconData? icon;
}

/// Horizontal stacked bar showing how a block of time (a day, a week) split
/// across life domains, followed by a compact legend with durations.
/// This is the visual backbone of the Home "Life Snapshot" and weekly
/// analytics breakdowns.
class VioraActivityBar extends StatelessWidget {
  const VioraActivityBar({super.key, required this.segments, this.height = 14});

  final List<VioraActivitySegment> segments;
  final double height;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final total = segments.fold<int>(0, (sum, s) => sum + s.minutes);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(height / 2),
          child: SizedBox(
            height: height,
            child: total == 0
                ? ColoredBox(color: neu.surfaceSunken)
                : Row(
                    children: segments.where((s) => s.minutes > 0).map((s) {
                      return Expanded(
                        flex: s.minutes,
                        child: TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0, end: 1),
                          duration: VioraMotion.slow,
                          curve: VioraMotion.standard,
                          builder: (context, v, child) => Opacity(opacity: v, child: child),
                          child: ColoredBox(color: s.color),
                        ),
                      );
                    }).toList(),
                  ),
          ),
        ),
        const SizedBox(height: VioraSpacing.md),
        Wrap(
          spacing: VioraSpacing.lg,
          runSpacing: VioraSpacing.sm,
          children: segments.map((s) {
            final hours = s.minutes ~/ 60;
            final mins = s.minutes % 60;
            final duration = hours > 0 ? '${hours}h ${mins}m' : '${mins}m';
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(color: s.color, shape: BoxShape.circle),
                ),
                const SizedBox(width: VioraSpacing.xs),
                Text(s.label, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(width: VioraSpacing.xs),
                Text(
                  duration,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(color: neu.textPrimary),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
