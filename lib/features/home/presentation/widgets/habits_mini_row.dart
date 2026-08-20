import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_card.dart';
import '../../../../core/design_system/widgets/viora_section.dart';
import '../../../habits/presentation/providers/habits_providers.dart';

/// Today's habit checklist, condensed to a single row of dots — the full
/// 7-day history lives on the Habits screen; Home only needs "did I do
/// this yet today."
class HabitsMiniRow extends ConsumerWidget {
  const HabitsMiniRow({super.key, required this.onSeeAll});

  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitsStreamProvider).valueOrNull ?? const [];
    final logs = ref.watch(habitLogsStreamProvider).valueOrNull ?? const [];
    final actions = ref.read(habitsActionsProvider);
    final today = DateTime.now();
    bool doneToday(String habitId) => logs.any((l) => l.habitId == habitId && l.completed && _sameDay(l.date, today));

    if (habits.isEmpty) return const SizedBox.shrink();

    final doneCount = habits.where((h) => doneToday(h.id)).length;

    return VioraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VioraSection(
            title: 'Habits',
            subtitle: '$doneCount / ${habits.length} today',
            trailing: TextButton(onPressed: onSeeAll, child: const Text('See all')),
          ),
          Wrap(
            spacing: VioraSpacing.md,
            runSpacing: VioraSpacing.md,
            children: [
              for (final h in habits)
                _HabitDot(
                  label: h.title,
                  done: doneToday(h.id),
                  onTap: () => actions.toggleToday(h.id),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

bool _sameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;

class _HabitDot extends StatelessWidget {
  const _HabitDot({required this.label, required this.done, required this.onTap});
  final String label;
  final bool done;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TweenAnimationBuilder<double>(
            key: ValueKey(done),
            tween: Tween(begin: done ? 0.55 : 1.0, end: 1.0),
            duration: const Duration(milliseconds: 380),
            curve: Curves.elasticOut,
            builder: (context, scale, child) => Transform.scale(scale: scale, child: child),
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: done ? neu.success : neu.surfaceSunken,
                shape: BoxShape.circle,
              ),
              child: done ? const Icon(Icons.check_rounded, size: 17, color: Colors.white) : null,
            ),
          ),
          const SizedBox(height: VioraSpacing.xs),
          SizedBox(
            width: 56,
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
