import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'google_drive_sync_service.dart';
import 'supabase_sync_service.dart';
import 'sync_config.dart';
import 'sync_models.dart';

const _backendPrefsKey = 'viora.sync.backend';
const _lastSyncedPrefsKey = 'viora.sync.last_synced_at';

/// Orchestrates the user's chosen sync backend. Local storage is always the
/// source of truth for reads/writes — this only controls whether (and
/// where) a backup/restore copy of the database is kept.
class SyncController extends Notifier<SyncStatus> {
  final googleDrive = GoogleDriveSyncService();
  final supabase = SupabaseSyncService();

  @override
  SyncStatus build() {
    _restore();
    return const SyncStatus(backend: SyncBackend.local);
  }

  Future<void> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final storedBackend = prefs.getString(_backendPrefsKey);
    final backend = SyncBackend.values.firstWhere(
      (b) => b.name == storedBackend,
      orElse: () => SyncBackend.local,
    );
    final lastSyncedIso = prefs.getString(_lastSyncedPrefsKey);
    final lastSyncedAt = lastSyncedIso == null ? null : DateTime.tryParse(lastSyncedIso);

    if (backend == SyncBackend.googleDrive) {
      final account = await googleDrive.restoreSession();
      state = SyncStatus(
        backend: backend,
        connection: account != null ? SyncConnectionState.signedIn : SyncConnectionState.signedOut,
        accountLabel: account?.email,
        lastSyncedAt: lastSyncedAt,
      );
    } else if (backend == SyncBackend.supabase) {
      final user = SyncConfig.isSupabaseConfigured ? supabase.currentUser : null;
      state = SyncStatus(
        backend: backend,
        connection: user != null ? SyncConnectionState.signedIn : SyncConnectionState.signedOut,
        accountLabel: user?.email,
        lastSyncedAt: lastSyncedAt,
      );
    } else {
      state = SyncStatus(backend: backend, connection: SyncConnectionState.signedIn, lastSyncedAt: lastSyncedAt);
    }
  }

  Future<void> _persistBackend(SyncBackend backend) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_backendPrefsKey, backend.name);
  }

  Future<void> _persistLastSynced(DateTime at) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastSyncedPrefsKey, at.toIso8601String());
  }

  Future<void> selectBackend(SyncBackend backend) async {
    await _persistBackend(backend);
    state = SyncStatus(
      backend: backend,
      connection: backend == SyncBackend.local ? SyncConnectionState.signedIn : SyncConnectionState.signedOut,
    );
  }

  Future<void> signInGoogle() async {
    state = state.copyWith(connection: SyncConnectionState.signingIn, clearError: true);
    try {
      final account = await googleDrive.signIn();
      if (account == null) {
        state = state.copyWith(connection: SyncConnectionState.signedOut);
        return;
      }
      state = state.copyWith(connection: SyncConnectionState.signedIn, accountLabel: account.email);
    } catch (e) {
      state = state.copyWith(connection: SyncConnectionState.error, errorMessage: e.toString());
    }
  }

  Future<void> signOutGoogle() async {
    await googleDrive.signOut();
    state = state.copyWith(connection: SyncConnectionState.signedOut, clearAccountLabel: true);
  }

  Future<void> signInSupabase({required String email, required String password}) async {
    state = state.copyWith(connection: SyncConnectionState.signingIn, clearError: true);
    try {
      await supabase.signIn(email: email, password: password);
      state = state.copyWith(connection: SyncConnectionState.signedIn, accountLabel: email);
    } catch (e) {
      state = state.copyWith(connection: SyncConnectionState.error, errorMessage: e.toString());
    }
  }

  Future<void> signUpSupabase({required String email, required String password}) async {
    state = state.copyWith(connection: SyncConnectionState.signingIn, clearError: true);
    try {
      await supabase.signUp(email: email, password: password);
      state = state.copyWith(connection: SyncConnectionState.signedIn, accountLabel: email);
    } catch (e) {
      state = state.copyWith(connection: SyncConnectionState.error, errorMessage: e.toString());
    }
  }

  Future<void> signOutSupabase() async {
    await supabase.signOut();
    state = state.copyWith(connection: SyncConnectionState.signedOut, clearAccountLabel: true);
  }

  Future<void> backupNow() async {
    if (state.backend == SyncBackend.local) return;
    state = state.copyWith(connection: SyncConnectionState.working, clearError: true);
    try {
      if (state.backend == SyncBackend.googleDrive) {
        await googleDrive.backup();
      } else {
        await supabase.backup();
      }
      final now = DateTime.now();
      await _persistLastSynced(now);
      state = state.copyWith(connection: SyncConnectionState.signedIn, lastSyncedAt: now);
    } catch (e) {
      state = state.copyWith(connection: SyncConnectionState.error, errorMessage: e.toString());
    }
  }

  /// Downloads the latest backup and stages it — the caller is responsible
  /// for prompting the user to restart the app to apply it (see
  /// `LocalBackup.applyPendingRestoreIfAny`, run at the next launch).
  Future<void> restoreNow() async {
    if (state.backend == SyncBackend.local) return;
    state = state.copyWith(connection: SyncConnectionState.working, clearError: true);
    try {
      if (state.backend == SyncBackend.googleDrive) {
        await googleDrive.restore();
      } else {
        await supabase.restore();
      }
      state = state.copyWith(connection: SyncConnectionState.signedIn);
    } catch (e) {
      state = state.copyWith(connection: SyncConnectionState.error, errorMessage: e.toString());
    }
  }
}

final syncControllerProvider = NotifierProvider<SyncController, SyncStatus>(SyncController.new);

/// Whether the currently selected backend is actually usable — false when
/// the app maintainer hasn't configured the required project/OAuth client.
final syncBackendAvailableProvider = Provider.family<bool, SyncBackend>((ref, backend) {
  return switch (backend) {
    SyncBackend.local => true,
    SyncBackend.googleDrive => SyncConfig.isGoogleDriveConfigured,
    SyncBackend.supabase => SyncConfig.isSupabaseConfigured,
  };
});
