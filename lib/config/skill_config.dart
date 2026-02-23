import 'package:flutter/material.dart';

enum SkillLevel { basic, intermediate, advanced, expert }

class Skill {
  final String name;
  final IconData icon;
  final SkillLevel level;
  final Color glowColor;

  const Skill({
    required this.name,
    required this.icon,
    required this.level,
    this.glowColor = const Color(0x66A155FF), // Default violet glow
  });
}

class SkillConfig {
  static const List<Skill> programmingLanguages = [
    Skill(
      name: 'Dart',
      icon: Icons.code, // Replace with FontAwesomeIcons if desired
      level: SkillLevel.expert,
      glowColor: Color(0xFF00B4AB),
    ),
    Skill(
      name: 'JavaScript / TypeScript',
      icon: Icons.javascript,
      level: SkillLevel.intermediate,
      glowColor: Color(0xFFF7DF1E),
    ),
    Skill(
      name: 'Java Spring Boot',
      icon: Icons.verified_user,
      level: SkillLevel.expert,
      glowColor: Color(0xFF339933),
    ),
    Skill(
      name: 'Python',
      icon: Icons.terminal,
      level: SkillLevel.advanced,
      glowColor: Color(0xFF3776AB),
    ),
  ];

  static const List<Skill> toolsAndPlatforms = [
    Skill(
      name: 'Git / GitHub',
      icon: Icons.merge_type,
      level: SkillLevel.expert,
      glowColor: Color(0xFFF05032), // Git orange
    ),
    Skill(
      name: 'API Testing (Postman, Insomnia)',
      icon: Icons.api,
      level: SkillLevel.expert,
      glowColor: Color(0xFFFF6C37), // Postman orange
    ),
    Skill(
      name: 'Microservices Architecture',
      icon: Icons.hub,
      level: SkillLevel.advanced,
      glowColor: Color(0xFF6A1B9A), // Subtle purple
    ),
    Skill(
      name: 'Firebase Cloud Messaging (FCM)',
      icon: Icons.notifications_active,
      level: SkillLevel.advanced,
      glowColor: Color(0xFFFFCA28), // Firebase amber
    ),
  ];

  static const List<Skill> frameworks = [
    Skill(
      name: 'Flutter',
      icon: Icons.flutter_dash,
      level: SkillLevel.expert,
      glowColor: Color(0xFF02569B),
    ),
    Skill(
      name: 'React',
      icon: Icons.integration_instructions,
      level: SkillLevel.intermediate,
      glowColor: Color(0xFF61DAFB),
    ),
    Skill(
      name: 'MySQL',
      icon: Icons.storage,
      level: SkillLevel.expert,
      glowColor: Color(0xFF4479A1), // MySQL blue
    ),
    Skill(
      name: 'NoSql / Firebase',
      icon: Icons.cloud,
      level: SkillLevel.expert,
      glowColor: Color(0xFFFFCA28), // Firebase amber
    ),
  ];
}
