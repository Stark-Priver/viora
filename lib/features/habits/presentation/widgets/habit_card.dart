import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_card.dart';
import '../../../../core/design_system/widgets/viora_icon_button.dart';

class HabitCard extends StatelessWidget {
  const HabitCard({
    super.key,
    required this.habit,
    required this.logsByDay,
    required this.onToggleToday,
    required this.onArchive,
  });

  final HabitRow habit;

  /// Completion for the last 7 days, oldest first, index 6 = today.
  final List<bool> logsByDay;
  final VoidCallback onToggleToday;
  final VoidCallback onArchive;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;
    final today = DateTime.now();

    return VioraCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(habit.title, style: textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: VioraSpacing.md),
                Row(
                  children: List.generate(7, (i) {
                    final day = today.subtract(Duration(days: 6 - i));
                    final done = logsByDay[i];
                    final isToday = i == 6;
                    return Padding(
                      padding: const EdgeInsets.only(right: VioraSpacing.sm),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: isToday ? onToggleToday : null,
                            child: TweenAnimationBuilder<double>(
                              key: ValueKey(isToday && done),
                              tween: Tween(begin: (isToday && done) ? 0.55 : 1.0, end: 1.0),
                              duration: const Duration(milliseconds: 380),
                              curve: Curves.elasticOut,
                              builder: (context, scale, child) => Transform.scale(scale: scale, child: child),
                              child: Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: done ? neu.success : neu.surfaceSunken,
                                  border: isToday ? Border.all(color: neu.brand, width: 2) : null,
                                ),
                                child: done ? const Icon(Icons.check_rounded, size: 14, color: Colors.white) : null,
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(DateFormat('E').format(day).substring(0, 1), style: textTheme.labelSmall),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          VioraIconButton(icon: Icons.archive_outlined, size: 34, tooltip: 'Archive', onPressed: onArchive),
        ],
      ),
    );
  }
}
