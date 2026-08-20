import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/design_system/theme/viora_theme.dart';
import 'core/design_system/theme/theme_controller.dart';
import 'core/routing/app_router.dart';

void main() {
  runApp(const ProviderScope(child: VioraApp()));
}

class VioraApp extends ConsumerWidget {
  const VioraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Viora',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: VioraTheme.light(),
      darkTheme: VioraTheme.dark(),
      routerConfig: router,
    );
  }
}
