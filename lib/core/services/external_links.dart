import 'package:url_launcher/url_launcher.dart';

/// The project's public presence — kept in one place so the README and the
/// in-app "Support" card never drift apart.
class ExternalLinks {
  ExternalLinks._();

  static final github = Uri.parse('https://github.com/Stark-Priver');
  static final repo = Uri.parse('https://github.com/Stark-Priver/viora');
  static final youtube = Uri.parse('https://www.youtube.com/@de_priver');
  static final buyMeACoffee = Uri.parse('https://buymeacoffee.com/depriver');

  static Future<void> open(Uri uri) => launchUrl(uri, mode: LaunchMode.externalApplication);
}
