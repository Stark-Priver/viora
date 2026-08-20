import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';
import '../tokens/spacing.dart';
import 'viora_surface.dart';

/// Recessed text input — the "inset" counterpart to raised surfaces.
class VioraInput extends StatelessWidget {
  const VioraInput({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.maxLines = 1,
    this.keyboardType,
    this.prefixText,
    this.autofocus = false,
    this.obscureText = false,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? prefixText;
  final bool autofocus;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(label!, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: VioraSpacing.xs),
        ],
        VioraSurface(
          elevation: VioraElevation.inset,
          borderRadius: 14,
          padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.lg, vertical: VioraSpacing.sm + 2),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            keyboardType: keyboardType,
            autofocus: autofocus,
            obscureText: obscureText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: neu.textPrimary),
            cursorColor: neu.brand,
            decoration: InputDecoration(
              hintText: hint,
              prefixText: prefixText,
              border: InputBorder.none,
              isDense: true,
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: neu.textTertiary),
            ),
          ),
        ),
      ],
    );
  }
}
