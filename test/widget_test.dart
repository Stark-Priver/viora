import 'dart:ffi' hide Size;
import 'dart:io';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sqlite3/open.dart';

import 'package:viora/core/database/app_database.dart';
import 'package:viora/core/database/database_provider.dart';
import 'package:viora/main.dart';

Future<void> _pumpAt(WidgetTester tester, Size size) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  // Widget tests must never touch the real on-device database — an
  // isolated in-memory one keeps assertions deterministic regardless of
  // whatever the app has actually persisted from manual testing.
  final testDb = AppDatabase.forTesting(NativeDatabase.memory());
  addTearDown(testDb.close);

  await tester.pumpWidget(
    ProviderScope(
      overrides: [databaseProvider.overrideWithValue(testDb)],
      child: const VioraApp(),
    ),
  );
  await tester.pump();
}

/// Drift schedules a zero-duration `Timer` when a watched query stream is
/// cancelled (see `StreamQueryStore.markAsClosed`) — harmless in a real
/// app, but `flutter_test` asserts no timers are pending the instant a
/// test body returns. Tearing the tree down and pumping once *inside* the
/// test body (instead of leaving it to the framework's automatic
/// post-test teardown) gives that timer a chance to fire before the
/// assertion runs.
Future<void> _settle(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump(Duration.zero);
}

void main() {
  setUpAll(() {
    if (Platform.isLinux) {
      open.overrideFor(OperatingSystem.linux, () => DynamicLibrary.open('libsqlite3.so.0'));
    }
  });

  testWidgets('Desktop (1400x900): full grouped sidebar, no bottom nav', (tester) async {
    await _pumpAt(tester, const Size(1400, 900));

    expect(tester.takeException(), isNull);
    expect(find.text('viora'), findsWidgets);
    expect(find.textContaining('Good'), findsOneWidget);
    expect(find.text('TODAY'), findsOneWidget);
    expect(find.text('PLAN'), findsOneWidget);
    expect(find.text('LIFE'), findsOneWidget);
    expect(find.text('Nothing running right now'), findsOneWidget);
    expect(find.byIcon(IconsaxPlusBold.grid_1), findsWidgets);

    await _settle(tester);
  });

  testWidgets('Tablet (800x1024): icon rail, no group labels, no bottom nav', (tester) async {
    await _pumpAt(tester, const Size(800, 1024));

    expect(tester.takeException(), isNull);
    expect(find.text('viora'), findsWidgets);
    expect(find.text('TODAY'), findsNothing);
    expect(find.text('Nothing running right now'), findsOneWidget);

    await _settle(tester);
  });

  testWidgets('Mobile (390x844): bottom nav, no sidebar', (tester) async {
    await _pumpAt(tester, const Size(390, 844));

    expect(tester.takeException(), isNull);
    expect(find.text('viora'), findsOneWidget);
    expect(find.text('TODAY'), findsNothing);
    expect(find.text('Today'), findsOneWidget);
    expect(find.text('Nothing running right now'), findsOneWidget);
    expect(find.text('Goals'), findsWidgets);

    await _settle(tester);
  });
}
