import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';
import '../tokens/spacing.dart';
import '../tokens/breakpoints.dart';
import '../widgets/viora_icon_button.dart';
import '../widgets/viora_toast.dart';
import 'viora_nav.dart';
import 'viora_wordmark.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

/// Responsive application shell: persistent grouped sidebar on desktop, an
/// icon rail on tablet, and a bottom nav bar on mobile — all driven by the
/// same [vioraNavGroups] data so the three layouts never drift apart.
///
/// Selection is derived from the router's current location ([currentPath]),
/// not local state — so deep links and back/forward navigation keep the
/// nav in sync automatically.
class VioraAppShell extends StatelessWidget {
  const VioraAppShell({
    super.key,
    required this.child,
    required this.currentPath,
    required this.onNavigate,
    required this.themeMode,
    required this.onToggleTheme,
  });

  final Widget child;
  final String currentPath;
  final ValueChanged<String> onNavigate;
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  void _select(BuildContext context, VioraNavItem item) {
    if (!item.enabled) {
      VioraToast.show(context, '${item.label} is on the way — Phase 2+ of the build.', icon: IconsaxPlusBroken.timer_start);
      return;
    }
    onNavigate(item.path!);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    void onSelect(VioraNavItem item) => _select(context, item);

    if (VioraBreakpoints.isDesktop(width)) {
      return _DesktopShell(selected: currentPath, onSelect: onSelect, themeMode: themeMode, onToggleTheme: onToggleTheme, child: child);
    }
    if (VioraBreakpoints.isTablet(width)) {
      return _TabletShell(selected: currentPath, onSelect: onSelect, themeMode: themeMode, onToggleTheme: onToggleTheme, child: child);
    }
    return _MobileShell(selected: currentPath, onSelect: onSelect, themeMode: themeMode, onToggleTheme: onToggleTheme, child: child);
  }
}

class _TopBarActions extends StatelessWidget {
  const _TopBarActions({required this.themeMode, required this.onToggleTheme});

  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        VioraIconButton(
          icon: IconsaxPlusBroken.search_normal,
          tooltip: 'Search (Ctrl+K)',
          onPressed: () => VioraToast.show(context, 'Universal search — coming soon.'),
        ),
        const SizedBox(width: VioraSpacing.sm),
        VioraIconButton(
          icon: themeMode == ThemeMode.dark ? IconsaxPlusBold.moon : IconsaxPlusBroken.sun_1,
          tooltip: 'Toggle theme',
          onPressed: onToggleTheme,
        ),
      ],
    );
  }
}

class _DesktopShell extends StatelessWidget {
  const _DesktopShell({
    required this.child,
    required this.selected,
    required this.onSelect,
    required this.themeMode,
    required this.onToggleTheme,
  });

