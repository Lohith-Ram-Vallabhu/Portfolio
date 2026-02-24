import 'package:flutter/material.dart';
import '../../../config/experience_config.dart';
import '../../../config/theme_config.dart';
import '../../../core/animations/hover_scale.dart';
import '../../../core/extensions/responsive_extension.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;

  const ExperienceCard({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return HoverScale(
      scale: 1.02,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          context.responsive(
            ThemeConfig.spacingMedium,
            ThemeConfig.spacingLarge,
            ThemeConfig.spacingLarge,
          ),
        ),
        decoration: BoxDecoration(
          color: ThemeConfig.surface,
          borderRadius: BorderRadius.circular(ThemeConfig.borderRadius),
          border: Border.all(
            color: ThemeConfig.primary.withAlpha(50),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        experience.role,
                        style: const TextStyle(
                          color: ThemeConfig.textPrimary,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: ThemeConfig.spacingSmall),
                      Text(
                        experience.company,
                        style: const TextStyle(
                          color: ThemeConfig.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ThemeConfig.spacingMedium,
                    vertical: ThemeConfig.spacingSmall,
                  ),
                  decoration: BoxDecoration(
                    color: ThemeConfig.primary.withAlpha(20),
                    borderRadius: BorderRadius.circular(ThemeConfig.borderRadiusSmall),
                  ),
                  child: Text(
                    experience.duration,
                    style: const TextStyle(
                      color: ThemeConfig.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: ThemeConfig.spacingLarge),
            Text(
              experience.description,
              style: const TextStyle(
                color: ThemeConfig.textSecondary,
                fontSize: 15,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
