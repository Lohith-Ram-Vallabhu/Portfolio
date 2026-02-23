import 'dart:convert';

import 'package:url_launcher/url_launcher.dart' as UrlLauncherHelper;
import 'package:url_launcher/url_launcher.dart';

import '../../config/app_config.dart';

class WhatsAppHelper {
  static Future<void> sendMessage({
    required String name,
    required String email,
    required String message,
  }) async {
    final String whatsappMessage = Uri.encodeComponent(
      'Name: $name\nEmail: $email\nMessage: $message',
    );

    final String url =
        'https://wa.me/${AppConfig.whatsappNumber}?text=$whatsappMessage';

    await _launchUrl(url);
  }

  static Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
