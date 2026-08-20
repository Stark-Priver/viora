import 'package:flutter/material.dart';

class VioraNavItem {
  const VioraNavItem({required this.label, required this.icon, this.path});

  final String label;
  final IconData icon;

  /// Route path for this item, or null if the module hasn't shipped yet —
  /// unshipped items still render in the shell (so the nav reads as a
  /// finished product) but tapping them shows a "coming soon" toast.
  final String? path;

  bool get enabled => path != null;
}

class VioraNavGroup {
  const VioraNavGroup({required this.label, required this.items});

  final String label;
  final List<VioraNavItem> items;
}

const vioraNavGroups = <VioraNavGroup>[
  VioraNavGroup(label: 'TODAY', items: [
    VioraNavItem(label: 'Home', icon: Icons.grid_view_rounded, path: '/'),
    VioraNavItem(label: 'Timeline', icon: Icons.timeline_rounded, path: '/timeline'),
    VioraNavItem(label: 'Calendar', icon: Icons.calendar_today_rounded, path: '/calendar'),
  ]),
  VioraNavGroup(label: 'PLAN', items: [
    VioraNavItem(label: 'Tasks', icon: Icons.check_circle_outline_rounded, path: '/tasks'),
    VioraNavItem(label: 'Projects', icon: Icons.folder_open_rounded, path: '/projects'),
    VioraNavItem(label: 'Goals', icon: Icons.flag_outlined, path: '/goals'),
    VioraNavItem(label: 'Habits', icon: Icons.repeat_rounded, path: '/habits'),
    VioraNavItem(label: 'Focus', icon: Icons.center_focus_strong_rounded, path: '/focus'),
  ]),
  VioraNavGroup(label: 'LIFE', items: [
    VioraNavItem(label: 'Money', icon: Icons.account_balance_wallet_outlined, path: '/money'),
    VioraNavItem(label: 'Health', icon: Icons.favorite_border_rounded, path: '/health'),
    VioraNavItem(label: 'Education', icon: Icons.school_outlined, path: '/education'),
    VioraNavItem(label: 'Career', icon: Icons.work_outline_rounded, path: '/career'),
    VioraNavItem(label: 'Business', icon: Icons.storefront_outlined, path: '/business'),
    VioraNavItem(label: 'Transport', icon: Icons.two_wheeler_rounded, path: '/transport'),
  ]),
  VioraNavGroup(label: 'DIGITAL', items: [
    VioraNavItem(label: 'Activity', icon: Icons.bar_chart_rounded, path: '/activity'),
    VioraNavItem(label: 'Communications', icon: Icons.forum_outlined, path: '/communications'),
  ]),
  VioraNavGroup(label: 'REFLECT', items: [
    VioraNavItem(label: 'Journal', icon: Icons.menu_book_outlined, path: '/journal'),
    VioraNavItem(label: 'Analytics', icon: Icons.insights_rounded, path: '/analytics'),
    VioraNavItem(label: 'Reports', icon: Icons.description_outlined, path: '/reports'),
  ]),
  VioraNavGroup(label: 'SYSTEM', items: [
    VioraNavItem(label: 'AI Coach', icon: Icons.auto_awesome_rounded, path: '/ai-coach'),
    VioraNavItem(label: 'Settings', icon: Icons.settings_outlined, path: '/settings'),
  ]),
];

/// Compact primary set for mobile bottom navigation.
const vioraMobileNavItems = <VioraNavItem>[
  VioraNavItem(label: 'Home', icon: Icons.grid_view_rounded, path: '/'),
  VioraNavItem(label: 'Tasks', icon: Icons.check_circle_outline_rounded, path: '/tasks'),
  VioraNavItem(label: 'Focus', icon: Icons.center_focus_strong_rounded, path: '/focus'),
  VioraNavItem(label: 'Money', icon: Icons.account_balance_wallet_outlined, path: '/money'),
  VioraNavItem(label: 'More', icon: Icons.grid_view_outlined, path: '/more'),
];

/// Every enabled item across all groups, in order — used by the tablet
/// icon rail which doesn't show group labels.
List<VioraNavItem> get vioraAllNavItems => vioraNavGroups.expand((g) => g.items).toList();
