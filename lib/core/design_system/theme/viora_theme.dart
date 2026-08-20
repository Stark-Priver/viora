import 'package:flutter/cupertino.dart' show CupertinoPageTransitionsBuilder;
import 'package:flutter/material.dart';
import '../tokens/typography.dart';
import 'viora_neu_theme.dart';

/// Builds the two [ThemeData] instances the app ships: light and dark.
/// Everything screen-level code needs — colors, type, shapes — comes from
/// here or from [VioraNeuTheme]; never hardcode a [Color] in a screen.
class VioraTheme {
  VioraTheme._();

  static ThemeData light() => _build(VioraNeuTheme.light, Brightness.light);
  static ThemeData dark() => _build(VioraNeuTheme.dark, Brightness.dark);

  static ThemeData _build(VioraNeuTheme neu, Brightness brightness) {
    final textTheme = VioraTypography.textTheme(neu.textPrimary, neu.textSecondary);

    final colorScheme = ColorScheme.fromSeed(
      seedColor: neu.brand,
      brightness: brightness,
    ).copyWith(
      primary: neu.brand,
      onPrimary: neu.brandOn,
      secondary: neu.info,
      onSecondary: neu.brandOn,
      error: neu.danger,
      onError: neu.brandOn,
      surface: neu.surface,
      onSurface: neu.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: neu.background,
      canvasColor: neu.background,
      colorScheme: colorScheme,
      textTheme: textTheme,
      fontFamily: textTheme.bodyMedium?.fontFamily,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      dividerColor: neu.divider,
      iconTheme: IconThemeData(color: neu.textSecondary, size: 22),
      visualDensity: VisualDensity.standard,
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: const ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: const ZoomPageTransitionsBuilder(),
          TargetPlatform.linux: const ZoomPageTransitionsBuilder(),
          TargetPlatform.windows: const ZoomPageTransitionsBuilder(),
        },
      ),
      extensions: [neu],
    );
  }
}
