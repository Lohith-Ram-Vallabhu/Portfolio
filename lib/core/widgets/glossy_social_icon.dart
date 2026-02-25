import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class GlossySocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;
  final VoidCallback onTap;
  final Color iconColor;
  final Color glowColor;

  const GlossySocialIcon({
    super.key,
    required this.icon,
    required this.url,
    required this.onTap,
    this.iconColor = Colors.white,
    this.glowColor = Colors.white,
  });

  @override
  State<GlossySocialIcon> createState() => _GlossySocialIconState();
}

class _GlossySocialIconState extends State<GlossySocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.03),
            boxShadow: [
              // Subtle light below the icon
              BoxShadow(
                color: widget.glowColor.withValues(alpha: _isHovered ? 0.5 : 0.25),
                blurRadius: _isHovered ? 20 : 12,
                spreadRadius: _isHovered ? 2 : 0,
                offset: const Offset(0, 8), // Shifts the glow downwards
              ),
              // Inner dark shadow for depth
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 10,
                spreadRadius: -5,
              ),
            ],
            // Glossy border effect
            border: Border.all(
              color: widget.glowColor.withValues(alpha: _isHovered ? 0.3 : 0.1),
              width: 1.5,
            ),
            gradient: RadialGradient(
              center: const Alignment(-0.5, -0.5),
              radius: 1.5,
              colors: [
                widget.glowColor.withValues(alpha: _isHovered ? 0.15 : 0.05),
                Colors.black.withValues(alpha: 0.4),
              ],
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Glass blur effect
              ClipOval(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
              // The icon itself
              AnimatedScale(
                scale: _isHovered ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: FaIcon(
                  widget.icon,
                  color: widget.iconColor,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
