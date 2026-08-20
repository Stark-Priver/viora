import 'package:flutter/material.dart';
import '../tokens/colors.dart';

/// Custom [ThemeExtension] carrying every token the neumorphic design
/// system needs that stock [ThemeData] has no slot for: shadow pairs,
/// surface base colors per elevation, and domain/semantic accents.
///
/// Access via `Theme.of(context).extension<VioraNeuTheme>()!` or the
/// `context.neu` shortcut below.
@immutable
class VioraNeuTheme extends ThemeExtension<VioraNeuTheme> {
  const VioraNeuTheme({
    required this.background,
    required this.surface,
    required this.surfaceRaised,
    required this.surfaceSunken,
    required this.lightShadow,
    required this.darkShadow,
    required this.divider,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.brand,
    required this.brandOn,
    required this.success,
    required this.warning,
    required this.info,
    required this.danger,
    required this.domainWork,
    required this.domainStudy,
    required this.domainBusiness,
    required this.domainHealth,
    required this.domainFinance,
    required this.domainSocial,
    required this.domainGaming,
    required this.domainTransport,
    required this.domainSleep,
    required this.domainScreen,
  });

  final Color background;
  final Color surface;
  final Color surfaceRaised;
  final Color surfaceSunken;
  final Color lightShadow;
  final Color darkShadow;
  final Color divider;

  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;

  final Color brand;
  final Color brandOn;

  final Color success;
  final Color warning;
  final Color info;
  final Color danger;

  final Color domainWork;
  final Color domainStudy;
  final Color domainBusiness;
  final Color domainHealth;
  final Color domainFinance;
  final Color domainSocial;
  final Color domainGaming;
  final Color domainTransport;
  final Color domainSleep;
  final Color domainScreen;

  static const light = VioraNeuTheme(
    background: VioraColors.neutral50,
    surface: VioraColors.neutral50,
    surfaceRaised: VioraColors.neutral50,
    surfaceSunken: VioraColors.neutral75,
    lightShadow: VioraColors.neutral0,
    darkShadow: Color(0xFFD3CABA),
    divider: VioraColors.neutral200,
    textPrimary: VioraColors.neutral900,
    textSecondary: VioraColors.neutral600,
    textTertiary: VioraColors.neutral400,
    brand: VioraColors.red500,
    brandOn: VioraColors.neutral0,
    success: VioraColors.successLight,
    warning: VioraColors.warningLight,
    info: VioraColors.infoLight,
    danger: VioraColors.dangerLight,
    domainWork: VioraColors.domainWork,
    domainStudy: VioraColors.domainStudy,
    domainBusiness: VioraColors.domainBusiness,
    domainHealth: VioraColors.domainHealth,
    domainFinance: VioraColors.domainFinance,
    domainSocial: VioraColors.domainSocial,
    domainGaming: VioraColors.domainGaming,
    domainTransport: VioraColors.domainTransport,
    domainSleep: VioraColors.domainSleep,
    domainScreen: VioraColors.domainScreen,
  );

  static const dark = VioraNeuTheme(
    background: VioraColors.dark900,
    surface: VioraColors.dark900,
    surfaceRaised: VioraColors.dark900,
    surfaceSunken: VioraColors.dark950,
    lightShadow: Color(0xFF33373F),
    darkShadow: Color(0xFF08090A),
    divider: VioraColors.dark700,
    textPrimary: VioraColors.dark50,
    textSecondary: VioraColors.dark200,
    textTertiary: VioraColors.dark300,
    brand: VioraColors.red400,
    brandOn: VioraColors.neutral0,
    success: VioraColors.successDark,
    warning: VioraColors.warningDark,
    info: VioraColors.infoDark,
    danger: VioraColors.dangerDark,
    domainWork: Color(0xFF6C9CF2),
    domainStudy: Color(0xFF9C86F0),
    domainBusiness: Color(0xFFE8A23D),
    domainHealth: Color(0xFF45C384),
    domainFinance: Color(0xFF3DBBAA),
    domainSocial: Color(0xFFEC85B5),
    domainGaming: Color(0xFFA786F5),
    domainTransport: Color(0xFF8AA3B8),
    domainSleep: Color(0xFF8891DE),
    domainScreen: Color(0xFFB6AC9B),
  );

