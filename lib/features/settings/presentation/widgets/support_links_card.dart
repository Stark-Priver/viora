import 'package:flutter/material.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_card.dart';
import '../../../../core/services/external_links.dart';

class SupportLinksCard extends StatelessWidget {
  const SupportLinksCard({super.key});

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;

    return VioraCard(
      orbColors: [neu.brand, neu.domainStudy],
      padding: const EdgeInsets.symmetric(vertical: VioraSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(VioraSpacing.xl, 0, VioraSpacing.xl, VioraSpacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Support Viora', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: VioraSpacing.xs),
                Text(
                  'Built by Stark-Priver. If Viora is useful to you, a follow or a coffee goes a long way.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: neu.textSecondary),
                ),
              ],
            ),
          ),
          _LinkRow(
            icon: Icons.coffee_outlined,
            iconColor: neu.warning,
            label: 'Buy me a coffee',
            subtitle: 'buymeacoffee.com/depriver',
            onTap: () => ExternalLinks.open(ExternalLinks.buyMeACoffee),
          ),
          _LinkRow(
            icon: Icons.code_rounded,
            iconColor: neu.textPrimary,
            label: 'Follow on GitHub',
            subtitle: 'github.com/Stark-Priver',
            onTap: () => ExternalLinks.open(ExternalLinks.github),
          ),
          _LinkRow(
            icon: Icons.smart_display_outlined,
            iconColor: neu.danger,
            label: 'Subscribe on YouTube',
            subtitle: 'youtube.com/@de_priver',
            onTap: () => ExternalLinks.open(ExternalLinks.youtube),
          ),
          _LinkRow(
            icon: Icons.star_border_rounded,
            iconColor: neu.brand,
            label: 'Star the repo',
            subtitle: 'github.com/Stark-Priver/viora',
            onTap: () => ExternalLinks.open(ExternalLinks.repo),
          ),
        ],
      ),
    );
  }
}

class _LinkRow extends StatelessWidget {
  const _LinkRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.xl, vertical: VioraSpacing.sm),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.14), shape: BoxShape.circle),
              child: Icon(icon, size: 18, color: iconColor),
            ),
            const SizedBox(width: VioraSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(label, style: Theme.of(context).textTheme.bodyLarge),
                  Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: neu.textTertiary)),
                ],
              ),
            ),
            Icon(Icons.arrow_outward_rounded, size: 16, color: neu.textTertiary),
          ],
        ),
      ),
    );
  }
}
