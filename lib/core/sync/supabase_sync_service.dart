import 'dart:typed_data';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'local_backup.dart';

/// Backs up/restores the Drift database file to a per-user folder in a
/// Supabase Storage bucket, gated by email/password auth — works on every
/// platform Viora ships (no native OAuth setup required), which is why it's
/// the backend recommended for non-technical users.
///
/// Requires `Supabase.initialize(...)` to have run first — see
/// `docs/SYNC_SETUP.md` and [SyncConfig.isSupabaseConfigured].
class SupabaseSyncService {
  static const _bucket = 'viora-backups';
  static const _backupFileName = 'viora_backup.sqlite';

  SupabaseClient get _client => Supabase.instance.client;

  GoTrueClient get auth => _client.auth;

  User? get currentUser => _client.auth.currentUser;

  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;

  Future<void> signUp({required String email, required String password}) async {
    await _client.auth.signUp(email: email, password: password);
  }

  Future<void> signIn({required String email, required String password}) async {
    await _client.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  String _pathFor(String userId) => '$userId/$_backupFileName';

  Future<void> backup() async {
    final user = currentUser;
    if (user == null) throw StateError('Not signed in to Supabase.');
    final bytes = await LocalBackup.readForBackup();
    await _client.storage.from(_bucket).uploadBinary(
          _pathFor(user.id),
          Uint8List.fromList(bytes),
          fileOptions: const FileOptions(upsert: true),
        );
  }

  Future<void> restore() async {
    final user = currentUser;
    if (user == null) throw StateError('Not signed in to Supabase.');
    final bytes = await _client.storage.from(_bucket).download(_pathFor(user.id));
    await LocalBackup.stagePendingRestore(bytes);
  }
}
