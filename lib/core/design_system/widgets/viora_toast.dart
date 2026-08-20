import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';
import '../tokens/spacing.dart';

/// Lightweight, on-brand snackbar wrapper — the only motion-triggered
/// surface in the system that's allowed to float above content.
class VioraToast {
  VioraToast._();

  static void show(BuildContext context, String message, {IconData icon = Icons.info_outline_rounded}) {
    final neu = context.neu;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: neu.textPrimary,
        elevation: 0,
        margin: const EdgeInsets.all(VioraSpacing.lg),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        content: Row(
          children: [
            Icon(icon, size: 18, color: neu.background),
            const SizedBox(width: VioraSpacing.sm),
            Expanded(
              child: Text(message, style: TextStyle(color: neu.background, fontWeight: FontWeight.w600, fontSize: 13)),
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
