import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';
import '../tokens/spacing.dart';
import 'viora_icon_button.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

/// Shared bottom-sheet chrome for every add/edit form in the app: a grab
/// handle, an icon-badged title with an explicit close affordance, and
/// scrollable content that respects the keyboard inset. Keeping this in
/// one place is what makes every form feel like part of the same product
/// instead of a one-off dialog per feature.
///
/// [icon]/[accentColor] are optional — pass them for the forms a user
/// reaches for constantly (tasks, goals, money, events) so the header
/// reads as "this belongs to a system," not required everywhere.
Future<T?> showVioraFormSheet<T>({
  required BuildContext context,
  required String title,
  required Widget Function(BuildContext context) builder,
  IconData? icon,
  Color? accentColor,
}) {
  final neu = context.neu;
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) {
      final accent = accentColor ?? neu.brand;
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(sheetContext).bottom),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Container(
              margin: const EdgeInsets.fromLTRB(VioraSpacing.md, 0, VioraSpacing.md, VioraSpacing.md),
              padding: const EdgeInsets.fromLTRB(VioraSpacing.xl2, VioraSpacing.md, VioraSpacing.xl2, VioraSpacing.xl2),
              decoration: BoxDecoration(
                color: neu.surface,
                borderRadius: BorderRadius.circular(28),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        margin: const EdgeInsets.only(bottom: VioraSpacing.lg),
                        decoration: BoxDecoration(color: neu.divider, borderRadius: BorderRadius.circular(2)),
                      ),
                    ),
                    Row(
                      children: [
                        if (icon != null) ...[
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(color: accent.withValues(alpha: 0.14), shape: BoxShape.circle),
                            child: Icon(icon, size: 19, color: accent),
                          ),
                          const SizedBox(width: VioraSpacing.md),
                        ],
                        Expanded(child: Text(title, style: Theme.of(sheetContext).textTheme.headlineSmall)),
                        VioraIconButton(
                          icon: IconsaxPlusBroken.close_circle,
                          size: 34,
                          tooltip: 'Close',
                          onPressed: () => Navigator.of(sheetContext).pop(),
                        ),
                      ],
                    ),
                    const SizedBox(height: VioraSpacing.xl),
                    builder(sheetContext),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
