import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

/// Completion feedback: a short chime plus haptic tick when the user
/// finishes something (a task, a habit, a focus session). Deliberately one
/// consistent, restrained sound reused everywhere rather than a library of
/// different jingles — this is feedback, not a reward mechanic.
class FeedbackService {
  FeedbackService._();
  static final instance = FeedbackService._();

  final _player = AudioPlayer();

  Future<void> celebrate() async {
    try {
      await HapticFeedback.mediumImpact();
    } catch (_) {
      // Haptics aren't available on every platform (web, desktop) — never
      // let that block the sound or the action that triggered feedback.
    }
    try {
      await _player.stop();
      await _player.play(AssetSource('sounds/success.wav'), volume: 0.6);
    } catch (_) {
      // Best-effort — a missing audio device or muted platform channel
      // should never block the completion action itself.
    }
  }

  Future<void> tick() async {
    try {
      await HapticFeedback.selectionClick();
    } catch (_) {
      // See celebrate() above.
    }
    try {
      await _player.stop();
      await _player.play(AssetSource('sounds/tap.wav'), volume: 0.4);
    } catch (_) {
      // See celebrate() above.
    }
  }

  /// Feedback for a destructive/negative action (delete, dismiss) — a
  /// short downward tone, distinct enough from [celebrate] and [tick] to
  /// read as "removed" rather than "done" or "selected".
  Future<void> dismiss() async {
    try {
      await HapticFeedback.lightImpact();
    } catch (_) {
      // See celebrate() above.
    }
    try {
      await _player.stop();
      await _player.play(AssetSource('sounds/dismiss.wav'), volume: 0.5);
    } catch (_) {
      // See celebrate() above.
    }
  }
}
