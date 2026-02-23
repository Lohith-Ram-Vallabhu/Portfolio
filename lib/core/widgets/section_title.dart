import 'package:flutter/material.dart';
import '../../config/theme_config.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: ThemeConfig.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: ThemeConfig.spacingMedium),
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            gradient: ThemeConfig.accentGradient,
            borderRadius: BorderRadius.circular(2),
            boxShadow: const [
              BoxShadow(
                color: ThemeConfig.glowColor,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
