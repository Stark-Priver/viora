import 'package:flutter/material.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_card.dart';
import '../../../../core/design_system/widgets/viora_surface.dart';
import '../../../../core/design_system/widgets/viora_progress_ring.dart';
import '../../../../core/design_system/widgets/viora_section.dart';
import '../../domain/home_dashboard_data.dart';

String _fmtHm(int minutes) {
  final h = minutes ~/ 60;
  final m = minutes % 60;
  if (h == 0) return '${m}m';
  return '${h}h ${m}m';
}

class TodayProgressCard extends StatelessWidget {
  const TodayProgressCard({super.key, required this.data});

  final HomeDashboardData data;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;
    final remaining = (data.plannedMinutes - data.actualMinutes).clamp(0, 1 << 30);
    final pct = (data.todayProgress * 100).round();

    return VioraCard(
      elevation: VioraElevation.raisedHigh,
      orbColors: [neu.brand, neu.domainFinance],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VioraSection(title: 'Today', subtitle: 'Productive time vs. plan'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VioraProgressRing(
                progress: data.todayProgress,
                size: 132,
                strokeWidth: 13,
                center: Text('$pct%', style: textTheme.headlineLarge),
              ),
              const SizedBox(width: VioraSpacing.xl2),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _row(context, 'Actual', _fmtHm(data.actualMinutes), neu.textPrimary),
                    const SizedBox(height: VioraSpacing.sm),
                    _row(context, 'Planned', _fmtHm(data.plannedMinutes), neu.textSecondary),
                    const SizedBox(height: VioraSpacing.sm),
                    _row(context, 'Remaining', _fmtHm(remaining), neu.brand),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _row(BuildContext context, String label, String value, Color valueColor) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: textTheme.bodySmall, overflow: TextOverflow.ellipsis),
        Text(
          value,
          style: textTheme.titleMedium?.copyWith(color: valueColor),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
