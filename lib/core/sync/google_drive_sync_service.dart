import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'local_backup.dart';
import 'sync_config.dart';

/// Backs up/restores the Drift database file to the signed-in user's Google
/// Drive "app data" folder — a hidden, per-app storage space Drive grants
/// automatically with the `drive.appdata` scope, so this never shows up in
/// (or clutters) the user's visible Drive files.
///
/// Only wired for Android and Web — see [SyncConfig.isGoogleDrivePlatformSupported].
class GoogleDriveSyncService {
  static const _backupFileName = 'viora_backup.sqlite';
  static const _filesEndpoint = 'https://www.googleapis.com/drive/v3/files';
  static const _uploadEndpoint = 'https://www.googleapis.com/upload/drive/v3/files';

  GoogleSignIn? _googleSignIn;
  GoogleSignInAccount? _account;

  /// Lazy — constructing `GoogleSignIn` eagerly triggers real network
  /// initialization on web, which throws if [SyncConfig.googleWebClientId]
  /// isn't set. Never touch this getter unless [SyncConfig.isGoogleDriveConfigured].
  GoogleSignIn get _signIn => _googleSignIn ??= GoogleSignIn(
        scopes: const ['https://www.googleapis.com/auth/drive.appdata'],
        clientId: kIsWeb && SyncConfig.googleWebClientId.isNotEmpty ? SyncConfig.googleWebClientId : null,
      );

  GoogleSignInAccount? get currentAccount => _account;

  Future<GoogleSignInAccount?> signIn() async {
    _account = await _signIn.signIn();
    return _account;
  }

  Future<void> signOut() async {
    await _signIn.signOut();
    _account = null;
  }

  Future<GoogleSignInAccount?> restoreSession() async {
    if (!SyncConfig.isGoogleDriveConfigured) return null;
    _account = await _signIn.signInSilently();
    return _account;
  }

  Future<Map<String, String>> _authHeaders() async {
    final account = _account;
    if (account == null) throw StateError('Not signed in to Google Drive.');
    final auth = await account.authentication;
    return {'Authorization': 'Bearer ${auth.accessToken}'};
  }

  Future<String?> _findBackupFileId() async {
    final headers = await _authHeaders();
    final uri = Uri.parse(_filesEndpoint).replace(queryParameters: {
      'spaces': 'appDataFolder',
      'q': "name = '$_backupFileName' and trashed = false",
      'fields': 'files(id, modifiedTime)',
      'pageSize': '1',
    });
    final response = await http.get(uri, headers: headers);
    if (response.statusCode != 200) {
      throw Exception('Drive lookup failed (${response.statusCode}): ${response.body}');
    }
    final files = (jsonDecode(response.body) as Map<String, dynamic>)['files'] as List<dynamic>;
    return files.isEmpty ? null : (files.first as Map<String, dynamic>)['id'] as String;
  }

  /// Uploads the current local database as the (single, rolling) Drive
  /// backup, overwriting any previous one.
  Future<void> backup() async {
    final bytes = await LocalBackup.readForBackup();
    final existingId = await _findBackupFileId();
    final headers = await _authHeaders();

    if (existingId != null) {
      final response = await http.patch(
        Uri.parse('$_uploadEndpoint/$existingId').replace(queryParameters: {'uploadType': 'media'}),
        headers: {...headers, 'Content-Type': 'application/octet-stream'},
        body: bytes,
      );
      if (response.statusCode != 200) {
        throw Exception('Drive backup update failed (${response.statusCode}): ${response.body}');
      }
      return;
    }

    const boundary = 'viora-backup-boundary';
    final metadata = jsonEncode({'name': _backupFileName, 'parents': ['appDataFolder']});
    final body = <int>[
      ...utf8.encode('--$boundary\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n$metadata\r\n'),
      ...utf8.encode('--$boundary\r\nContent-Type: application/octet-stream\r\n\r\n'),
      ...bytes,
      ...utf8.encode('\r\n--$boundary--'),
    ];
    final response = await http.post(
      Uri.parse(_uploadEndpoint).replace(queryParameters: {'uploadType': 'multipart'}),
      headers: {...headers, 'Content-Type': 'multipart/related; boundary=$boundary'},
      body: body,
    );
    if (response.statusCode != 200) {
      throw Exception('Drive backup create failed (${response.statusCode}): ${response.body}');
    }
  }

  /// Downloads the latest Drive backup and stages it for the next app
  /// start — see [LocalBackup.applyPendingRestoreIfAny].
  Future<void> restore() async {
    final fileId = await _findBackupFileId();
    if (fileId == null) throw StateError('No backup found in Google Drive.');

    final headers = await _authHeaders();
    final response = await http.get(
      Uri.parse('$_filesEndpoint/$fileId').replace(queryParameters: {'alt': 'media'}),
      headers: headers,
    );
    if (response.statusCode != 200) {
      throw Exception('Drive restore failed (${response.statusCode}): ${response.body}');
    }
    await LocalBackup.stagePendingRestore(response.bodyBytes);
  }
}
