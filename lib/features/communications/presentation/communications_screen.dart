import 'package:flutter/material.dart';
import '../../../core/design_system/widgets/viora_info_screen.dart';

class CommunicationsScreen extends StatelessWidget {
  const CommunicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const VioraInfoScreen(
      title: 'Communications',
      subtitle: 'Calls, messages, notification load',
      icon: Icons.forum_outlined,
      headline: 'Call and notification metadata need explicit device permissions',
      body: 'Call-log metadata (READ_CALL_LOG) and notification counts (a Notification Listener Service) are both '
          'privileged Android permissions with their own consent screens — and, per the product\'s privacy rules, '
          'must default to OFF and never touch message content. This needs a dedicated opt-in flow, not a toggle '
          'buried in Settings.',
      requirements: [
        'A contextual permission flow for READ_CALL_LOG (metadata only — no recording, ever)',
        'A NotificationListenerService for notification counts only, message bodies excluded by default',
        'The privacy-level (OFF / LOCAL ONLY / SYNC) picker from the product brief',
      ],
    );
  }
}
