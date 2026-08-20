import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import '../../../../core/design_system/widgets/viora_button.dart';
import '../../../../core/design_system/widgets/viora_card.dart';
import '../../../../core/design_system/widgets/viora_chip.dart';
import '../../../../core/design_system/widgets/viora_input.dart';
import '../../../../core/design_system/widgets/viora_toast.dart';
import '../../../../core/sync/sync_controller.dart';
import '../../../../core/sync/sync_models.dart';

class SyncSettingsCard extends ConsumerWidget {
  const SyncSettingsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(syncControllerProvider);
    final neu = context.neu;

    return VioraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Data & Sync', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: VioraSpacing.xs),
          Text(
            'Viora always works fully offline. Optionally link an account to '
            'back up and restore your data across devices.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: neu.textSecondary),
          ),
          const SizedBox(height: VioraSpacing.lg),
          Wrap(
            spacing: VioraSpacing.sm,
            children: [
              for (final backend in SyncBackend.values)
                VioraChip(
                  label: backend.label,
                  icon: switch (backend) {
                    SyncBackend.local => Icons.smartphone_rounded,
                    SyncBackend.googleDrive => Icons.cloud_outlined,
                    SyncBackend.supabase => Icons.storage_rounded,
                  },
                  selected: status.backend == backend,
                  onTap: () => ref.read(syncControllerProvider.notifier).selectBackend(backend),
                ),
            ],
          ),
          const SizedBox(height: VioraSpacing.lg),
          switch (status.backend) {
            SyncBackend.local => _LocalPanel(neu: neu),
            SyncBackend.googleDrive => const _GoogleDrivePanel(),
            SyncBackend.supabase => const _SupabasePanel(),
          },
          if (status.errorMessage != null) ...[
            const SizedBox(height: VioraSpacing.md),
            Text(status.errorMessage!, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: neu.danger)),
          ],
        ],
      ),
    );
  }
}

class _LocalPanel extends StatelessWidget {
  const _LocalPanel({required this.neu});
  final VioraNeuTheme neu;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.lock_outline_rounded, size: 16, color: neu.textTertiary),
        const SizedBox(width: VioraSpacing.sm),
        Expanded(
          child: Text(
            'Your data never leaves this device.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: neu.textTertiary),
          ),
        ),
      ],
    );
  }
}

class _NotConfiguredNotice extends StatelessWidget {
  const _NotConfiguredNotice({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.info_outline_rounded, size: 16, color: neu.warning),
        const SizedBox(width: VioraSpacing.sm),
        Expanded(child: Text(message, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: neu.textSecondary))),
      ],
    );
  }
}

class _SyncedActions extends ConsumerWidget {
  const _SyncedActions({required this.accountLabel, required this.lastSyncedAt, required this.working, required this.onSignOut});

  final String? accountLabel;
  final DateTime? lastSyncedAt;
  final bool working;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final neu = context.neu;
    final notifier = ref.read(syncControllerProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.check_circle_outline_rounded, size: 16, color: neu.success),
            const SizedBox(width: VioraSpacing.sm),
            Expanded(
              child: Text(
                accountLabel ?? 'Signed in',
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(onPressed: onSignOut, child: const Text('Sign out')),
          ],
        ),
        Text(
          lastSyncedAt == null ? 'Never synced yet' : 'Last synced ${DateFormat('d MMM, HH:mm').format(lastSyncedAt!)}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: neu.textTertiary),
        ),
        const SizedBox(height: VioraSpacing.md),
        Row(
          children: [
            Expanded(
              child: VioraButton(
                label: 'Back up now',
                icon: Icons.cloud_upload_outlined,
                expand: true,
                onPressed: working
                    ? null
                    : () async {
                        await notifier.backupNow();
                        if (context.mounted) VioraToast.show(context, 'Backup complete', icon: Icons.cloud_done_outlined);
                      },
              ),
            ),
            const SizedBox(width: VioraSpacing.md),
            Expanded(
              child: VioraButton(
                label: 'Restore',
                icon: Icons.cloud_download_outlined,
                variant: VioraButtonVariant.secondary,
                expand: true,
                onPressed: working ? null : () => _confirmRestore(context, notifier),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _confirmRestore(BuildContext context, SyncController notifier) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Restore latest backup?'),
        content: const Text(
          'This downloads your latest backup and replaces the data on this '
          'device the next time Viora starts. Anything added on this device '
          'since the last backup will be lost.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(true), child: const Text('Restore')),
        ],
      ),
    );
    if (confirmed != true) return;
    await notifier.restoreNow();
    if (context.mounted) {
      VioraToast.show(context, 'Backup downloaded — restart Viora to apply it', icon: Icons.restart_alt_rounded);
    }
  }
}

class _GoogleDrivePanel extends ConsumerWidget {
  const _GoogleDrivePanel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(syncControllerProvider);
    final available = ref.watch(syncBackendAvailableProvider(SyncBackend.googleDrive));
    final notifier = ref.read(syncControllerProvider.notifier);

