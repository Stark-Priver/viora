import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_card.dart';
import '../../../../core/design_system/widgets/viora_surface.dart';

String _greeting(DateTime now) {
  final h = now.hour;
  if (h < 5) return 'Good night';
  if (h < 12) return 'Good morning';
  if (h < 17) return 'Good afternoon';
  return 'Good evening';
}

IconData _greetingIcon(DateTime now) {
  final h = now.hour;
  if (h < 5) return Icons.dark_mode_outlined;
  if (h < 12) return Icons.wb_twilight_rounded;
  if (h < 17) return Icons.wb_sunny_outlined;
  return Icons.nights_stay_outlined;
}

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late DateTime _now = DateTime.now();
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => setState(() => _now = DateTime.now()));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final textTheme = Theme.of(context).textTheme;

    return VioraCard(
      elevation: VioraElevation.raisedHigh,
      orbColors: [neu.brand, neu.domainStudy],
      padding: const EdgeInsets.all(VioraSpacing.xl2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(color: neu.brand.withValues(alpha: 0.14), shape: BoxShape.circle),
            child: Icon(_greetingIcon(_now), color: neu.brand, size: 24),
          ),
          const SizedBox(width: VioraSpacing.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${_greeting(_now)}.', style: textTheme.displaySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: VioraSpacing.xs),
                Text(
                  DateFormat('EEEE, d MMMM').format(_now),
                  style: textTheme.bodyLarge?.copyWith(color: neu.textSecondary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: VioraSpacing.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(DateFormat('HH:mm').format(_now), style: textTheme.headlineMedium),
              Text('local time', style: textTheme.labelMedium),
            ],
          ),
        ],
      ),
    );
  }
}
