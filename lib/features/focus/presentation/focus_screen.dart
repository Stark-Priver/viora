import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/tokens/typography.dart';
import '../../../core/design_system/widgets/viora_button.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_chip.dart';
import '../../../core/design_system/widgets/viora_empty_state.dart';
import '../../../core/design_system/widgets/viora_icon_button.dart';
import '../../../core/design_system/widgets/viora_input.dart';
import '../../../core/design_system/widgets/viora_progress_ring.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/design_system/widgets/viora_surface.dart';
import 'providers/focus_providers.dart';

String _fmtElapsed(Duration d) {
  final h = d.inHours.toString().padLeft(2, '0');
  final m = (d.inMinutes % 60).toString().padLeft(2, '0');
  final s = (d.inSeconds % 60).toString().padLeft(2, '0');
  return '$h:$m:$s';
}

class FocusScreen extends ConsumerWidget {
  const FocusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(focusSessionProvider);
    final recentAsync = ref.watch(recentSessionsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VioraSection(title: 'Focus', subtitle: 'One task, uninterrupted'),
          session == null ? const _StartFocusCard() : _ActiveFocusCard(session: session),
          const SizedBox(height: VioraSpacing.xl2),
          const VioraSection(title: 'Recent sessions'),
          recentAsync.when(
            data: (sessions) {
              if (sessions.isEmpty) {
                return const VioraEmptyState(
                  icon: Icons.center_focus_strong_rounded,
                  title: 'No sessions yet',
                  message: 'Start your first focus session above.',
                );
              }
              return Column(
                children: [
                  for (final s in sessions.take(10))
                    Padding(
                      padding: const EdgeInsets.only(bottom: VioraSpacing.sm),
                      child: VioraCard(
                        padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.lg, vertical: VioraSpacing.md),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(s.title, style: Theme.of(context).textTheme.bodyLarge, maxLines: 1, overflow: TextOverflow.ellipsis),
                                  Text(DateFormat('EEE d MMM, HH:mm').format(s.startedAt), style: Theme.of(context).textTheme.bodySmall),
                                ],
                              ),
                            ),
                            Text(
                              s.focusedMinutes != null ? '${s.focusedMinutes}m' : 'active',
                              style: Theme.of(context).textTheme.titleMedium,
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
            error: (e, st) => Text('Failed to load sessions: $e'),
          ),
        ],
      ),
    );
  }
}

class _StartFocusCard extends ConsumerStatefulWidget {
  const _StartFocusCard();

  @override
  ConsumerState<_StartFocusCard> createState() => _StartFocusCardState();
}

class _StartFocusCardState extends ConsumerState<_StartFocusCard> {
  final _title = TextEditingController();
  int _minutes = 25;

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VioraCard(
      elevation: VioraElevation.raisedHigh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VioraInput(controller: _title, label: 'What are you focusing on?', hint: 'e.g. ROHI Development'),
          const SizedBox(height: VioraSpacing.lg),
          Text('Duration', style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: VioraSpacing.sm),
          Wrap(
            spacing: VioraSpacing.sm,
            children: [
              for (final m in [25, 50, 90])
                VioraChip(label: '${m}m', selected: _minutes == m, onTap: () => setState(() => _minutes = m)),
            ],
          ),
          const SizedBox(height: VioraSpacing.xl),
          VioraButton(
            label: 'Start focus session',
            icon: Icons.play_arrow_rounded,
            expand: true,
            onPressed: () {
              final title = _title.text.trim();
              ref.read(focusSessionProvider.notifier).start(title: title.isEmpty ? 'Focus session' : title, plannedMinutes: _minutes);
            },
          ),
        ],
      ),
    );
  }
}

class _ActiveFocusCard extends ConsumerWidget {
  const _ActiveFocusCard({required this.session});
  final ActiveFocusSession session;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final neu = context.neu;
    final progress = session.plannedMinutes == 0 ? 0.0 : session.elapsed.inSeconds / (session.plannedMinutes * 60);

    return VioraCard(
      elevation: VioraElevation.raisedHigh,
      child: Column(
        children: [
          Text(session.title, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
          const SizedBox(height: VioraSpacing.xl),
          VioraProgressRing(
            progress: progress,
            size: 180,
            strokeWidth: 14,
            center: Text(_fmtElapsed(session.elapsed), style: VioraTypography.metric(neu.textPrimary, size: 28)),
          ),
          const SizedBox(height: VioraSpacing.xl),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VioraIconButton(
                icon: session.running ? Icons.pause_rounded : Icons.play_arrow_rounded,
                size: 56,
                tooltip: session.running ? 'Pause' : 'Resume',
                onPressed: () => ref.read(focusSessionProvider.notifier).togglePause(),
              ),
              const SizedBox(width: VioraSpacing.lg),
              VioraIconButton(
                icon: Icons.stop_rounded,
                size: 56,
                tooltip: 'Stop',
                onPressed: () => ref.read(focusSessionProvider.notifier).stop(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
