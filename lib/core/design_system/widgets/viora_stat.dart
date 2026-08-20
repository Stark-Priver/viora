import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';
import '../tokens/motion.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

enum VioraTrend { up, down, flat }

/// A labeled metric readout with an animated count-up and an optional
/// comparison line. Per the design-quality bar, a stat should say more
/// than the bare number — pair it with [delta] whenever there's a
/// meaningful baseline to compare against.
class VioraStat extends StatelessWidget {
  const VioraStat({
    super.key,
    required this.label,
    required this.value,
    this.formatter,
    this.delta,
    this.trend,
    this.trendIsGood,
    this.metricSize = 30,
    this.icon,
    this.iconColor,
  });

  final String label;
  final double value;
  final String Function(double value)? formatter;
  final String? delta;
  final VioraTrend? trend;

  /// Whether [trend] represents a favorable change (colors the delta green
  /// vs amber accordingly). Null = neutral gray.
  final bool? trendIsGood;
  final double metricSize;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;

    final deltaColor = trendIsGood == null
        ? neu.textTertiary
        : (trendIsGood! ? neu.success : neu.warning);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16, color: iconColor ?? neu.textTertiary),
              const SizedBox(width: VioraSpacing.xs),
            ],
            Flexible(child: Text(label, style: textTheme.labelMedium, overflow: TextOverflow.ellipsis)),
          ],
        ),
        const SizedBox(height: VioraSpacing.xs),
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: value),
          duration: VioraMotion.counter,
          curve: VioraMotion.emphasized,
          builder: (context, v, _) {
            final text = formatter != null ? formatter!(v) : v.toStringAsFixed(0);
            return Text(
              text,
              style: VioraTypography.metric(neu.textPrimary, size: metricSize),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            );
          },
        ),
        if (delta != null) ...[
          const SizedBox(height: VioraSpacing.xs2),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trend != null && trend != VioraTrend.flat)
                Icon(
                  trend == VioraTrend.up ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
                  size: 13,
                  color: deltaColor,
                ),
              Flexible(
                child: Text(
                  delta!,
                  style: textTheme.bodySmall?.copyWith(color: deltaColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
