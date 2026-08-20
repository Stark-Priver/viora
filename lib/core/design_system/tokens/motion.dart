import 'package:flutter/animation.dart';

/// Animation timing/curve tokens. Keep motion purposeful — it should aid
/// comprehension (a number counting up, a ring filling in), not decorate.
class VioraMotion {
  VioraMotion._();

  static const Duration instant = Duration(milliseconds: 90);
  static const Duration fast = Duration(milliseconds: 160);
  static const Duration medium = Duration(milliseconds: 280);
  static const Duration slow = Duration(milliseconds: 420);
  static const Duration counter = Duration(milliseconds: 900);

  static const Curve standard = Curves.easeOutCubic;
  static const Curve emphasized = Curves.easeOutQuint;
  static const Curve spring = Curves.easeOutBack;
}
