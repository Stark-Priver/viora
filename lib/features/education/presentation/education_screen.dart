import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_button.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_empty_state.dart';
import '../../../core/design_system/widgets/viora_form_sheet.dart';
import '../../../core/design_system/widgets/viora_icon_button.dart';
import '../../../core/design_system/widgets/viora_input.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/design_system/widgets/viora_stat.dart';
import 'providers/education_providers.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class EducationScreen extends ConsumerWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(studySessionsProvider);
    final actions = ref.read(educationActionsProvider);

    void openAddForm() => showVioraFormSheet(context: context, title: 'Log study session', icon: IconsaxPlusBroken.teacher, accentColor: context.neu.domainStudy, builder: (_) => const _StudySessionForm());

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VioraSection(
            title: 'Education',
            subtitle: 'Study time, tracked',
            trailing: VioraButton(label: 'Log', icon: IconsaxPlusBold.add, onPressed: openAddForm),
          ),
          sessionsAsync.when(
            data: (sessions) {
              final now = DateTime.now();
              final weekStart = DateTime(now.year, now.month, now.day).subtract(Duration(days: now.weekday - 1));
              final weekMinutes = sessions.where((s) => s.date.isAfter(weekStart)).fold<int>(0, (sum, s) => sum + s.minutes);
              final totalMinutes = sessions.fold<int>(0, (sum, s) => sum + s.minutes);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VioraCard(
                    orbColors: [context.neu.domainStudy, context.neu.brand],
                    child: Row(
                      children: [
                        Expanded(
                          child: VioraStat(
                            label: 'This week',
                            value: weekMinutes.toDouble(),
                            formatter: (v) => '${v ~/ 60}h ${(v % 60).round()}m',
                            icon: IconsaxPlusBroken.teacher,
                            metricSize: 22,
                          ),
                        ),
                        Expanded(
                          child: VioraStat(
                            label: 'All time',
                            value: totalMinutes.toDouble(),
                            formatter: (v) => '${v ~/ 60}h ${(v % 60).round()}m',
                            icon: IconsaxPlusBroken.book_saved,
                            metricSize: 22,
                          ),
                        ),
                        Expanded(
                          child: VioraStat(
                            label: 'Sessions',
                            value: sessions.length.toDouble(),
                            formatter: (v) => v.toInt().toString(),
                            icon: IconsaxPlusBroken.calendar_1,
                            metricSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: VioraSpacing.xl2),
                  if (sessions.isEmpty)
                    VioraEmptyState(
                      icon: IconsaxPlusBroken.teacher,
                      title: 'No study sessions yet',
                      message: 'Log time spent studying a subject.',
                      actionLabel: 'Log session',
                      onAction: openAddForm,
                    )
                  else
                    for (final s in sessions)
                      Padding(
                        padding: const EdgeInsets.only(bottom: VioraSpacing.md),
                        child: VioraCard(
                          padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.lg, vertical: VioraSpacing.lg),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(s.subject, style: Theme.of(context).textTheme.bodyLarge),
                                    Text(
                                      '${s.topic != null ? '${s.topic} · ' : ''}${DateFormat('d MMM').format(s.date)}',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              Text('${s.minutes}m', style: Theme.of(context).textTheme.titleMedium),
                              VioraIconButton(icon: IconsaxPlusBroken.trash, size: 32, tooltip: 'Delete', onPressed: () => actions.delete(s.id)),
                            ],
                          ),
                        ),
                      ),
                ],
              );
            },
            loading: () => const Padding(padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl4), child: Center(child: CircularProgressIndicator())),
            error: (e, st) => Text('Failed to load sessions: $e'),
          ),
        ],
      ),
    );
  }
}

class _StudySessionForm extends ConsumerStatefulWidget {
  const _StudySessionForm();

  @override
  ConsumerState<_StudySessionForm> createState() => _StudySessionFormState();
}

class _StudySessionFormState extends ConsumerState<_StudySessionForm> {
  final _subject = TextEditingController();
  final _topic = TextEditingController();
  final _minutes = TextEditingController();

  @override
  void dispose() {
    _subject.dispose();
    _topic.dispose();
    _minutes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VioraInput(controller: _subject, label: 'Subject', hint: 'e.g. Software Engineering', autofocus: true),
        const SizedBox(height: VioraSpacing.lg),
        VioraInput(controller: _topic, label: 'Topic', hint: 'Optional'),
        const SizedBox(height: VioraSpacing.lg),
        VioraInput(controller: _minutes, label: 'Minutes', hint: '60', keyboardType: TextInputType.number),
        const SizedBox(height: VioraSpacing.xl2),
        VioraButton(
          label: 'Log session',
          icon: IconsaxPlusBroken.teacher,
          expand: true,
          onPressed: () {
            final subject = _subject.text.trim();
            final minutes = int.tryParse(_minutes.text.trim());
            if (subject.isEmpty || minutes == null || minutes <= 0) return;
            ref.read(educationActionsProvider).add(StudySessionDraft(subject: subject, topic: _topic.text.trim().isEmpty ? null : _topic.text.trim(), minutes: minutes));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
