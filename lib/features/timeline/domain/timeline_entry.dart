enum TimelineKind { task, focus, transactionIncome, transactionExpense, habit, journal, calendarEvent }

/// A single point on the day's timeline, normalized from whichever table it
/// actually came from (tasks, focus_sessions, transactions, habit_logs,
/// journal_entries, calendar_events) — the product brief's "everything
/// Viora knows should be representable as a TimelineEvent" (section 11 /
/// 55), scoped here to what can be derived from existing tables without a
/// dedicated activity_events table yet.
class TimelineEntry {
  const TimelineEntry({required this.time, required this.title, this.subtitle, required this.kind});

  final DateTime time;
  final String title;
  final String? subtitle;
  final TimelineKind kind;
}
