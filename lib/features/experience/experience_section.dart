import 'package:flutter/material.dart';
import '../../config/experience_config.dart';
import '../../config/theme_config.dart';
import '../../core/animations/fade_slide_y.dart';
import '../../core/extensions/responsive_extension.dart';
import '../../core/widgets/section_title.dart';
import 'widgets/experience_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
          const FadeSlideY(child: SectionTitle(title: 'Experience')),
          const SizedBox(height: ThemeConfig.spacingLarge * 2),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: ExperienceConfig.experiences.asMap().entries.map((entry) {
                final index = entry.key;
                final experience = entry.value;

                return Padding(
                  padding: const EdgeInsets.only(bottom: ThemeConfig.spacingLarge),
                  child: FadeSlideY(
                    delay: 0.1 * (index + 1),
                    child: ExperienceCard(experience: experience),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
