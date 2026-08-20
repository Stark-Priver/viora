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

  Future<void> start({required String title, required int plannedMinutes}) async {
    final id = _uuid.v4();
    await ref.read(databaseProvider).focusDao.insertSession(
          FocusSessionsCompanion.insert(id: id, title: title, plannedMinutes: Value(plannedMinutes)),
        );
    state = ActiveFocusSession(id: id, title: title, plannedMinutes: plannedMinutes, elapsed: Duration.zero, running: true);
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

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }
}

final focusSessionProvider = StateNotifierProvider<FocusSessionNotifier, ActiveFocusSession?>((ref) {
  return FocusSessionNotifier(ref);
});
