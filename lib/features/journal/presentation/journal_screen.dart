import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_button.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_icon_button.dart';
import '../../../core/design_system/widgets/viora_input.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/design_system/widgets/viora_toast.dart';
import 'providers/journal_providers.dart';

class JournalScreen extends ConsumerStatefulWidget {
  const JournalScreen({super.key});

  @override
  ConsumerState<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends ConsumerState<JournalScreen> {
  final _win = TextEditingController();
  final _problem = TextEditingController();
  final _lesson = TextEditingController();
  final _gratitude = TextEditingController();
  final _priority = TextEditingController();
  String? _entryId;
  DateTime? _loadedForDay;

  @override
  void dispose() {
    _win.dispose();
    _problem.dispose();
    _lesson.dispose();
    _gratitude.dispose();
    _priority.dispose();
    super.dispose();
  }

  void _populate(DateTime day, {String? id, String? win, String? problem, String? lesson, String? gratitude, String? priority}) {
    _entryId = id;
    _loadedForDay = day;
    _win.text = win ?? '';
    _problem.text = problem ?? '';
    _lesson.text = lesson ?? '';
    _gratitude.text = gratitude ?? '';
    _priority.text = priority ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final day = ref.watch(journalSelectedDayProvider);
    final entryAsync = ref.watch(journalEntryForDayProvider);

    if (_loadedForDay != day && entryAsync.hasValue) {
      final entry = entryAsync.value;
      if (entry == null) {
        _populate(day);
      } else {
        _populate(day, id: entry.id, win: entry.win, problem: entry.problem, lesson: entry.lesson, gratitude: entry.gratitude, priority: entry.priorityTomorrow);
      }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VioraSection(title: 'Journal', subtitle: 'A daily record, in your own words'),
          VioraCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VioraIconButton(
                  icon: Icons.chevron_left_rounded,
                  onPressed: () => ref.read(journalSelectedDayProvider.notifier).state = day.subtract(const Duration(days: 1)),
                ),
                Text(DateFormat('EEEE, d MMMM').format(day), style: Theme.of(context).textTheme.titleMedium),
                VioraIconButton(
                  icon: Icons.chevron_right_rounded,
                  onPressed: () => ref.read(journalSelectedDayProvider.notifier).state = day.add(const Duration(days: 1)),
                ),
              ],
            ),
          ),
          const SizedBox(height: VioraSpacing.xl2),
          VioraInput(controller: _win, label: 'Biggest win', hint: 'What went well today?', maxLines: 2),
          const SizedBox(height: VioraSpacing.lg),
          VioraInput(controller: _problem, label: 'Biggest problem', hint: 'What got in the way?', maxLines: 2),
          const SizedBox(height: VioraSpacing.lg),
          VioraInput(controller: _lesson, label: 'What I learned', maxLines: 2),
          const SizedBox(height: VioraSpacing.lg),
          VioraInput(controller: _gratitude, label: 'Grateful for', maxLines: 2),
          const SizedBox(height: VioraSpacing.lg),
          VioraInput(controller: _priority, label: "Tomorrow's priority", maxLines: 2),
          const SizedBox(height: VioraSpacing.xl2),
          VioraButton(
            label: 'Save entry',
            icon: Icons.check_rounded,
            expand: true,
            onPressed: () {
              ref.read(journalActionsProvider).save(
                    day: day,
                    existingId: _entryId,
                    win: _win.text.trim().isEmpty ? null : _win.text.trim(),
                    problem: _problem.text.trim().isEmpty ? null : _problem.text.trim(),
                    lesson: _lesson.text.trim().isEmpty ? null : _lesson.text.trim(),
                    gratitude: _gratitude.text.trim().isEmpty ? null : _gratitude.text.trim(),
                    priorityTomorrow: _priority.text.trim().isEmpty ? null : _priority.text.trim(),
                  );
              VioraToast.show(context, 'Entry saved.', icon: Icons.check_circle_outline_rounded);
            },
          ),
        ],
      ),
    );
  }
}
