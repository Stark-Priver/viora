import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/design_system/theme/theme_controller.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_chip.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import 'widgets/support_links_card.dart';
import 'widgets/sync_settings_card.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final neu = context.neu;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VioraSection(title: 'Settings'),
          VioraCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Appearance', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: VioraSpacing.xs),
                Text('Choose how Viora looks on this device.', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: neu.textSecondary)),
                const SizedBox(height: VioraSpacing.lg),
                Wrap(
                  spacing: VioraSpacing.sm,
                  children: [
                    VioraChip(
                      label: 'System',
                      icon: Icons.brightness_auto_rounded,
                      selected: themeMode == ThemeMode.system,
                      onTap: () => ref.read(themeModeProvider.notifier).set(ThemeMode.system),
                    ),
                    VioraChip(
                      label: 'Light',
                      icon: Icons.light_mode_rounded,
                      selected: themeMode == ThemeMode.light,
                      onTap: () => ref.read(themeModeProvider.notifier).set(ThemeMode.light),
                    ),
                    VioraChip(
                      label: 'Dark',
                      icon: Icons.dark_mode_rounded,
                      selected: themeMode == ThemeMode.dark,
                      onTap: () => ref.read(themeModeProvider.notifier).set(ThemeMode.dark),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: VioraSpacing.lg),
          const SyncSettingsCard(),
          const SizedBox(height: VioraSpacing.lg),
          const SupportLinksCard(),
          const SizedBox(height: VioraSpacing.lg),
          VioraCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: VioraSpacing.sm),
                Text('Viora 0.1.0 — Personal Life Operating System', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: neu.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
