import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../config/app_config.dart';
import '../../config/theme_config.dart';
import '../../core/animations/fade_slide_y.dart';
import '../../core/download_resume/download_resume.dart';
import '../../core/extensions/responsive_extension.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/glossy_social_icon.dart';
import 'widgets/animated_avatar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: context.screenHeight * 0.9),
      padding: EdgeInsets.symmetric(
        horizontal: context.responsive(
          ThemeConfig.spacingMedium,
          ThemeConfig.spacingLarge,
          ThemeConfig.sectionPadding,
        ),
      ),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: ThemeConfig.spacingLarge * 2,
          runSpacing: ThemeConfig.spacingLarge * 2,
          children: [
            // Text Content
            SizedBox(
              width: context.isDesktop ? 600 : double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: context.isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  FadeSlideY(
                    delay: 0.1,
                    child: Text(
                      'Hi, I\'m ${AppConfig.shortName}',
                      style: TextStyle(
                        fontSize: context.responsive(40, 56, 72),
                        fontWeight: FontWeight.bold,
                        color: ThemeConfig.textPrimary,
                        height: 1.2,
                      ),
                      textAlign: context.isMobile
                          ? TextAlign.center
                          : TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: ThemeConfig.spacingSmall),
                  FadeSlideY(
                    delay: 0.2,
                    child: Builder(
                      builder: (context) {
                        return Text(
                          AppConfig.role,
                          style: TextStyle(
                            fontSize: context.responsive(24, 32, 40),
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            foreground: Paint()
                              ..shader = ThemeConfig.accentGradient
                                  .createShader(
                                    const Rect.fromLTWH(0, 0, 400, 50),
                                  ),
                          ),
                          textAlign: context.isMobile
                              ? TextAlign.center
                              : TextAlign.left,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: ThemeConfig.spacingMedium),
                  FadeSlideY(
                    delay: 0.3,
                    child: Text(
                      AppConfig.bio.split('\n').first,
                      style: TextStyle(
                        fontSize: context.responsive(16, 18, 20),
                        color: ThemeConfig.textSecondary,
                        height: 1.6,
                      ),
                      textAlign: context.isMobile
                          ? TextAlign.center
                          : TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: ThemeConfig.spacingLarge),
                  FadeSlideY(
                    delay: 0.4,
                    child: Row(
                      mainAxisAlignment: context.isMobile
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        CustomButton(
                          text: 'Download CV',
                          icon: Icons.download,
                          onPressed: downloadResume, // Handle CV download later
                        ),
                        const SizedBox(width: ThemeConfig.spacingMedium),
                        Row(
                          children: [
                            _buildSocialIcon(
                              FontAwesomeIcons.github,
                              AppConfig.githubUrl,
                            ),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Avatar image with floating interactive icons
            FadeSlideY(
              delay: 0.5,
              child: AnimatedAvatar(
                size: context.responsive(250, 350, 450),
                avatarImage: Image.asset(
                  'assets/images/low_light_profile.webp',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
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
      padding: const EdgeInsets.only(left: ThemeConfig.spacingMedium),
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
