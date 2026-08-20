import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/tables.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_button.dart';
import '../../../../core/design_system/widgets/viora_chip.dart';
import '../../../../core/design_system/widgets/viora_input.dart';
import '../providers/calendar_providers.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class EventForm extends ConsumerStatefulWidget {
  const EventForm({super.key, required this.day});
  final DateTime day;

  @override
  ConsumerState<EventForm> createState() => _EventFormState();
}

const _reminderOptions = <int?>[null, 10, 30, 60];

class _EventFormState extends ConsumerState<EventForm> {
  final _title = TextEditingController();
  TimeOfDay _start = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _end = const TimeOfDay(hour: 10, minute: 0);
  String _recurrence = RecurrenceRules.none;
  int? _reminderMinutesBefore;

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  Future<void> _pickTime(bool isStart) async {
    final picked = await showTimePicker(context: context, initialTime: isStart ? _start : _end);
    if (picked == null) return;
    setState(() => isStart ? _start = picked : _end = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VioraInput(controller: _title, label: 'Event', hint: 'e.g. Software Engineering Study', autofocus: true),
        const SizedBox(height: VioraSpacing.lg),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Start', style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: VioraSpacing.sm),
                  VioraChip(label: _start.format(context), icon: IconsaxPlusBroken.clock, onTap: () => _pickTime(true)),
                ],
              ),
            ),
            const SizedBox(width: VioraSpacing.lg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('End', style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: VioraSpacing.sm),
                  VioraChip(label: _end.format(context), icon: IconsaxPlusBroken.clock, onTap: () => _pickTime(false)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: VioraSpacing.lg),
        Text('Repeat', style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: VioraSpacing.sm),
        Wrap(
          spacing: VioraSpacing.sm,
          children: [
            for (final r in RecurrenceRules.all)
              VioraChip(
                label: r == RecurrenceRules.none ? "Doesn't repeat" : r,
                selected: _recurrence == r,
                onTap: () => setState(() => _recurrence = r),
              ),
          ],
        ),
        const SizedBox(height: VioraSpacing.lg),
        Text('Reminder', style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: VioraSpacing.sm),
        Wrap(
          spacing: VioraSpacing.sm,
          children: [
            for (final m in _reminderOptions)
              VioraChip(
                label: m == null ? 'None' : '$m min before',
                icon: m == null ? null : IconsaxPlusBroken.notification,
                selected: _reminderMinutesBefore == m,
                onTap: () => setState(() => _reminderMinutesBefore = m),
              ),
          ],
        ),
        const SizedBox(height: VioraSpacing.xl2),
        VioraButton(
          label: 'Add event',
          icon: IconsaxPlusBroken.calendar,
          expand: true,
          onPressed: () {
            final title = _title.text.trim();
            if (title.isEmpty) return;
            final start = DateTime(widget.day.year, widget.day.month, widget.day.day, _start.hour, _start.minute);
            var end = DateTime(widget.day.year, widget.day.month, widget.day.day, _end.hour, _end.minute);
            if (!end.isAfter(start)) end = start.add(const Duration(hours: 1));
            ref.read(calendarActionsProvider).add(
                  EventDraft(title: title, start: start, end: end, recurrence: _recurrence, reminderMinutesBefore: _reminderMinutesBefore),
                );
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
