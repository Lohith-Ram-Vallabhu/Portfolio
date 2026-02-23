import 'package:flutter/material.dart';
import '../../config/project_config.dart';
import '../../config/theme_config.dart';
import '../../core/animations/fade_slide_y.dart';
import '../../core/animations/hover_scale.dart';
import '../../core/extensions/responsive_extension.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/section_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.responsive(ThemeConfig.spacingMedium, ThemeConfig.spacingLarge, ThemeConfig.sectionPadding),
        vertical: ThemeConfig.sectionPadding,
      ),
      child: Column(
        children: [
          const FadeSlideY(child: SectionTitle(title: 'My Projects')),
          const SizedBox(height: ThemeConfig.spacingLarge * 2),
          
          Wrap(
            alignment: WrapAlignment.center,
            spacing: ThemeConfig.spacingLarge,
            runSpacing: ThemeConfig.spacingLarge,
            children: List.generate(
              ProjectConfig.projects.length,
              (index) => FadeSlideY(
                delay: 0.1 * (index + 1),
                child: _ProjectCard(project: ProjectConfig.projects[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;

  const _ProjectCard({required this.project});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardWidth = context.responsive(double.infinity, 350, 400);

    return HoverScale(
      scale: 1.03,
      child: Container(
        width: cardWidth,
        decoration: BoxDecoration(
          color: ThemeConfig.surface,
          borderRadius: BorderRadius.circular(ThemeConfig.borderRadius),
          border: Border.all(color: ThemeConfig.primary.withAlpha(30)),
          boxShadow: [
            BoxShadow(
              color: ThemeConfig.background.withAlpha(200),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Project Image placeholder
            Container(
              height: 200,
              width: double.infinity,
              color: ThemeConfig.background,
              child: const Center(
                child: Icon(Icons.image, color: ThemeConfig.textSecondary, size: 50),
              ), // Use NetworkImage/AssetImage in reality
            ),
            
            Padding(
              padding: const EdgeInsets.all(ThemeConfig.spacingLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: const TextStyle(
                      color: ThemeConfig.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: ThemeConfig.spacingSmall),
                  Text(
                    project.description,
                    style: const TextStyle(
                      color: ThemeConfig.textSecondary,
                      fontSize: 14,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: ThemeConfig.spacingMedium),
                  
                  // Tags
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: project.tags.map((tag) => _buildTag(tag)).toList(),
                  ),
                  
                  const SizedBox(height: ThemeConfig.spacingLarge),
                  
                  // Buttons
                  Row(
                    children: [
                      if (project.githubUrl.isNotEmpty)
                        Expanded(
                          child: CustomButton(
                            text: 'Repository',
                            icon: FontAwesomeIcons.github,
                            isPrimary: false,
                            onPressed: () => _launchUrl(project.githubUrl),
                          ),
                        ),
                        
                      if (project.githubUrl.isNotEmpty && project.demoUrl.isNotEmpty)
                        const SizedBox(width: ThemeConfig.spacingSmall),
                        
                      if (project.demoUrl.isNotEmpty)
                        Expanded(
                          child: CustomButton(
                            text: 'Demo',
                            icon: Icons.play_arrow,
                            isPrimary: true,
                            onPressed: () => _launchUrl(project.demoUrl),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: ThemeConfig.primary.withAlpha(30),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ThemeConfig.primary.withAlpha(50)),
      ),
      child: Text(
        tag,
        style: const TextStyle(
          color: ThemeConfig.primary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
