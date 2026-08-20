import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';
import '../tokens/spacing.dart';
import 'viora_card.dart';
import 'viora_section.dart';
import 'viora_surface.dart';

/// Shared shell for modules that are genuinely blocked on infrastructure
/// this pass didn't build (native OS permissions, an external API key) —
/// an honest explanation of what's needed and why, not fabricated data.
class VioraInfoScreen extends StatelessWidget {
  const VioraInfoScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.headline,
    required this.body,
    this.requirements = const [],
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String headline;
  final String body;
  final List<String> requirements;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VioraSection(title: title, subtitle: subtitle),
          VioraCard(
            elevation: VioraElevation.raisedHigh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(color: neu.surfaceSunken, shape: BoxShape.circle),
                  child: Icon(icon, size: 24, color: neu.brand),
                ),
                const SizedBox(height: VioraSpacing.lg),
                Text(headline, style: textTheme.headlineSmall),
                const SizedBox(height: VioraSpacing.sm),
                Text(body, style: textTheme.bodyMedium?.copyWith(color: neu.textSecondary)),
                if (requirements.isNotEmpty) ...[
                  const SizedBox(height: VioraSpacing.xl),
                  Text('Needs before this can ship:', style: textTheme.labelMedium),
                  const SizedBox(height: VioraSpacing.sm),
                  for (final r in requirements)
                    Padding(
                      padding: const EdgeInsets.only(bottom: VioraSpacing.xs),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.circle, size: 5, color: neu.textTertiary),
                          const SizedBox(width: VioraSpacing.sm),
                          Expanded(child: Text(r, style: textTheme.bodySmall?.copyWith(color: neu.textSecondary))),
                        ],
                      ),
                    ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
