import 'package:flutter/material.dart';
import '../../config/app_config.dart';
import '../../config/theme_config.dart';
import '../../core/animations/fade_slide_y.dart';
import '../../core/extensions/responsive_extension.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/section_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
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
                  _InputLabel(label: 'Name'),
                  const SizedBox(height: ThemeConfig.spacingSmall),
                  _CustomTextField(hint: 'John Doe'),

                  const SizedBox(height: ThemeConfig.spacingMedium),

                  _InputLabel(label: 'Email'),
                  const SizedBox(height: ThemeConfig.spacingSmall),
                  _CustomTextField(hint: 'john@example.com'),

                  const SizedBox(height: ThemeConfig.spacingMedium),

                  _InputLabel(label: 'Message'),
                  const SizedBox(height: ThemeConfig.spacingSmall),
                  _CustomTextField(
                    hint: 'Hello! I would like to...',
                    maxLines: 5,
                  ),

                  const SizedBox(height: ThemeConfig.spacingLarge),

                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      text: 'Send a message',
                      onPressed: () {
                        // Form submission logic
                      },
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
                FontAwesomeIcons.twitter,
                AppConfig.instagramUrl,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ThemeConfig.spacingSmall),
      child: IconButton(
        icon: FaIcon(icon, color: ThemeConfig.textSecondary, size: 24),
        onPressed: () => _launchUrl(url),
        hoverColor: ThemeConfig.glowColor.withAlpha(50),
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

  const _CustomTextField({required this.hint, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
