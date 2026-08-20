import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';
import '../tokens/spacing.dart';

/// Section header used to break up a dashboard/screen into named groups,
/// with an optional trailing action ("See all", a filter chip, etc).
class VioraSection extends StatelessWidget {
  const VioraSection({super.key, required this.title, this.trailing, this.subtitle});

  final String title;
  final String? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: VioraSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textTheme.titleLarge),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(subtitle!, style: textTheme.bodySmall?.copyWith(color: neu.textTertiary)),
                  ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
