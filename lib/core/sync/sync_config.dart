import 'package:flutter/foundation.dart';

/// Cloud sync is opt-in and requires the app maintainer to plug in their own
/// Supabase project / Google OAuth client — never hardcoded into the repo.
/// Provide these at build time, e.g.:
///
/// ```bash
/// flutter run \
///   --dart-define=SUPABASE_URL=https://xxxx.supabase.co \
///   --dart-define=SUPABASE_ANON_KEY=eyJ... \
///   --dart-define=GOOGLE_WEB_CLIENT_ID=xxxx.apps.googleusercontent.com
/// ```
///
/// See `docs/SYNC_SETUP.md` for the full walkthrough. Without these, the
/// app runs fully local-first — nothing about core functionality depends on
/// sync being configured.
class SyncConfig {
  SyncConfig._();

  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  /// Only required on Web — Android resolves its OAuth client from the
  /// package name + SHA-1 fingerprint registered in Google Cloud Console.
  static const googleWebClientId = String.fromEnvironment('GOOGLE_WEB_CLIENT_ID');

  static bool get isSupabaseConfigured => supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty;

  /// Google Drive backup is only wired for Android and Web — the
  /// `google_sign_in` plugin doesn't support Linux desktop.
  static bool get isGoogleDrivePlatformSupported => kIsWeb || defaultTargetPlatform == TargetPlatform.android;

  static bool get isGoogleDriveConfigured =>
      isGoogleDrivePlatformSupported && (!kIsWeb || googleWebClientId.isNotEmpty);
}
