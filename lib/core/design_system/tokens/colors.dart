import 'package:flutter/material.dart';

/// Raw color palette for Viora. Never reference these directly from feature
/// code — go through [VioraNeuTheme] / [Theme.of(context)] so light/dark
/// and semantic meaning stay correct.
class VioraColors {
  VioraColors._();

  // Brand — warm coral-red, carried over from the reference mood board.
  static const red50 = Color(0xFFFDECE9);
  static const red100 = Color(0xFFFBD5CE);
  static const red200 = Color(0xFFF5AA9C);
  static const red300 = Color(0xFFEF7F6A);
  static const red400 = Color(0xFFE9614A);
  static const red500 = Color(0xFFE5483A); // primary brand
  static const red600 = Color(0xFFCC3B2E);
  static const red700 = Color(0xFFA82F25);
  static const red800 = Color(0xFF84251D);
  static const red900 = Color(0xFF5C1A14);

  // Warm neutrals — light theme surfaces.
  static const neutral0 = Color(0xFFFFFFFF);
  static const neutral25 = Color(0xFFFCFAF8);
  static const neutral50 = Color(0xFFF7F4EF);
  static const neutral75 = Color(0xFFF1ECE5);
  static const neutral100 = Color(0xFFEAE4DA);
  static const neutral200 = Color(0xFFDCD4C7);
  static const neutral300 = Color(0xFFC5BAA8);
  static const neutral400 = Color(0xFFA6998A);
  static const neutral500 = Color(0xFF897D6E);
  static const neutral600 = Color(0xFF6D6255);
  static const neutral700 = Color(0xFF534A40);
  static const neutral800 = Color(0xFF39332B);
  static const neutral900 = Color(0xFF251F1A);

  // Deep charcoal — dark theme surfaces.
  static const dark950 = Color(0xFF0F1013);
  static const dark900 = Color(0xFF15161A);
  static const dark800 = Color(0xFF1B1D22);
  static const dark700 = Color(0xFF23262C);
  static const dark600 = Color(0xFF2C2F37);
  static const dark500 = Color(0xFF3B3F49);
  static const dark400 = Color(0xFF565B66);
  static const dark300 = Color(0xFF7A808A);
  static const dark200 = Color(0xFFA6ABB3);
  static const dark100 = Color(0xFFD2D5DA);
  static const dark50 = Color(0xFFF2F2F4);

  // Semantic — light variants
  static const successLight = Color(0xFF2E9E6B);
  static const warningLight = Color(0xFFC98419);
  static const infoLight = Color(0xFF3E7BD9);
  static const dangerLight = red500;

  // Semantic — dark variants
  static const successDark = Color(0xFF45C384);
  static const warningDark = Color(0xFFE8A23D);
  static const infoDark = Color(0xFF6C9CF2);
  static const dangerDark = Color(0xFFFF6A54);

  // Life-domain accent colors (used consistently across timeline, calendar,
  // analytics — one color always means the same domain).
  static const domainWork = Color(0xFF3E7BD9);
  static const domainStudy = Color(0xFF7C5CE0);
  static const domainBusiness = Color(0xFFC98419);
  static const domainHealth = Color(0xFF2E9E6B);
  static const domainFinance = Color(0xFF1E9E8C);
  static const domainSocial = Color(0xFFE0609E);
  static const domainGaming = Color(0xFF8A5CF2);
  static const domainTransport = Color(0xFF5C7A99);
  static const domainSleep = Color(0xFF5C6BC0);
  static const domainScreen = Color(0xFF9E9384);
}
