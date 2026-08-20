enum SyncBackend { local, googleDrive, supabase }

extension SyncBackendLabel on SyncBackend {
  String get label => switch (this) {
        SyncBackend.local => 'Local only',
        SyncBackend.googleDrive => 'Google Drive',
        SyncBackend.supabase => 'Supabase',
      };

  String get description => switch (this) {
        SyncBackend.local => 'Your data never leaves this device.',
        SyncBackend.googleDrive => 'Back up and restore via your Google Drive.',
        SyncBackend.supabase => 'Back up and restore via a Supabase account.',
      };
}

enum SyncConnectionState { signedOut, signingIn, signedIn, working, error }

class SyncStatus {
  const SyncStatus({
    required this.backend,
    this.connection = SyncConnectionState.signedOut,
    this.accountLabel,
    this.lastSyncedAt,
    this.errorMessage,
  });

  final SyncBackend backend;
  final SyncConnectionState connection;
  final String? accountLabel;
  final DateTime? lastSyncedAt;
  final String? errorMessage;

  SyncStatus copyWith({
    SyncBackend? backend,
    SyncConnectionState? connection,
    String? accountLabel,
    bool clearAccountLabel = false,
    DateTime? lastSyncedAt,
    String? errorMessage,
    bool clearError = false,
  }) {
    return SyncStatus(
      backend: backend ?? this.backend,
      connection: connection ?? this.connection,
      accountLabel: clearAccountLabel ? null : (accountLabel ?? this.accountLabel),
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
