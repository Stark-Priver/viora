import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'viora_nav.dart';

const _prefsKey = 'viora.bottom_nav_paths';
const maxBottomNavItems = 5;

const defaultBottomNavPaths = <String>['/', '/tasks', '/focus', '/money', '/more'];

/// User-configurable bottom nav — Settings lets a user pick up to
/// [maxBottomNavItems] destinations out of every shipped module. The
/// middle one of whatever's selected renders as the raised central action
/// (see `_MobileShell` in viora_app_shell.dart).
class BottomNavController extends Notifier<List<String>> {
  @override
  List<String> build() {
    _restore();
    return defaultBottomNavPaths;
  }

  Future<void> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_prefsKey);
    if (stored == null) return;
    final paths = stored.split(',').where((p) => p.isNotEmpty).toList();
    if (paths.isNotEmpty) state = paths;
  }

  Future<void> toggle(String path) async {
    final current = List<String>.from(state);
    if (current.contains(path)) {
      if (current.length <= 1) return; // always keep at least one destination
      current.remove(path);
    } else {
      if (current.length >= maxBottomNavItems) return;
      current.add(path);
    }
    state = current;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, current.join(','));
  }

  Future<void> reset() async {
    state = defaultBottomNavPaths;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, defaultBottomNavPaths.join(','));
  }
}

final bottomNavPathsProvider = NotifierProvider<BottomNavController, List<String>>(BottomNavController.new);

/// Resolves the selected paths to their [VioraNavItem]s, in selection
/// order — the source of truth `_MobileShell` renders from.
final bottomNavItemsProvider = Provider<List<VioraNavItem>>((ref) {
  final paths = ref.watch(bottomNavPathsProvider);
  final byPath = {for (final item in vioraAllSelectableNavItems) item.path: item};
  return paths.map((p) => byPath[p]).whereType<VioraNavItem>().toList();
});
