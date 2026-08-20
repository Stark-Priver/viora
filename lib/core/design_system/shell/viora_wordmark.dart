import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';

/// The Viora wordmark: lowercase, no icon. Set in Fraunces — a characterful
/// display serif — deliberately distinct from Manrope (the UI body face),
/// the way a premium product's masthead reads differently from its
/// interface. Bundled as a local asset and referenced by plain
/// `fontFamily` (see `VioraTypography` for why this doesn't go through
/// `google_fonts`). Used anywhere the brand needs to appear in the shell
/// (sidebar, mobile top bar).
class VioraWordmark extends StatelessWidget {
  const VioraWordmark({super.key, this.fontSize = 20});

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    return Text(
      'viora',
      style: TextStyle(
        fontFamily: 'Fraunces',
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
        letterSpacing: -0.3,
        height: 1,
        color: neu.textPrimary,
      ),
    );
  }
}
