import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../config/theme_config.dart';

class AnimatedAvatar extends StatefulWidget {
  final Widget avatarImage;
  final double size;

  const AnimatedAvatar({
    super.key,
    required this.avatarImage,
    required this.size,
  });

  @override
  State<AnimatedAvatar> createState() => _AnimatedAvatarState();
}

class _AnimatedAvatarState extends State<AnimatedAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _floatingController;
  Offset _mousePosition = const Offset(-1000, -1000);

  final List<double> _baseAngles = [
    5 * pi / 4, // Top Left
    7 * pi / 4, // Top Right
    pi / 4, // Bottom Right
  ];

  final List<Widget> _icons = [
    const FaIcon(
      FontAwesomeIcons.python,
      color: Color(0xFF3776AB),
      size: 30,
    ), // Python
    const FlutterLogo(size: 30), // Flutter (Proxy)
    const FaIcon(
      FontAwesomeIcons.leaf,
      color: Color(0xFF6DB33F),
      size: 30,
    ), // Spring Boot (Proxy)
  ];

  @override
  void initState() {
    super.initState();
    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _floatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // We make the stack area larger than the avatar to fit the floating icons
    final containerSize = widget.size * 1.5;
    final center = Offset(containerSize / 2, containerSize / 2);
    final avatarSize = widget.size;

    return MouseRegion(
      onHover: (event) {
        setState(() {
          _mousePosition = event.localPosition;
        });
      },
      onExit: (event) {
        setState(() {
          _mousePosition = const Offset(-1000, -1000);
        });
      },
      child: SizedBox(
        width: containerSize,
        height: containerSize,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // Center avatar
            Container(
              width: avatarSize,
              height: avatarSize,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: ThemeConfig.accentGradient,
                boxShadow: [
                  BoxShadow(
                    color: ThemeConfig.glowColor,
                    blurRadius: 100,
                    spreadRadius: 20,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ThemeConfig.background,
                  ),
                  child: ClipOval(child: widget.avatarImage),
                ),
              ),
            ),
            // Floating Icons
            ...List.generate(3, (index) {
              return AnimatedBuilder(
                animation: _floatingController,
                builder: (context, child) {
                  // base radius is just outside the avatar
                  double baseRadius = (avatarSize / 2) + 20;
                  double angle = _baseAngles[index];

                  // continuous floating
                  double floatY =
                      sin(
                        _floatingController.value * 2 * pi + (index * pi / 2),
                      ) *
                      15;
                  double floatX =
                      cos(
                        _floatingController.value * 2 * pi + (index * pi / 2),
                      ) *
                      10;

                  Offset basePos = Offset(
                    center.dx + cos(angle) * baseRadius + floatX,
                    center.dy + sin(angle) * baseRadius + floatY,
                  );

                  // Repulsion logic
                  double minDistanceToAnyIcon = double.infinity;
                  for (int i = 0; i < 3; i++) {
                    double a = _baseAngles[i];
                    double fY =
                        sin(_floatingController.value * 2 * pi + (i * pi / 2)) *
                        15;
                    double fX =
                        cos(_floatingController.value * 2 * pi + (i * pi / 2)) *
                        10;
                    Offset p = Offset(
                      center.dx + cos(a) * baseRadius + fX,
                      center.dy + sin(a) * baseRadius + fY,
                    );
                    double d = (p - _mousePosition).distance;
                    if (d < minDistanceToAnyIcon) {
                      minDistanceToAnyIcon = d;
                    }
                  }

                  Offset repulsionTarget = Offset.zero;
                  // Trigger repulsion if hovered over ANY icon or the main avatar
                  double distToMouse = (basePos - _mousePosition).distance;
                  if (minDistanceToAnyIcon < 100 ||
                      (center - _mousePosition).distance < avatarSize / 2) {
                    double force = 80.0; // Fixed scatter distance
                    double distToCurrent = distToMouse == 0 ? 1 : distToMouse;
                    Offset dir = (basePos - _mousePosition) / distToCurrent;
                    repulsionTarget = dir * force;
                  }

                  return TweenAnimationBuilder<Offset>(
                    tween: Tween<Offset>(
                      begin: Offset.zero,
                      end: repulsionTarget,
                    ),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    builder: (context, repulsionOffset, child) {
                      return Positioned(
                        left:
                            basePos.dx +
                            repulsionOffset.dx -
                            30, // -30 for center alignment
                        top: basePos.dy + repulsionOffset.dy - 30,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Glass blur effect
                            ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withValues(alpha: 0.03),
                                    border: Border.all(
                                      color: ThemeConfig.glowColor.withValues(alpha: 0.2),
                                      width: 1.5,
                                    ),
                                    boxShadow: [
                                      // Subtle light below the icon
                                      BoxShadow(
                                        color: ThemeConfig.glowColor.withValues(alpha: 0.3),
                                        blurRadius: 15,
                                        spreadRadius: 2,
                                        offset: const Offset(0, 8),
                                      ),
                                      // Inner dark shadow for depth
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.5),
                                        blurRadius: 10,
                                        spreadRadius: -5,
                                      ),
                                    ],
                                    gradient: RadialGradient(
                                      center: const Alignment(-0.5, -0.5),
                                      radius: 1.5,
                                      colors: [
                                        ThemeConfig.glowColor.withValues(alpha: 0.1),
                                        Colors.black.withValues(alpha: 0.4),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Icon
                            _icons[index],
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
