import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/design_system/theme/viora_theme.dart';
import 'core/design_system/theme/theme_controller.dart';
import 'core/routing/app_router.dart';
import 'core/sync/local_backup.dart';
import 'core/sync/sync_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Must run before the database opens, in case a Google Drive/Supabase
  // restore was staged on a previous run.
  if (!kIsWeb) {
    await LocalBackup.applyPendingRestoreIfAny();
  }

  if (SyncConfig.isSupabaseConfigured) {
    await Supabase.initialize(url: SyncConfig.supabaseUrl, publishableKey: SyncConfig.supabaseAnonKey);
  }

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
