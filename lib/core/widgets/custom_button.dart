import 'package:flutter/material.dart';
import '../../config/theme_config.dart';
import '../animations/hover_scale.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isPrimary;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return HoverScale(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ThemeConfig.borderRadius),
          gradient: isPrimary ? ThemeConfig.accentGradient : null,
          color: isPrimary ? null : Colors.transparent,
          border: isPrimary
              ? null
              : Border.all(color: ThemeConfig.primary.withAlpha(128)),
          boxShadow: isPrimary
              ? [
                  BoxShadow(
                    color: ThemeConfig.glowColor,
                    blurRadius: 20,
                    spreadRadius: -5,
                    offset: const Offset(0, 8),
                  )
                ]
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeConfig.spacingLarge,
            vertical: ThemeConfig.spacingMedium,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: isPrimary
                      ? Colors.white
                      : ThemeConfig.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              if (icon != null) ...[
                const SizedBox(width: ThemeConfig.spacingSmall),
                Icon(
                  icon,
                  size: 18,
                  color: isPrimary ? Colors.white : ThemeConfig.primary,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
