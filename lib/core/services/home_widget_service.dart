import 'package:flutter/foundation.dart';
import 'package:home_widget/home_widget.dart';
import 'package:intl/intl.dart';
import '../database/app_database.dart';

/// Keeps the Android "Today" home-screen widget (active task count + focus
/// minutes today) in sync. There's no live binding from the database to a
/// widget outside the app process, so this is called explicitly from the
/// action points that change those numbers (task add/complete/delete, focus
/// session start/stop) rather than being a continuously reactive stream.
class HomeWidgetService {
  HomeWidgetService._();

  static const _providerName = 'VioraTodayWidgetProvider';
  static const _qualifiedProviderName = 'com.viora.viora.VioraTodayWidgetProvider';

  static Future<void> refresh(AppDatabase db) async {
    // Only Android ships a widget provider — everywhere else (web, desktop,
    // iOS without a widget extension) this method channel simply isn't
    // registered, so skip rather than let a MissingPluginException surface
    // from what's meant to be a best-effort background sync.
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) return;

    try {
      final tasks = await db.tasksDao.watchActive().first;
      final sessions = await db.focusDao.watchRecent().first;
      final now = DateTime.now();

      final focusMinutesToday = sessions
          .where((s) => _sameDay(s.startedAt, now) && s.focusedMinutes != null)
          .fold<int>(0, (sum, s) => sum + s.focusedMinutes!);

      await HomeWidget.saveWidgetData<String>('today_task_count', tasks.length.toString());
      await HomeWidget.saveWidgetData<String>('today_focus_minutes', focusMinutesToday.toString());
      await HomeWidget.saveWidgetData<String>('today_updated_label', 'Updated ${DateFormat('HH:mm').format(now)}');

      await HomeWidget.updateWidget(name: _providerName, qualifiedAndroidName: _qualifiedProviderName);
    } catch (_) {
      // Best-effort — a widget sync failure should never break the action
      // (adding a task, finishing a focus session) that triggered it.
    }
  }

  static bool _sameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;
}
