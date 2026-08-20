import 'package:flutter/material.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/tokens/typography.dart';
import '../../../../core/design_system/widgets/viora_card.dart';
import '../../../../core/design_system/widgets/viora_surface.dart';
import '../../../../core/design_system/widgets/viora_icon_button.dart';
import '../../../../core/design_system/widgets/viora_button.dart';
import '../../../../core/design_system/widgets/viora_progress_ring.dart';
import '../../../focus/presentation/providers/focus_providers.dart';
import '../../domain/home_dashboard_data.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

String _fmtElapsed(Duration d) {
  final h = d.inHours.toString().padLeft(2, '0');
  final m = (d.inMinutes % 60).toString().padLeft(2, '0');
  final s = (d.inSeconds % 60).toString().padLeft(2, '0');
  return '$h:$m:$s';
}

class CurrentFocusCard extends StatelessWidget {
  const CurrentFocusCard({
    super.key,
    required this.session,
    required this.nextEvent,
    required this.onTogglePause,
    required this.onStop,
    required this.onStartFocus,
  });

  final ActiveFocusSession? session;
  final UpcomingEvent? nextEvent;
  final VoidCallback onTogglePause;
  final VoidCallback onStop;
  final VoidCallback onStartFocus;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;

    Widget nextEventLine() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(IconsaxPlusBroken.clock, size: 15, color: neu.textTertiary),
          const SizedBox(width: VioraSpacing.xs),
          Flexible(
            child: Text('${nextEvent!.time} · ${nextEvent!.title}', style: textTheme.bodySmall, overflow: TextOverflow.ellipsis),
          ),
        ],
      );
    }

    if (session == null) {
      return VioraCard(
        elevation: VioraElevation.raisedHigh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NO ACTIVE FOCUS', style: textTheme.labelMedium),
            const SizedBox(height: VioraSpacing.sm),
            Text('Nothing running right now', style: textTheme.headlineSmall),
            const SizedBox(height: VioraSpacing.lg),
            VioraButton(label: 'Start focus session', icon: IconsaxPlusBold.play, onPressed: onStartFocus),
            if (nextEvent != null) ...[const SizedBox(height: VioraSpacing.lg), nextEventLine()],
          ],
        ),
      );
    }

    final focus = session!;
    final progress = focus.plannedMinutes == 0 ? 0.0 : focus.elapsed.inSeconds / (focus.plannedMinutes * 60);

    return VioraCard(
      elevation: VioraElevation.raisedHigh,
      orbColors: [neu.success, neu.brand],
      animate: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(right: VioraSpacing.sm),
                decoration: BoxDecoration(
                  color: focus.running ? neu.success : neu.textTertiary,
                  shape: BoxShape.circle,
                ),
              ),
              Text(focus.running ? 'CURRENT FOCUS' : 'PAUSED', style: textTheme.labelMedium),
            ],
          ),
          const SizedBox(height: VioraSpacing.sm),
          Text(focus.title, style: textTheme.headlineSmall, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
          const SizedBox(height: VioraSpacing.xl),
          VioraProgressRing(
            progress: progress,
            size: 148,
            strokeWidth: 12,
            center: Text(_fmtElapsed(focus.elapsed), style: VioraTypography.metric(neu.textPrimary, size: 24)),
          ),
          const SizedBox(height: VioraSpacing.xl),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              VioraIconButton(
                icon: focus.running ? IconsaxPlusBold.pause : IconsaxPlusBold.play,
                tooltip: focus.running ? 'Pause' : 'Resume',
                onPressed: onTogglePause,
              ),
              const SizedBox(width: VioraSpacing.md),
              VioraIconButton(icon: IconsaxPlusBold.stop_circle, tooltip: 'Stop', onPressed: onStop),
            ],
          ),
          if (nextEvent != null) ...[const SizedBox(height: VioraSpacing.lg), nextEventLine()],
        ],
      ),
    );
  }
}
