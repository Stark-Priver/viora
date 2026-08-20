import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_empty_state.dart';
import '../../../core/design_system/widgets/viora_icon_button.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import 'providers/timeline_providers.dart';
import 'widgets/timeline_tile.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class TimelineScreen extends ConsumerWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final day = ref.watch(timelineSelectedDayProvider);
    final entries = ref.watch(timelineEntriesProvider);
    final today = DateTime.now();
    final isToday = day.year == today.year && day.month == today.month && day.day == today.day;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const VioraSection(title: 'Timeline', subtitle: 'Everything that happened, in order'),
          VioraCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VioraIconButton(
                  icon: IconsaxPlusBroken.arrow_left_2,
                  onPressed: () => ref.read(timelineSelectedDayProvider.notifier).state = day.subtract(const Duration(days: 1)),
                ),
                Text(
                  isToday ? 'Today · ${DateFormat('d MMM').format(day)}' : DateFormat('EEEE, d MMMM').format(day),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                VioraIconButton(
                  icon: IconsaxPlusBroken.arrow_right_2,
                  onPressed: () => ref.read(timelineSelectedDayProvider.notifier).state = day.add(const Duration(days: 1)),
                ),
              ],
            ),
          ),
          const SizedBox(height: VioraSpacing.xl2),
          if (entries.isEmpty)
            const VioraEmptyState(
              icon: IconsaxPlusBroken.activity,
              title: 'Nothing logged yet',
              message: 'Completed tasks, focus sessions, transactions, habits, and calendar events for this day will show up here automatically.',
            )
          else
            for (var i = 0; i < entries.length; i++) TimelineTile(entry: entries[i], isLast: i == entries.length - 1),
        ],
      ),
    );
  }
}
