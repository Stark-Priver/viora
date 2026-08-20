import 'package:flutter/material.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_surface.dart';
import '../../domain/home_dashboard_data.dart';

class AlertsBanner extends StatelessWidget {
  const AlertsBanner({super.key, required this.alerts});

  final List<DashboardAlert> alerts;

  @override
  Widget build(BuildContext context) {
    if (alerts.isEmpty) return const SizedBox.shrink();
    final neu = context.neu;

    return SizedBox(
      height: 52,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: alerts.length,
        separatorBuilder: (_, __) => const SizedBox(width: VioraSpacing.md),
        itemBuilder: (context, i) {
          final a = alerts[i];
          final color = switch (a.severity) {
            AlertSeverity.danger => neu.danger,
            AlertSeverity.warning => neu.warning,
            AlertSeverity.info => neu.info,
          };
          return VioraSurface(
            elevation: VioraElevation.raised,
            borderRadius: 16,
            padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.lg, vertical: VioraSpacing.md),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(a.icon, size: 17, color: color),
                const SizedBox(width: VioraSpacing.sm),
                Text(a.message, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: neu.textPrimary)),
              ],
            ),
          );
        },
      ),
    );
  }
}
