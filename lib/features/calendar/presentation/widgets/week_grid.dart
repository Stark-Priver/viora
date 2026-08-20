import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';

const _startHour = 6;
const _endHour = 23;
const _hourHeight = 56.0;
const _dayColumnWidth = 128.0;
const _timeAxisWidth = 44.0;

/// Hour-by-hour week timetable — the "proper" scheduler view. Time axis on
/// the left is fixed; the seven day columns scroll horizontally as a unit
/// so this stays usable on a phone-width screen.
class WeekGrid extends StatelessWidget {
  const WeekGrid({super.key, required this.selectedDay, required this.events, required this.onSelectDay});

  final DateTime selectedDay;
  final List<CalendarEventRow> events;
  final ValueChanged<DateTime> onSelectDay;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;
    final weekStart = DateTime(selectedDay.year, selectedDay.month, selectedDay.day)
        .subtract(Duration(days: selectedDay.weekday - 1));
    final today = DateTime.now();
    final hours = _endHour - _startHour;
    final gridHeight = hours * _hourHeight;

    return SizedBox(
      height: gridHeight + 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: _timeAxisWidth,
            child: Column(
              children: [
                const SizedBox(height: 40),
                for (var h = _startHour; h < _endHour; h++)
                  SizedBox(
                    height: _hourHeight,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text('$h:00', style: textTheme.labelSmall),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var d = 0; d < 7; d++)
                    Builder(builder: (context) {
                      final day = weekStart.add(Duration(days: d));
                      final isSelected = _sameDay(day, selectedDay);
                      final isToday = _sameDay(day, today);
                      final dayEvents = events.where((e) => _sameDay(e.start, day)).toList();

                      return GestureDetector(
                        onTap: () => onSelectDay(day),
                        child: SizedBox(
                          width: _dayColumnWidth,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 3),
                                  decoration: BoxDecoration(
                                    color: isSelected ? neu.brand : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                    border: isToday && !isSelected ? Border.all(color: neu.brand, width: 1.5) : null,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(DateFormat('E').format(day).substring(0, 1),
                                          style: textTheme.labelSmall?.copyWith(color: isSelected ? Colors.white70 : neu.textTertiary)),
                                      Text('${day.day}',
                                          style: textTheme.bodyMedium?.copyWith(
                                            color: isSelected ? Colors.white : neu.textPrimary,
                                            fontWeight: FontWeight.w700,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: gridHeight,
                                child: Stack(
                                  children: [
                                    for (var h = 0; h <= hours; h++)
                                      Positioned(
                                        top: h * _hourHeight,
                                        left: 0,
                                        right: 0,
                                        child: Divider(height: 1, color: neu.divider),
                                      ),
                                    for (final e in dayEvents) _EventBlock(event: e),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EventBlock extends StatelessWidget {
  const _EventBlock({required this.event});
  final CalendarEventRow event;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final startOffset = (event.start.hour - _startHour) + event.start.minute / 60.0;
    final durationHours = event.end.difference(event.start).inMinutes / 60.0;
    final top = (startOffset.clamp(0, 24)) * _hourHeight;
    final height = (durationHours * _hourHeight).clamp(20.0, double.infinity);

    return Positioned(
      top: top,
      left: 3,
      right: 3,
      height: height,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(color: neu.brand.withValues(alpha: 0.85), borderRadius: BorderRadius.circular(8)),
        child: Text(
          event.title,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

bool _sameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;
