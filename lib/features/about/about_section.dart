import 'package:flutter/material.dart';
import '../../config/app_config.dart';
import '../../config/theme_config.dart';
import '../../core/animations/fade_slide_y.dart';
import '../../core/extensions/responsive_extension.dart';
import '../../core/widgets/section_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
          const FadeSlideY(child: SectionTitle(title: 'About Me')),
          const SizedBox(height: ThemeConfig.spacingLarge * 2),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: ThemeConfig.spacingLarge * 2,
            runSpacing: ThemeConfig.spacingLarge * 2,
            children: [
              // Avatar Image placeholder - customizable in references
              FadeSlideY(
                delay: 0.1,
                child: Container(
                  width: context.responsive(250, 300, 350),
                  height: context.responsive(250, 300, 350),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ThemeConfig.primary.withAlpha(50),
                      width: 2,
                    ),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/profile.webp',
                      ), // Replace or remove
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: ThemeConfig.primary.withAlpha(20),
                        blurRadius: 50,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),

              // Bio content
              SizedBox(
                width: context.isDesktop ? 600 : double.infinity,
                child: Column(
                  crossAxisAlignment: context.isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    FadeSlideY(
                      delay: 0.2,
                      child: Text(
                        'I\'m ${AppConfig.name}',
                        style: TextStyle(
                          fontSize: context.responsive(24, 28, 32),
                          fontWeight: FontWeight.bold,
                          color: ThemeConfig.primary,
                        ),
                        textAlign: context.isMobile
                            ? TextAlign.center
                            : TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: ThemeConfig.spacingMedium),
                    FadeSlideY(
                      delay: 0.3,
                      child: Text(
                        AppConfig.bio,
                        style: TextStyle(
                          fontSize: context.responsive(16, 16, 18),
                          color: ThemeConfig.textSecondary,
                          height: 1.8,
                        ),
                        textAlign: context.isMobile
                            ? TextAlign.center
                            : TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: ThemeConfig.spacingLarge),
                    FadeSlideY(delay: 0.4, child: _buildInfoCards(context)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCards(BuildContext context) {
    return Column(
      children: [
        _InfoCard(
          icon: FontAwesomeIcons.laptopCode,
          title: 'Web Application Development',
        ),
        const SizedBox(height: ThemeConfig.spacingMedium),
        _InfoCard(
          icon: FontAwesomeIcons.mobileScreen,
          title: 'Mobile Application Development',
        ),
        const SizedBox(height: ThemeConfig.spacingMedium),
        _InfoCard(icon: FontAwesomeIcons.lightbulb, title: 'Problem Solving'),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _InfoCard({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeConfig.spacingMedium,
        vertical: ThemeConfig.spacingMedium,
      ),
      decoration: BoxDecoration(
        color: ThemeConfig.surface,
        borderRadius: BorderRadius.circular(ThemeConfig.borderRadiusSmall),
        border: Border.all(color: ThemeConfig.primary.withAlpha(30)),
      ),
      child: Row(
        children: [
          FaIcon(icon, color: ThemeConfig.primary, size: 24),
          const SizedBox(width: ThemeConfig.spacingMedium),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: ThemeConfig.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
