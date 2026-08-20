import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';
import '../tokens/spacing.dart';
import 'viora_button.dart';

/// Shown instead of a blank list/dashboard — guides the user to the first
/// action rather than leaving them looking at nothing. Never skip this for
/// an empty collection.
class VioraEmptyState extends StatelessWidget {
  const VioraEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
  });

  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: VioraSpacing.xl6),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(color: neu.surfaceSunken, shape: BoxShape.circle),
              child: Icon(icon, size: 28, color: neu.textTertiary),
            ),
            const SizedBox(height: VioraSpacing.lg),
            Text(title, style: textTheme.titleMedium),
            const SizedBox(height: VioraSpacing.xs),
            Text(
              message,
              textAlign: TextAlign.center,
              style: textTheme.bodySmall?.copyWith(color: neu.textTertiary),
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: VioraSpacing.xl),
              VioraButton(label: actionLabel!, icon: Icons.add_rounded, onPressed: onAction),
            ],
          ],
        ),
      ),
    );
  }
}
