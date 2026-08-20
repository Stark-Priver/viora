import 'package:flutter/material.dart';

/// Type scale. Manrope for a geometric, premium feel that reads calm at
/// small sizes and confident at display sizes. Bundled as a local asset
/// (see pubspec.yaml) and referenced by plain `fontFamily` — deliberately
/// not going through the `google_fonts` package, which insists on finding
/// assets under its own internal per-weight file-naming convention rather
/// than Flutter's normal font-family resolution.
class VioraTypography {
  VioraTypography._();

  static const _fontFamily = 'Manrope';

  static TextTheme textTheme(Color primary, Color secondary) {
    TextStyle base(double size, FontWeight weight, {double? height, double? spacing}) {
      return TextStyle(
        fontFamily: _fontFamily,
        fontSize: size,
        fontWeight: weight,
        height: height,
        letterSpacing: spacing,
        color: primary,
      );
    }

    return TextTheme(
      displayLarge: base(40, FontWeight.w700, height: 1.1, spacing: -0.5),
      displayMedium: base(32, FontWeight.w700, height: 1.15, spacing: -0.4),
      displaySmall: base(26, FontWeight.w700, height: 1.2, spacing: -0.3),
      headlineLarge: base(24, FontWeight.w700, height: 1.25),
      headlineMedium: base(20, FontWeight.w700, height: 1.3),
      headlineSmall: base(18, FontWeight.w600, height: 1.3),
      titleLarge: base(17, FontWeight.w600, height: 1.35),
      titleMedium: base(15, FontWeight.w600, height: 1.4),
      titleSmall: base(13, FontWeight.w600, height: 1.4),
      bodyLarge: base(16, FontWeight.w500, height: 1.5),
      bodyMedium: base(14, FontWeight.w500, height: 1.5),
      bodySmall: base(13, FontWeight.w500, height: 1.45).copyWith(color: secondary),
      labelLarge: base(14, FontWeight.w600, height: 1.3, spacing: 0.1),
      labelMedium: base(12, FontWeight.w600, height: 1.3, spacing: 0.2).copyWith(color: secondary),
      labelSmall: base(11, FontWeight.w600, height: 1.3, spacing: 0.3).copyWith(color: secondary),
    );
  }

  /// Large tabular figures for stat/metric readouts — numbers should never
  /// visually jitter as digits change width.
  static TextStyle metric(Color color, {double size = 34}) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: size,
      fontWeight: FontWeight.w800,
      height: 1.05,
      letterSpacing: -0.8,
      color: color,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
  }
}
