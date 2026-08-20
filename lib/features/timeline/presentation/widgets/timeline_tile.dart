import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../domain/timeline_entry.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

(IconData, Color) _iconAndColor(VioraNeuTheme neu, TimelineKind kind) {
  return switch (kind) {
    TimelineKind.task => (IconsaxPlusBroken.tick_circle, neu.success),
    TimelineKind.focus => (IconsaxPlusBroken.scan, neu.domainWork),
    TimelineKind.transactionIncome => (IconsaxPlusBroken.trend_down, neu.success),
    TimelineKind.transactionExpense => (IconsaxPlusBroken.trend_up, neu.domainFinance),
    TimelineKind.habit => (IconsaxPlusBroken.repeat, neu.domainHealth),
    TimelineKind.journal => (IconsaxPlusBroken.book_1, neu.domainStudy),
    TimelineKind.calendarEvent => (IconsaxPlusBroken.calendar, neu.brand),
  };
}

class TimelineTile extends StatelessWidget {
  const TimelineTile({super.key, required this.entry, required this.isLast});

  final TimelineEntry entry;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;
    final (icon, color) = _iconAndColor(neu, entry.kind);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 52,
            child: Text(DateFormat('HH:mm').format(entry.time), style: textTheme.labelMedium, textAlign: TextAlign.right),
          ),
          const SizedBox(width: VioraSpacing.md),
          Column(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(color: color.withValues(alpha: 0.14), shape: BoxShape.circle),
                child: Icon(icon, size: 15, color: color),
              ),
              if (!isLast) Expanded(child: Container(width: 2, color: neu.divider)),
            ],
          ),
          const SizedBox(width: VioraSpacing.md),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: VioraSpacing.xl2, top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(entry.title, style: textTheme.bodyLarge),
                  if (entry.subtitle != null && entry.subtitle!.isNotEmpty)
                    Text(entry.subtitle!, style: textTheme.bodySmall?.copyWith(color: neu.textSecondary)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
