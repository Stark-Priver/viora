import 'dart:async';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/services/feedback_service.dart';
import '../../../../core/services/home_widget_service.dart';

const _uuid = Uuid();

final recentSessionsProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).focusDao.watchRecent();
});

class ActiveFocusSession {
  const ActiveFocusSession({required this.id, required this.title, required this.plannedMinutes, required this.elapsed, required this.running});

  final String id;
  final String title;
  final int plannedMinutes;
  final Duration elapsed;
  final bool running;

  ActiveFocusSession copyWith({Duration? elapsed, bool? running}) {
    return ActiveFocusSession(
      id: id,
      title: title,
      plannedMinutes: plannedMinutes,
      elapsed: elapsed ?? this.elapsed,
      running: running ?? this.running,
    );
  }
}

class FocusSessionNotifier extends StateNotifier<ActiveFocusSession?> {
  FocusSessionNotifier(this.ref) : super(null);

  final Ref ref;
  Timer? _ticker;

  /// No-op if a session is already running — starting a second one would
  /// orphan the first as a permanently "active" row in the database (it
  /// has no way to be closed once this notifier's in-memory state moves
  /// on to track the new one instead).
  ///
  /// [state] is set *before* the `await` below, synchronously, so a rapid
  /// double-tap can't race past the guard: the second call always sees the
  /// first one's state already in place, since Dart runs a callback's
  /// synchronous prefix to completion before another callback gets a turn.
  Future<void> start({required String title, required int plannedMinutes}) async {
    if (state != null) return;
    final id = _uuid.v4();
    state = ActiveFocusSession(id: id, title: title, plannedMinutes: plannedMinutes, elapsed: Duration.zero, running: true);
    await ref.read(databaseProvider).focusDao.insertSession(
          FocusSessionsCompanion.insert(id: id, title: title, plannedMinutes: Value(plannedMinutes)),
        );
    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      final s = state;
      if (s == null || !s.running) return;
      state = s.copyWith(elapsed: s.elapsed + const Duration(seconds: 1));
    });
  }

  void togglePause() {
    final s = state;
    if (s == null) return;
    state = s.copyWith(running: !s.running);
  }

  Future<void> stop({int interruptions = 0}) async {
    final s = state;
    if (s == null) return;
    _ticker?.cancel();
    _ticker = null;
    final db = ref.read(databaseProvider);
    await db.focusDao.endSession(
      s.id,
      focusedMinutes: s.elapsed.inMinutes,
      interruptions: interruptions,
    );
    state = null;
    if (s.elapsed.inSeconds >= 30) {
      unawaited(FeedbackService.instance.celebrate());
    }
    unawaited(HomeWidgetService.refresh(db));
  }

  /// Deletes any session row — including a stale "active" one left behind
  /// by a previous app run that got killed mid-session (this notifier's
  /// in-memory state resets to null on every launch, so a row like that
  /// has no other way to ever be closed). If it happens to be the session
  /// currently live in memory, clears that too.
  Future<void> deleteSession(String id) async {
    final db = ref.read(databaseProvider);
    await db.focusDao.deleteById(id);
    if (state?.id == id) {
      _ticker?.cancel();
      _ticker = null;
      state = null;
    }
    unawaited(FeedbackService.instance.dismiss());
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }
}

final focusSessionProvider = StateNotifierProvider<FocusSessionNotifier, ActiveFocusSession?>((ref) {
  return FocusSessionNotifier(ref);
});
