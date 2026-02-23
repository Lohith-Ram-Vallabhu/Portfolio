import 'package:flutter/material.dart';
import '../../config/skill_config.dart';
import '../../config/theme_config.dart';
import '../../core/animations/fade_slide_y.dart';
import '../../core/animations/hover_scale.dart';
import '../../core/extensions/responsive_extension.dart';
import '../../core/widgets/section_title.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

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
          const FadeSlideY(child: SectionTitle(title: 'My Skills')),
          const SizedBox(height: ThemeConfig.spacingLarge * 2),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: ThemeConfig.spacingLarge * 2,
            runSpacing: ThemeConfig.spacingLarge,
            children: [
              FadeSlideY(
                delay: 0.1,
                child: SizedBox(
                  width: context.isDesktop ? 400 : double.infinity,
                  child: _buildSkillCategory(
                    'Programming Languages',
                    SkillConfig.programmingLanguages,
                  ),
                ),
              ),
              FadeSlideY(
                delay: 0.2,
                child: SizedBox(
                  width: context.isDesktop ? 400 : double.infinity,
                  child: _buildSkillCategory(
                    'Frameworks & Tools',
                    SkillConfig.frameworks,
                  ),
                ),
              ),
              FadeSlideY(
                delay: 0.2,
                child: SizedBox(
                  width: context.isDesktop ? 400 : double.infinity,
                  child: _buildSkillCategory(
                    'Tools & Platforms',
                    SkillConfig.toolsAndPlatforms,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(String title, List<Skill> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*Text(
          title,
          style: const TextStyle(
            color: ThemeConfig.primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),*/
        const SizedBox(height: ThemeConfig.spacingMedium),
        ...skills.map((skill) => _SkillItem(skill: skill)),
      ],
    );
  }
}

class _SkillItem extends StatelessWidget {
  final Skill skill;

  const _SkillItem({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: ThemeConfig.spacingMedium),
      child: HoverScale(
        scale: 1.02,
        child: Container(
          padding: const EdgeInsets.all(ThemeConfig.spacingMedium),
          decoration: BoxDecoration(
            color: ThemeConfig.surface,
            borderRadius: BorderRadius.circular(ThemeConfig.borderRadiusSmall),
            border: Border.all(color: skill.glowColor.withAlpha(30)),
          ),
          child: Row(
            children: [
              Icon(skill.icon, color: skill.glowColor, size: 28),
              const SizedBox(width: ThemeConfig.spacingMedium),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skill.name,
                      style: const TextStyle(
                        color: ThemeConfig.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: ThemeConfig.spacingSmall / 2),
                    _buildSkillDots(skill),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillDots(Skill skill) {
    int activeDots = _getDotsForLevel(skill.level);

    return Row(
      children: List.generate(
        10,
        (index) => Container(
          margin: const EdgeInsets.only(right: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index < activeDots
                ? skill.glowColor
                : ThemeConfig.textSecondary.withAlpha(50),
            boxShadow: index < activeDots
                ? [
                    BoxShadow(
                      color: skill.glowColor.withAlpha(100),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ]
                : null,
          ),
        ),
      ),
    );
  }

  int _getDotsForLevel(SkillLevel level) {
    switch (level) {
      case SkillLevel.basic:
        return 3;
      case SkillLevel.intermediate:
        return 5;
      case SkillLevel.advanced:
        return 7;
      case SkillLevel.expert:
        return 9;
    }
  }
}
