import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

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
    VioraNavItem(label: 'Home', icon: IconsaxPlusBold.grid_1, path: '/'),
    VioraNavItem(label: 'Timeline', icon: IconsaxPlusBroken.activity, path: '/timeline'),
    VioraNavItem(label: 'Calendar', icon: IconsaxPlusBroken.calendar, path: '/calendar'),
  ]),
  VioraNavGroup(label: 'PLAN', items: [
    VioraNavItem(label: 'Tasks', icon: IconsaxPlusBroken.tick_circle, path: '/tasks'),
    VioraNavItem(label: 'Projects', icon: IconsaxPlusBroken.folder_open, path: '/projects'),
    VioraNavItem(label: 'Goals', icon: IconsaxPlusBroken.flag, path: '/goals'),
    VioraNavItem(label: 'Habits', icon: IconsaxPlusBroken.repeat, path: '/habits'),
    VioraNavItem(label: 'Focus', icon: IconsaxPlusBroken.scan, path: '/focus'),
  ]),
  VioraNavGroup(label: 'LIFE', items: [
    VioraNavItem(label: 'Money', icon: IconsaxPlusBroken.wallet, path: '/money'),
    VioraNavItem(label: 'Health', icon: IconsaxPlusBroken.heart, path: '/health'),
    VioraNavItem(label: 'Education', icon: IconsaxPlusBroken.teacher, path: '/education'),
    VioraNavItem(label: 'Career', icon: IconsaxPlusBroken.briefcase, path: '/career'),
    VioraNavItem(label: 'Business', icon: IconsaxPlusBroken.shop, path: '/business'),
    VioraNavItem(label: 'Transport', icon: IconsaxPlusBroken.car, path: '/transport'),
  ]),
  VioraNavGroup(label: 'DIGITAL', items: [
    VioraNavItem(label: 'Activity', icon: IconsaxPlusBold.chart_2, path: '/activity'),
    VioraNavItem(label: 'Communications', icon: IconsaxPlusBroken.messages, path: '/communications'),
  ]),
  VioraNavGroup(label: 'REFLECT', items: [
    VioraNavItem(label: 'Journal', icon: IconsaxPlusBroken.book_1, path: '/journal'),
    VioraNavItem(label: 'Analytics', icon: IconsaxPlusBold.chart_square, path: '/analytics'),
    VioraNavItem(label: 'Reports', icon: IconsaxPlusBroken.document_text, path: '/reports'),
  ]),
  VioraNavGroup(label: 'SYSTEM', items: [
    VioraNavItem(label: 'AI Coach', icon: IconsaxPlusBroken.magic_star, path: '/ai-coach'),
    VioraNavItem(label: 'Settings', icon: IconsaxPlusBroken.setting_2, path: '/settings'),
  ]),
];

/// Compact primary set for mobile bottom navigation.
const vioraMobileNavItems = <VioraNavItem>[
  VioraNavItem(label: 'Home', icon: IconsaxPlusBold.grid_1, path: '/'),
  VioraNavItem(label: 'Tasks', icon: IconsaxPlusBroken.tick_circle, path: '/tasks'),
  VioraNavItem(label: 'Focus', icon: IconsaxPlusBroken.scan, path: '/focus'),
  VioraNavItem(label: 'Money', icon: IconsaxPlusBroken.wallet, path: '/money'),
  VioraNavItem(label: 'More', icon: IconsaxPlusBroken.grid_1, path: '/more'),
];

/// Every enabled item across all groups, in order — used by the tablet
/// icon rail which doesn't show group labels.
List<VioraNavItem> get vioraAllNavItems => vioraNavGroups.expand((g) => g.items).toList();
