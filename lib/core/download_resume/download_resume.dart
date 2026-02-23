import 'package:url_launcher/url_launcher.dart';

Future<void> downloadResume() async {
  final uri = Uri.parse(
    'https://raw.githubusercontent.com/Lohith-Ram-Vallabhu/Resume/main/Vallabhu_Lohith_Ram_Full_Stack_Developer_Resume.pdf',
  );

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
