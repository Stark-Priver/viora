import 'package:flutter/material.dart';
import '../../../core/design_system/widgets/viora_info_screen.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const VioraInfoScreen(
      title: 'Activity',
      subtitle: 'Screen time and app usage',
      icon: IconsaxPlusBold.chart_2,
      headline: 'Digital activity tracking needs a native Android module',
      body: 'Reading app usage and screen time requires the Android UsageStatsManager API, which needs a '
          'privileged runtime permission (PACKAGE_USAGE_STATS) granted from system settings, not the normal '
          'in-app permission prompt. This is real native Kotlin work, not something safe to fake with sample numbers.',
      requirements: [
        'A Kotlin UsageStatsManager integration in the Android app shell',
        'A guided settings flow to grant PACKAGE_USAGE_STATS',
        'An ActivityEvent table to normalize per-app sessions into',
      ],
    );
  }
}
