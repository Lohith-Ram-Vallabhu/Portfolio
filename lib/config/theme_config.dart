import 'package:flutter/material.dart';

class ThemeConfig {
  // Brand Colors
  static const Color primary = Color(0xFFA155FF); // Purple/Violet Accent glow
  static const Color background = Color(0xFF0D0D15); // Deep dark background
  static const Color surface = Color(0xFF161621); // Card background
  
  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFA0A0AB);

  // Glow Colors
  static const Color glowColor = Color(0x66A155FF); // Soft violet glow

  // Gradients
  static const LinearGradient accentGradient = LinearGradient(
    colors: [primary, Color(0xFFC084FC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [
      Color(0xFF130924),
      background,
      Color(0xFF100820),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Shapes
  static const double borderRadius = 20.0;
  static const double borderRadiusSmall = 12.0;

  // Spacing
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 32.0;
  static const double sectionPadding = 64.0;
}
