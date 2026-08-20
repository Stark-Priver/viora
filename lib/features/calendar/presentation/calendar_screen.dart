import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/database/app_database.dart';
import '../../../core/database/tables.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_button.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_chip.dart';
import '../../../core/design_system/widgets/viora_empty_state.dart';
import '../../../core/design_system/widgets/viora_form_sheet.dart';
import '../../../core/design_system/widgets/viora_icon_button.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/design_system/widgets/viora_surface.dart';
import 'providers/calendar_providers.dart';
import 'widgets/event_form.dart';
import 'widgets/month_grid.dart';
import 'widgets/week_grid.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayProvider);
    final viewMode = ref.watch(calendarViewModeProvider);
    void selectDay(DateTime d) => ref.read(selectedDayProvider.notifier).state = d;

    void openAddForm() => showVioraFormSheet(context: context, title: 'New event', icon: IconsaxPlusBroken.calendar, accentColor: context.neu.brand, builder: (_) => EventForm(day: selectedDay));

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VioraSection(
            title: 'Calendar',
            subtitle: DateFormat('MMMM yyyy').format(selectedDay),
            trailing: VioraButton(label: 'Add', icon: IconsaxPlusBold.add, onPressed: openAddForm),
          ),
          Wrap(
            spacing: VioraSpacing.sm,
            children: [
              for (final mode in CalendarViewMode.values)
                VioraChip(
                  label: switch (mode) { CalendarViewMode.day => 'Day', CalendarViewMode.week => 'Week', CalendarViewMode.month => 'Month' },
                  selected: viewMode == mode,
                  onTap: () => ref.read(calendarViewModeProvider.notifier).state = mode,
                ),
            ],
          ),
          const SizedBox(height: VioraSpacing.lg),
          switch (viewMode) {
            CalendarViewMode.day => _DayView(selectedDay: selectedDay, onSelectDay: selectDay, onAdd: openAddForm),
            CalendarViewMode.week => _WeekView(selectedDay: selectedDay, onSelectDay: selectDay),
            CalendarViewMode.month => _MonthView(selectedDay: selectedDay, onSelectDay: selectDay),
          },
        ],
      ),
    );
  }
}

class _DayView extends ConsumerWidget {
  const _DayView({required this.selectedDay, required this.onSelectDay, required this.onAdd});
  final DateTime selectedDay;
  final ValueChanged<DateTime> onSelectDay;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(dayEventsStreamProvider);
    final actions = ref.read(calendarActionsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _WeekStrip(selectedDay: selectedDay, onSelect: onSelectDay),
        const SizedBox(height: VioraSpacing.xl2),
        eventsAsync.when(
          data: (events) {
            if (events.isEmpty) {
              return VioraEmptyState(
                icon: IconsaxPlusBroken.calendar_1,
                title: 'Nothing scheduled',
                message: 'Add an event to plan this day.',
                actionLabel: 'Add event',
                onAction: onAdd,
              );
            }
            return Column(
              children: [
                for (final e in events)
                  Padding(
                    padding: const EdgeInsets.only(bottom: VioraSpacing.md),
                    child: VioraCard(
                      padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.lg, vertical: VioraSpacing.md),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 56,
                            child: Text(DateFormat('HH:mm').format(e.start), style: Theme.of(context).textTheme.titleMedium),
                          ),
                          Container(width: 3, height: 32, color: context.neu.brand, margin: const EdgeInsets.symmetric(horizontal: VioraSpacing.md)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Flexible(child: Text(e.title, style: Theme.of(context).textTheme.bodyLarge, overflow: TextOverflow.ellipsis)),
                                    if (e.recurrence != RecurrenceRules.none) ...[
                                      const SizedBox(width: VioraSpacing.xs),
                                      Icon(IconsaxPlusBroken.repeat, size: 14, color: context.neu.textTertiary),
                                    ],
                                    if (e.reminderMinutesBefore != null) ...[
                                      const SizedBox(width: VioraSpacing.xs),
                                      Icon(IconsaxPlusBroken.notification, size: 14, color: context.neu.textTertiary),
                                    ],
                                  ],
                                ),
                                Text(
                                  '${DateFormat('HH:mm').format(e.start)} – ${DateFormat('HH:mm').format(e.end)}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          VioraIconButton(
                            icon: IconsaxPlusBroken.trash,
                            size: 32,
                            tooltip: 'Delete',
                            onPressed: () => _confirmDelete(context, ref, actions, e),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl4),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, st) => Text('Failed to load events: $e'),
        ),
      ],
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, CalendarActions actions, CalendarEventRow event) async {
    if (event.recurrenceGroupId == null) {
      await actions.delete(event);
      return;
    }
    final deleteAll = await showModalBottomSheet<bool>(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(title: const Text('Delete this event only'), onTap: () => Navigator.of(sheetContext).pop(false)),
            ListTile(title: const Text('Delete all future occurrences'), onTap: () => Navigator.of(sheetContext).pop(true)),
          ],
        ),
      ),
    );
    if (deleteAll == null) return;
    if (deleteAll) {
      await actions.deleteSeries(event.recurrenceGroupId!);
    } else {
      await actions.delete(event);
    }
  }
}

class _WeekView extends ConsumerWidget {
  const _WeekView({required this.selectedDay, required this.onSelectDay});
  final DateTime selectedDay;
  final ValueChanged<DateTime> onSelectDay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(weekEventsStreamProvider);
    return eventsAsync.when(
      data: (events) => WeekGrid(selectedDay: selectedDay, events: events, onSelectDay: onSelectDay),
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl4),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, st) => Text('Failed to load week: $e'),
    );
  }
}

class _MonthView extends ConsumerWidget {
  const _MonthView({required this.selectedDay, required this.onSelectDay});
  final DateTime selectedDay;
  final ValueChanged<DateTime> onSelectDay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(monthEventsStreamProvider);
    return eventsAsync.when(
      data: (events) => MonthGrid(selectedDay: selectedDay, events: events, onSelectDay: onSelectDay),
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl4),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, st) => Text('Failed to load month: $e'),
    );
  }
}

class _WeekStrip extends StatelessWidget {
  const _WeekStrip({required this.selectedDay, required this.onSelect});
  final DateTime selectedDay;
  final ValueChanged<DateTime> onSelect;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final startOfWeek = selectedDay.subtract(Duration(days: selectedDay.weekday - 1));

    return SizedBox(
      height: 74,
      child: Row(
        children: List.generate(7, (i) {
          final day = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day).add(Duration(days: i));
          final isSelected = day.year == selectedDay.year && day.month == selectedDay.month && day.day == selectedDay.day;
          final isToday = day.year == today.year && day.month == today.month && day.day == today.day;
          final neu = context.neu;

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: VioraSurface(
                elevation: isSelected ? VioraElevation.raisedHigh : VioraElevation.flat,
                borderRadius: 16,
                onTap: () => onSelect(day),
                color: isSelected ? neu.brand : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: VioraSpacing.sm),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('E').format(day).substring(0, 1),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: isSelected ? Colors.white70 : neu.textTertiary),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${day.day}',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: isSelected ? Colors.white : (isToday ? neu.brand : neu.textPrimary),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
