import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/design_system/theme/theme_controller.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_chip.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/services/sound_settings_controller.dart';
import '../../../core/services/external_links.dart';
import 'widgets/bottom_nav_settings_card.dart';
import 'widgets/support_links_card.dart';
import 'widgets/sync_settings_card.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final soundEnabled = ref.watch(soundEffectsEnabledProvider);
    final neu = context.neu;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      icon: IconsaxPlusBroken.toggle_on,
                      selected: themeMode == ThemeMode.system,
                      onTap: () => ref.read(themeModeProvider.notifier).set(ThemeMode.system),
                    ),
                    VioraChip(
                      label: 'Light',
                      icon: IconsaxPlusBroken.sun_1,
                      selected: themeMode == ThemeMode.light,
                      onTap: () => ref.read(themeModeProvider.notifier).set(ThemeMode.light),
                    ),
                    VioraChip(
                      label: 'Dark',
                      icon: IconsaxPlusBold.moon,
                      selected: themeMode == ThemeMode.dark,
                      onTap: () => ref.read(themeModeProvider.notifier).set(ThemeMode.dark),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: VioraSpacing.lg),
          VioraCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sound & Haptics', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: VioraSpacing.xs),
                Text(
                  'The tap, completion, and delete cues heard around the app.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: neu.textSecondary),
                ),
                const SizedBox(height: VioraSpacing.lg),
                Wrap(
                  spacing: VioraSpacing.sm,
                  children: [
                    VioraChip(
                      label: 'Sound effects on',
                      icon: IconsaxPlusBold.notification,
                      selected: soundEnabled,
                      onTap: () => ref.read(soundEffectsEnabledProvider.notifier).set(true),
                    ),
                    VioraChip(
                      label: 'Off',
                      icon: IconsaxPlusBroken.notification,
                      selected: !soundEnabled,
                      onTap: () => ref.read(soundEffectsEnabledProvider.notifier).set(false),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: VioraSpacing.lg),
          const BottomNavSettingsCard(),
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
                const SizedBox(height: VioraSpacing.md),
                Row(
                  children: [
                    Icon(IconsaxPlusBroken.code, size: 15, color: neu.textTertiary),
                    const SizedBox(width: VioraSpacing.xs),
                    Expanded(
                      child: Text(
                        'Open source, built by Stark-Priver. The full source is public on GitHub — read it, fork it, or send a pull request.',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: neu.textSecondary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: VioraSpacing.sm),
                InkWell(
                  onTap: () => ExternalLinks.open(ExternalLinks.repo),
                  child: Text(
                    'github.com/Stark-Priver/viora',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: neu.brand, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