  @override
  VioraNeuTheme copyWith({
    Color? background,
    Color? surface,
    Color? surfaceRaised,
    Color? surfaceSunken,
    Color? lightShadow,
    Color? darkShadow,
    Color? divider,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? brand,
    Color? brandOn,
    Color? success,
    Color? warning,
    Color? info,
    Color? danger,
    Color? domainWork,
    Color? domainStudy,
    Color? domainBusiness,
    Color? domainHealth,
    Color? domainFinance,
    Color? domainSocial,
    Color? domainGaming,
    Color? domainTransport,
    Color? domainSleep,
    Color? domainScreen,
  }) {
    return VioraNeuTheme(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceRaised: surfaceRaised ?? this.surfaceRaised,
      surfaceSunken: surfaceSunken ?? this.surfaceSunken,
      lightShadow: lightShadow ?? this.lightShadow,
      darkShadow: darkShadow ?? this.darkShadow,
      divider: divider ?? this.divider,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      brand: brand ?? this.brand,
      brandOn: brandOn ?? this.brandOn,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      danger: danger ?? this.danger,
      domainWork: domainWork ?? this.domainWork,
      domainStudy: domainStudy ?? this.domainStudy,
      domainBusiness: domainBusiness ?? this.domainBusiness,
      domainHealth: domainHealth ?? this.domainHealth,
      domainFinance: domainFinance ?? this.domainFinance,
      domainSocial: domainSocial ?? this.domainSocial,
      domainGaming: domainGaming ?? this.domainGaming,
      domainTransport: domainTransport ?? this.domainTransport,
      domainSleep: domainSleep ?? this.domainSleep,
      domainScreen: domainScreen ?? this.domainScreen,
    );
  }

  @override
  VioraNeuTheme lerp(ThemeExtension<VioraNeuTheme>? other, double t) {
    if (other is! VioraNeuTheme) return this;
    Color c(Color a, Color b) => Color.lerp(a, b, t)!;
    return VioraNeuTheme(
      background: c(background, other.background),
      surface: c(surface, other.surface),
      surfaceRaised: c(surfaceRaised, other.surfaceRaised),
      surfaceSunken: c(surfaceSunken, other.surfaceSunken),
      lightShadow: c(lightShadow, other.lightShadow),
      darkShadow: c(darkShadow, other.darkShadow),
      divider: c(divider, other.divider),
      textPrimary: c(textPrimary, other.textPrimary),
      textSecondary: c(textSecondary, other.textSecondary),
      textTertiary: c(textTertiary, other.textTertiary),
      brand: c(brand, other.brand),
      brandOn: c(brandOn, other.brandOn),
      success: c(success, other.success),
      warning: c(warning, other.warning),
      info: c(info, other.info),
      danger: c(danger, other.danger),
      domainWork: c(domainWork, other.domainWork),
      domainStudy: c(domainStudy, other.domainStudy),
      domainBusiness: c(domainBusiness, other.domainBusiness),
      domainHealth: c(domainHealth, other.domainHealth),
      domainFinance: c(domainFinance, other.domainFinance),
      domainSocial: c(domainSocial, other.domainSocial),
      domainGaming: c(domainGaming, other.domainGaming),
      domainTransport: c(domainTransport, other.domainTransport),
      domainSleep: c(domainSleep, other.domainSleep),
      domainScreen: c(domainScreen, other.domainScreen),
    );
  }
}

extension VioraNeuThemeContext on BuildContext {
  VioraNeuTheme get neu => Theme.of(this).extension<VioraNeuTheme>()!;
}