  final Widget child;
  final String selected;
  final ValueChanged<VioraNavItem> onSelect;
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    return Scaffold(
      backgroundColor: neu.background,
      body: Row(
        children: [
          Container(
            width: 248,
            padding: const EdgeInsets.symmetric(vertical: VioraSpacing.xl2, horizontal: VioraSpacing.lg),
            decoration: BoxDecoration(
              color: neu.background,
              border: Border(right: BorderSide(color: neu.divider, width: 1)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: VioraSpacing.sm),
                  child: VioraWordmark(fontSize: 21),
                ),
                const SizedBox(height: VioraSpacing.xl2),
                Expanded(
                  child: ListView(
                    children: [
                      for (final group in vioraNavGroups) ...[
                        Padding(
                          padding: const EdgeInsets.only(left: VioraSpacing.sm, bottom: VioraSpacing.sm, top: VioraSpacing.lg),
                          child: Text(group.label, style: Theme.of(context).textTheme.labelSmall),
                        ),
                        for (final item in group.items)
                          _SidebarTile(item: item, selected: item.path == selected, onTap: () => onSelect(item)),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(VioraSpacing.xl3, VioraSpacing.lg, VioraSpacing.xl3, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [_TopBarActions(themeMode: themeMode, onToggleTheme: onToggleTheme)],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1080),
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarTile extends StatelessWidget {
  const _SidebarTile({required this.item, required this.selected, required this.onTap});

  final VioraNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final color = selected ? neu.brand : (item.enabled ? neu.textSecondary : neu.textTertiary);

    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.md, vertical: VioraSpacing.sm + 2),
            decoration: BoxDecoration(
              color: selected ? neu.surfaceSunken : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(item.icon, size: 19, color: color),
                const SizedBox(width: VioraSpacing.md),
                Expanded(
                  child: Text(
                    item.label,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: color,
                          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                        ),
                  ),
                ),
                if (!item.enabled)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(color: neu.surfaceSunken, borderRadius: BorderRadius.circular(6)),
                    child: Text('soon', style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 9)),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabletShell extends StatelessWidget {
  const _TabletShell({
    required this.child,
    required this.selected,
    required this.onSelect,
    required this.themeMode,
    required this.onToggleTheme,
  });

  final Widget child;
  final String selected;
  final ValueChanged<VioraNavItem> onSelect;
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final allItems = vioraAllNavItems;

    return Scaffold(
      backgroundColor: neu.background,
      body: Row(
        children: [
          Container(
            width: 84,
            padding: const EdgeInsets.symmetric(vertical: VioraSpacing.xl2),
            decoration: BoxDecoration(color: neu.background, border: Border(right: BorderSide(color: neu.divider))),
            child: Column(
              children: [
                const VioraWordmark(fontSize: 16),
                const SizedBox(height: VioraSpacing.xl2),
                Expanded(
                  child: ListView(
                    children: [
                      for (final item in allItems)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: VioraIconButton(
                            icon: item.icon,
                            selected: item.path == selected,
                            tooltip: item.label,
                            onPressed: () => onSelect(item),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(VioraSpacing.xl2, VioraSpacing.lg, VioraSpacing.xl2, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [_TopBarActions(themeMode: themeMode, onToggleTheme: onToggleTheme)],
                  ),
                ),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileShell extends StatelessWidget {
  const _MobileShell({
    required this.child,
    required this.selected,
    required this.onSelect,
    required this.themeMode,
    required this.onToggleTheme,
  });

  final Widget child;
  final String selected;
  final ValueChanged<VioraNavItem> onSelect;
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;

    return Scaffold(
      backgroundColor: neu.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.md, VioraSpacing.lg, VioraSpacing.md),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: neu.divider, width: 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const VioraWordmark(fontSize: 19),
                  _TopBarActions(themeMode: themeMode, onToggleTheme: onToggleTheme),
                ],
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, 0, VioraSpacing.lg, VioraSpacing.md),
          child: SizedBox(
            height: 76,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.sm),
                  decoration: BoxDecoration(
                    color: neu.surface,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(color: neu.darkShadow.withValues(alpha: 0.5), offset: const Offset(0, 6), blurRadius: 16),
                      BoxShadow(color: neu.lightShadow.withValues(alpha: 0.7), offset: const Offset(0, -3), blurRadius: 10),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (final item in vioraMobileNavItems)
                        if (item.isCentral)
                          const SizedBox(width: 56)
                        else
                          _BottomNavItem(item: item, selected: item.path == selected, onTap: () => onSelect(item)),
                    ],
                  ),
                ),
                for (final item in vioraMobileNavItems)
                  if (item.isCentral)
                    _CentralNavItem(item: item, selected: item.path == selected, onTap: () => onSelect(item)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The raised circular action in the middle of the bottom nav — floats
/// above the bar, thumb-reachable from either side, for the one
/// destination worth a beat of extra visual weight.
class _CentralNavItem extends StatelessWidget {
  const _CentralNavItem({required this.item, required this.selected, required this.onTap});

  final VioraNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [neu.brand, neu.brand.withValues(alpha: 0.85)],
            ),
            border: Border.all(color: neu.background, width: 4),
            boxShadow: [
              BoxShadow(color: neu.brand.withValues(alpha: 0.45), offset: const Offset(0, 6), blurRadius: 16),
            ],
          ),
          child: Icon(item.icon, size: 26, color: Colors.white),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({required this.item, required this.selected, required this.onTap});

  final VioraNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final color = selected ? neu.brand : neu.textTertiary;

    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.md, vertical: VioraSpacing.sm),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(item.icon, size: 22, color: color),
            const SizedBox(height: 3),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: selected ? 4 : 0,
              height: 4,
              decoration: BoxDecoration(color: neu.brand, shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
  }
}
