import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// Thin wrapper around `flutter_local_notifications` for calendar-event
/// reminders. Uses inexact ("while idle") scheduling deliberately — exact
/// alarms need a separate runtime permission on Android 12+ that isn't
/// worth asking for just to fire a reminder within a minute of the target
/// time.
///
/// The plugin has no web implementation at all (no `web:` entry in its
/// platform map), so every entry point here is defensive: a reminder
/// failing to schedule must never block the calendar event itself from
/// being saved.
class NotificationService {
  NotificationService._();
  static final instance = NotificationService._();

  final _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  bool get _supported => !kIsWeb && (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS);

  Future<void> init() async {
    if (_initialized || !_supported) return;
    tz_data.initializeTimeZones();
    try {
      tz.setLocalLocation(tz.getLocation(DateTime.now().timeZoneName));
    } catch (_) {
      // Fall back to UTC if the platform's abbreviation isn't in the tz
      // database (common on some Linux/CI setups) — reminders still fire,
      // just computed against UTC wall-clock time.
    }

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    await _plugin.initialize(
      const InitializationSettings(android: androidSettings, iOS: iosSettings, macOS: iosSettings),
    );

    await _plugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    _initialized = true;
  }

  /// Schedules a reminder at [when]. Returns the notification id used, so
  /// the caller can persist it and cancel it later, or null if the
  /// reminder is in the past or the platform doesn't support local
  /// notifications (web, Linux, Windows).
  Future<int?> scheduleReminder({required int id, required String title, required String body, required DateTime when}) async {
    if (!_supported || when.isBefore(DateTime.now())) return null;

    try {
      await init();
      await _plugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(when, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'viora_reminders',
            'Reminders',
            channelDescription: 'Calendar event reminders',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      );
      return id;
    } catch (_) {
      return null;
    }
  }

  Future<void> cancel(int id) async {
    if (!_supported) return;
    try {
      await init();
      await _plugin.cancel(id);
    } catch (_) {
      // Best-effort — a failed cancel should never block deleting the
      // event it was attached to.
    }
  }
}
