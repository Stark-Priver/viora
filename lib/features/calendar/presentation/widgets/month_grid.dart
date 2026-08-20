import 'package:flutter/material.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';

/// Classic 6x7 calendar grid. Cells outside the selected month are dimmed;
/// each cell shows up to 3 event dots plus an overflow count.
class MonthGrid extends StatelessWidget {
  const MonthGrid({super.key, required this.selectedDay, required this.events, required this.onSelectDay});

  final DateTime selectedDay;
  final List<CalendarEventRow> events;
  final ValueChanged<DateTime> onSelectDay;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;
    final firstOfMonth = DateTime(selectedDay.year, selectedDay.month, 1);
    final gridStart = firstOfMonth.subtract(Duration(days: firstOfMonth.weekday - 1));
    final today = DateTime.now();

    final eventsByDay = <DateTime, List<CalendarEventRow>>{};
    for (final e in events) {
      final key = DateTime(e.start.year, e.start.month, e.start.day);
      eventsByDay.putIfAbsent(key, () => []).add(e);
    }

    return Column(
      children: [
        Row(
          children: [
            for (final d in const ['M', 'T', 'W', 'T', 'F', 'S', 'S'])
              Expanded(
                child: Center(child: Text(d, style: textTheme.labelSmall)),
              ),
          ],
        ),
        const SizedBox(height: VioraSpacing.sm),
        for (var week = 0; week < 6; week++)
          Row(
            children: [
              for (var d = 0; d < 7; d++) ...[
                Builder(builder: (context) {
                  final day = gridStart.add(Duration(days: week * 7 + d));
                  final inMonth = day.month == selectedDay.month;
                  final isSelected = _sameDay(day, selectedDay);
                  final isToday = _sameDay(day, today);
                  final dayEvents = eventsByDay[DateTime(day.year, day.month, day.day)] ?? const [];

                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onSelectDay(day),
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: isSelected ? neu.brand : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: isToday && !isSelected ? Border.all(color: neu.brand, width: 1.5) : null,
                        ),
                        child: Column(
                          children: [
                            Text(
                              '${day.day}',
                              style: textTheme.bodyMedium?.copyWith(
                                color: isSelected ? Colors.white : (inMonth ? neu.textPrimary : neu.textTertiary),
                                fontWeight: isToday || isSelected ? FontWeight.w700 : FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 3),
                            SizedBox(
                              height: 6,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (final _ in dayEvents.take(3))
                                    Container(
                                      width: 4,
                                      height: 4,
                                      margin: const EdgeInsets.symmetric(horizontal: 1),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isSelected ? Colors.white70 : neu.brand,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ],
          ),
      ],
    );
  }
}

bool _sameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;