    if (!available) {
      return const _NotConfiguredNotice(
        message: 'Google Drive sync isn\'t available on this platform, or the app '
            'maintainer hasn\'t configured a Google OAuth client yet.',
      );
    }

    final working = status.connection == SyncConnectionState.signingIn || status.connection == SyncConnectionState.working;

    if (status.connection == SyncConnectionState.signedIn) {
      return _SyncedActions(
        accountLabel: status.accountLabel,
        lastSyncedAt: status.lastSyncedAt,
        working: working,
        onSignOut: notifier.signOutGoogle,
      );
    }

    return VioraButton(
      label: working ? 'Signing in…' : 'Sign in with Google',
      icon: Icons.login_rounded,
      expand: true,
      onPressed: working ? null : notifier.signInGoogle,
    );
  }
}

class _SupabasePanel extends ConsumerStatefulWidget {
  const _SupabasePanel();

  @override
  ConsumerState<_SupabasePanel> createState() => _SupabasePanelState();
}

class _SupabasePanelState extends ConsumerState<_SupabasePanel> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final status = ref.watch(syncControllerProvider);
    final available = ref.watch(syncBackendAvailableProvider(SyncBackend.supabase));
    final notifier = ref.read(syncControllerProvider.notifier);

    if (!available) {
      return const _NotConfiguredNotice(
        message: 'Supabase sync isn\'t configured yet — the app maintainer needs to '
            'connect a Supabase project first.',
      );
    }

    final working = status.connection == SyncConnectionState.signingIn || status.connection == SyncConnectionState.working;

    if (status.connection == SyncConnectionState.signedIn) {
      return _SyncedActions(
        accountLabel: status.accountLabel,
        lastSyncedAt: status.lastSyncedAt,
        working: working,
        onSignOut: notifier.signOutSupabase,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VioraInput(controller: _email, label: 'Email', hint: 'you@example.com', keyboardType: TextInputType.emailAddress),
        const SizedBox(height: VioraSpacing.md),
        VioraInput(controller: _password, label: 'Password', hint: 'At least 6 characters', obscureText: true),
        const SizedBox(height: VioraSpacing.lg),
        Row(
          children: [
            Expanded(
              child: VioraButton(
                label: 'Sign in',
                expand: true,
                onPressed: working ? null : () => _submit(notifier, signUp: false),
              ),
            ),
            const SizedBox(width: VioraSpacing.md),
            Expanded(
              child: VioraButton(
                label: 'Create account',
                variant: VioraButtonVariant.secondary,
                expand: true,
                onPressed: working ? null : () => _submit(notifier, signUp: true),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _submit(SyncController notifier, {required bool signUp}) async {
    final email = _email.text.trim();
    final password = _password.text;
    if (email.isEmpty || password.length < 6) {
      VioraToast.show(context, 'Enter a valid email and a 6+ character password', icon: Icons.error_outline_rounded);
      return;
    }
    if (signUp) {
      await notifier.signUpSupabase(email: email, password: password);
    } else {
      await notifier.signInSupabase(email: email, password: password);
    }
  }
}
