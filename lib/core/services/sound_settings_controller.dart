import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feedback_service.dart';

const soundEffectsPrefsKey = 'viora.sound_effects_enabled';

/// Settings-screen-facing control for [FeedbackService.soundEnabled]. The
/// service itself is a plain singleton (used from providers with no
/// Riverpod `ref` in scope), so this just keeps it and the persisted
/// preference in sync — [loadSoundEffectsPreference] does the one-time
/// read at app boot, before anything has a chance to play a cue.
class SoundSettingsController extends Notifier<bool> {
  @override
  bool build() => FeedbackService.instance.soundEnabled;

  Future<void> set(bool enabled) async {
    state = enabled;
    FeedbackService.instance.soundEnabled = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(soundEffectsPrefsKey, enabled);
  }
}

final soundEffectsEnabledProvider = NotifierProvider<SoundSettingsController, bool>(SoundSettingsController.new);

Future<void> loadSoundEffectsPreference() async {
  final prefs = await SharedPreferences.getInstance();
  FeedbackService.instance.soundEnabled = prefs.getBool(soundEffectsPrefsKey) ?? true;
}
