import 'dart:io';
import 'package:path_provider/path_provider.dart';

/// Locates the on-disk Drift database file and coordinates the safe
/// swap-in of a downloaded backup.
///
/// Restoring a backup while the app (and its live SQLite connection) is
/// running is unsafe, so restore never overwrites the live file directly:
/// it stages the downloaded bytes as `viora.sqlite.pending-restore` and
/// [applyPendingRestoreIfAny] — called once at app startup, before the
/// database is opened — swaps it into place.
class LocalBackup {
  LocalBackup._();

  static const _dbFileName = 'viora.sqlite';
  static const _pendingSuffix = '.pending-restore';

  static Future<File> databaseFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_dbFileName');
  }

  static Future<File> _pendingFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_dbFileName$_pendingSuffix');
  }

  /// Reads the current database file as bytes, ready to upload.
  static Future<List<int>> readForBackup() async {
    final file = await databaseFile();
    return file.readAsBytes();
  }

  /// Stages downloaded backup bytes. Call [applyPendingRestoreIfAny] on the
  /// next app start (or prompt the user to restart) to apply it.
  static Future<void> stagePendingRestore(List<int> bytes) async {
    final pending = await _pendingFile();
    await pending.writeAsBytes(bytes, flush: true);
  }

  static Future<bool> hasPendingRestore() async {
    final pending = await _pendingFile();
    return pending.exists();
  }

  /// Must be called before the database is opened. Swaps a staged restore
  /// into place, including WAL/SHM sidecar files so no stale journal data
  /// leaks into the restored database.
  static Future<void> applyPendingRestoreIfAny() async {
    final pending = await _pendingFile();
    if (!await pending.exists()) return;

    final target = await databaseFile();
    for (final suffix in ['-wal', '-shm', '-journal']) {
      final sidecar = File('${target.path}$suffix');
      if (await sidecar.exists()) await sidecar.delete();
    }
    if (await target.exists()) await target.delete();
    await pending.rename(target.path);
  }
}
