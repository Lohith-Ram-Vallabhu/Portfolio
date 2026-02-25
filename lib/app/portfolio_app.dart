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
        fontFamily: 'Outfit',
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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

  void _scrollToAndClose(GlobalKey key) {
    _scaffoldKey.currentState?.closeDrawer();
    // Small delay so the drawer animation feels smooth before scroll
    Future.delayed(const Duration(milliseconds: 300), () => _scrollTo(key));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<_NavItem> _buildNavItems({required bool closeDrawerOnTap}) {
    return [
      _NavItem('Home', () => closeDrawerOnTap ? _scrollToAndClose(_homeKey) : _scrollTo(_homeKey)),
      _NavItem('About', () => closeDrawerOnTap ? _scrollToAndClose(_aboutKey) : _scrollTo(_aboutKey)),
      _NavItem('Experience', () => closeDrawerOnTap ? _scrollToAndClose(_experienceKey) : _scrollTo(_experienceKey)),
      _NavItem('Skills', () => closeDrawerOnTap ? _scrollToAndClose(_skillsKey) : _scrollTo(_skillsKey)),
      _NavItem('Projects', () => closeDrawerOnTap ? _scrollToAndClose(_projectsKey) : _scrollTo(_projectsKey)),
      _NavItem('Contact', () => closeDrawerOnTap ? _scrollToAndClose(_contactKey) : _scrollTo(_contactKey)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final navItems = _buildNavItems(closeDrawerOnTap: false);
    final drawerItems = _buildNavItems(closeDrawerOnTap: true);

    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      // Mobile/tablet drawer
      drawer: context.isDesktop
          ? null
          : _buildDrawer(drawerItems),
      appBar: _buildNavBar(context, navItems),
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

  Widget _buildDrawer(List<_NavItem> items) {
    return Drawer(
      backgroundColor: ThemeConfig.surface,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drawer header
            Padding(
              padding: const EdgeInsets.all(ThemeConfig.spacingLarge),
              child: Text(
                '${AppConfig.shortName} < / >',
                style: const TextStyle(
                  color: ThemeConfig.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
            Divider(color: ThemeConfig.primary.withValues(alpha: 0.2), thickness: 1),
            const SizedBox(height: ThemeConfig.spacingMedium),
            // Nav items
            ...items.map((item) => InkWell(
              onTap: item.onTap,
              borderRadius: BorderRadius.circular(ThemeConfig.borderRadiusSmall),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: ThemeConfig.spacingLarge,
                  vertical: ThemeConfig.spacingMedium,
                ),
                child: Text(
                  item.title,
                  style: const TextStyle(
                    color: ThemeConfig.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildNavBar(BuildContext context, List<_NavItem> navItems) {
    return AppBar(
      backgroundColor: ThemeConfig.background.withValues(alpha: 0.85),
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
      // On mobile/tablet show hamburger that opens the drawer
      leading: context.isDesktop
          ? null
          : IconButton(
              icon: const Icon(Icons.menu, color: ThemeConfig.primary),
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
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

