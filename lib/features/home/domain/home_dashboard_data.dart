import 'package:flutter/material.dart';

class UpcomingEvent {
  const UpcomingEvent({required this.time, required this.title, required this.domain});
  final String time;
  final String title;
  final String domain;
}

class MoneySnapshot {
  const MoneySnapshot({required this.income, required this.spent, required this.net, this.currency = 'TZS'});
  final double income;
  final double spent;
  final double net;
  final String currency;
}

class LifeDomainMinutes {
  const LifeDomainMinutes({required this.label, required this.minutes, required this.color, required this.icon});
  final String label;
  final int minutes;
  final Color color;
  final IconData icon;
}

class GoalProgress {
  const GoalProgress({required this.title, required this.progress, required this.detail});
  final String title;
  final double progress;
  final String detail;
}

enum AlertSeverity { info, warning, danger }

class DashboardAlert {
  const DashboardAlert({required this.message, required this.severity, required this.icon});
  final String message;
  final AlertSeverity severity;
  final IconData icon;
}

class HomeDashboardData {
  const HomeDashboardData({
    required this.date,
    required this.plannedMinutes,
    required this.actualMinutes,
    required this.nextEvent,
    required this.money,
    required this.lifeSnapshot,
    required this.sleepMinutes,
    required this.focusScore,
    required this.planAdherence,
    required this.goals,
    required this.alerts,
  });

  final DateTime date;
  final int plannedMinutes;
  final int actualMinutes;
  final UpcomingEvent? nextEvent;
  final MoneySnapshot money;
  final List<LifeDomainMinutes> lifeSnapshot;
  final int sleepMinutes;
  final double focusScore;
  final double planAdherence;
  final List<GoalProgress> goals;
  final List<DashboardAlert> alerts;

  double get todayProgress => plannedMinutes == 0 ? 0 : (actualMinutes / plannedMinutes).clamp(0, 1);
}
