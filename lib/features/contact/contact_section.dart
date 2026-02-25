import 'package:flutter/material.dart';
import '../../config/app_config.dart';
import '../../config/theme_config.dart';
import '../../core/animations/fade_slide_y.dart';
import '../../core/extensions/responsive_extension.dart';
import '../../core/whatsapp_sender/whatsapp_sender.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/glossy_social_icon.dart';
import '../../core/widgets/section_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.responsive(
          ThemeConfig.spacingMedium,
          ThemeConfig.spacingLarge,
          ThemeConfig.sectionPadding,
        ),
        vertical: ThemeConfig.sectionPadding,
      ),
      child: Column(
        children: [
          const FadeSlideY(child: SectionTitle(title: 'Contact')),
          const SizedBox(height: ThemeConfig.spacingLarge * 2),
          FadeSlideY(
            delay: 0.1,
            child: Container(
              width: context.isDesktop ? 600 : double.infinity,
              padding: const EdgeInsets.all(ThemeConfig.spacingLarge),
              decoration: BoxDecoration(
                color: ThemeConfig.surface,
                borderRadius: BorderRadius.circular(ThemeConfig.borderRadius),
                border: Border.all(color: ThemeConfig.primary.withAlpha(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _InputLabel(label: 'Name'),
                  const SizedBox(height: ThemeConfig.spacingSmall),
                  _CustomTextField(
                    hint: 'John Doe',
                    controller: _nameController,
                  ),
                  const SizedBox(height: ThemeConfig.spacingMedium),
                  const _InputLabel(label: 'Email'),
                  const SizedBox(height: ThemeConfig.spacingSmall),
                  _CustomTextField(
                    hint: 'john@example.com',
                    controller: _emailController,
                  ),
                  const SizedBox(height: ThemeConfig.spacingMedium),
                  const _InputLabel(label: 'Message'),
                  const SizedBox(height: ThemeConfig.spacingSmall),
                  _CustomTextField(
                    hint: 'Hello! I would like to...',
                    maxLines: 5,
                    controller: _messageController,
                  ),
                  const SizedBox(height: ThemeConfig.spacingLarge),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      text: 'Send a message',
                      onPressed: () => WhatsAppHelper.sendContactMessage(
                        name: _nameController.text,
                        email: _emailController.text,
                        message: _messageController.text,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: ThemeConfig.sectionPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(FontAwesomeIcons.github, AppConfig.githubUrl),
              _buildSocialIcon(
                FontAwesomeIcons.linkedinIn,
                AppConfig.linkedinUrl,
              ),
              _buildSocialIcon(
                FontAwesomeIcons.instagram,
                AppConfig.instagramUrl,
              ),
              _buildSocialIcon(
                FontAwesomeIcons.whatsapp,
                AppConfig.whatsAppUrl,
              ),
            ],
          ),
          const SizedBox(height: ThemeConfig.spacingLarge),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeConfig.spacingLarge,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${AppConfig.shortName} < / >',
                  style: const TextStyle(
                    color: ThemeConfig.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '© All rights reserved',
                  style: TextStyle(
                    color: ThemeConfig.textSecondary.withAlpha(150),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    Color iconColor = Colors.white;
    Color glowColor = Colors.white;

    if (icon == FontAwesomeIcons.github) {
      iconColor = Colors.white;
      glowColor = Colors.white;
    } else if (icon == FontAwesomeIcons.linkedinIn) {
      iconColor = const Color(0xFF0077b5);
      glowColor = const Color(0xFF0077b5);
    } else if (icon == FontAwesomeIcons.whatsapp) {
      iconColor = const Color(0xFF25D366);
      glowColor = const Color(0xFF25D366);
    } else if (icon == FontAwesomeIcons.instagram) {
      iconColor = const Color(0xFFE1306C);
      glowColor = const Color(0xFFE1306C);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ThemeConfig.spacingSmall),
      child: GlossySocialIcon(
        icon: icon,
        url: url,
        onTap: () => _launchUrl(url),
        iconColor: iconColor,
        glowColor: glowColor,
      ),
    );
  }
}

class _InputLabel extends StatelessWidget {
  final String label;

  const _InputLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: ThemeConfig.textPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;

  final TextEditingController? controller;

  const _CustomTextField({
    required this.hint,
    this.maxLines = 1,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: ThemeConfig.textPrimary),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: ThemeConfig.textSecondary),
        filled: true,
        fillColor: ThemeConfig.background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConfig.borderRadiusSmall),
          borderSide: BorderSide(
            color: ThemeConfig.textSecondary.withAlpha(50),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConfig.borderRadiusSmall),
          borderSide: BorderSide(
            color: ThemeConfig.textSecondary.withAlpha(50),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeConfig.borderRadiusSmall),
          borderSide: const BorderSide(color: ThemeConfig.primary),
        ),
      ),
    );
  }
}
