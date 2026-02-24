import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../config/theme_config.dart';
import '../core/extensions/responsive_extension.dart';
import '../features/about/about_section.dart';
import '../features/contact/contact_section.dart';
import '../features/experience/experience_section.dart';
import '../features/home/home_section.dart';
import '../features/projects/project_section.dart';
import '../features/skills/skill_section.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '${AppConfig.name} - Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: ThemeConfig.background,
        colorScheme: const ColorScheme.dark(
          primary: ThemeConfig.primary,
          surface: ThemeConfig.surface,
        ),
        fontFamily: 'Outfit', // We'll add GoogleFonts in main.dart
      ),
      home: const PortfolioScaffold(),
    );
  }
}

class PortfolioScaffold extends StatefulWidget {
  const PortfolioScaffold({super.key});

  @override
  State<PortfolioScaffold> createState() => _PortfolioScaffoldState();
}

class _PortfolioScaffoldState extends State<PortfolioScaffold> {
  final ScrollController _scrollController = ScrollController();
  
  // Keys for scrolling
  final _homeKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildNavBar(context),
      body: Container(
        decoration: const BoxDecoration(
          gradient: ThemeConfig.backgroundGradient,
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              SizedBox(key: _homeKey, child: const HomeSection()),
              SizedBox(key: _aboutKey, child: const AboutSection()),
              SizedBox(key: _experienceKey, child: const ExperienceSection()),
              SizedBox(key: _skillsKey, child: const SkillSection()),
              SizedBox(key: _projectsKey, child: const ProjectSection()),
              SizedBox(key: _contactKey, child: const ContactSection()),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildNavBar(BuildContext context) {
    final navItems = [
      _NavItem('Home', () => _scrollTo(_homeKey)),
      _NavItem('About', () => _scrollTo(_aboutKey)),
      _NavItem('Experience', () => _scrollTo(_experienceKey)),
      _NavItem('Skills', () => _scrollTo(_skillsKey)),
      _NavItem('Projects', () => _scrollTo(_projectsKey)),
      _NavItem('Contact', () => _scrollTo(_contactKey)),
    ];

    return AppBar(
      backgroundColor: ThemeConfig.background.withAlpha(200),
      elevation: 0,
      centerTitle: false,
      title: Text(
        '${AppConfig.shortName} < / >',
        style: const TextStyle(
          color: ThemeConfig.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
      actions: context.isDesktop
          ? [
              Padding(
                padding: const EdgeInsets.only(right: ThemeConfig.spacingLarge),
                child: Row(
                  children: navItems.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: ThemeConfig.spacingMedium),
                      child: TextButton(
                        onPressed: item.onTap,
                        style: TextButton.styleFrom(
                          foregroundColor: ThemeConfig.textPrimary,
                        ),
                        child: Text(
                          item.title,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            ]
          : null,
      iconTheme: const IconThemeData(color: ThemeConfig.primary),
    );
  }
}

class _NavItem {
  final String title;
  final VoidCallback onTap;

  _NavItem(this.title, this.onTap);
}
