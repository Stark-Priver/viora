import 'package:flutter/material.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_card.dart';
import '../../../../core/design_system/widgets/viora_section.dart';
import '../../../../core/design_system/widgets/viora_activity_bar.dart';
import '../../../../core/design_system/widgets/viora_stat.dart';
import '../../domain/home_dashboard_data.dart';

class LifeSnapshotCard extends StatelessWidget {
  const LifeSnapshotCard({
    super.key,
    required this.segments,
    required this.sleepMinutes,
    required this.focusScore,
    required this.planAdherence,
  });

  final List<LifeDomainMinutes> segments;
  final int sleepMinutes;
  final double focusScore;
  final double planAdherence;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final sleepH = sleepMinutes ~/ 60;
    final sleepM = sleepMinutes % 60;

    return VioraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VioraSection(title: 'Life Snapshot', subtitle: "Where today's hours went"),
          VioraActivityBar(
            segments: segments
                .map((s) => VioraActivitySegment(label: s.label, minutes: s.minutes, color: s.color, icon: s.icon))
                .toList(),
          ),
          const SizedBox(height: VioraSpacing.xl2),
          Container(height: 1, color: neu.divider),
          const SizedBox(height: VioraSpacing.xl2),
          Row(
            children: [
              Expanded(
                child: VioraStat(
                  label: 'Sleep',
                  value: sleepMinutes.toDouble(),
                  formatter: (_) => '${sleepH}h ${sleepM}m',
                  icon: Icons.bedtime_outlined,
                  metricSize: 22,
                ),
              ),
              Expanded(
                child: VioraStat(
                  label: 'Focus score',
                  value: focusScore * 100,
                  formatter: (v) => '${v.round()}%',
                  icon: Icons.center_focus_strong_rounded,
                  metricSize: 22,
                ),
              ),
              Expanded(
                child: VioraStat(
                  label: 'Plan adherence',
                  value: planAdherence * 100,
                  formatter: (v) => '${v.round()}%',
                  icon: Icons.fact_check_outlined,
                  metricSize: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
