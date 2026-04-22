import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/app_theme/app_colors.dart';
import 'package:manish_flutter_portfolio/core/constants/app_images.dart';
import 'package:manish_flutter_portfolio/core/utils/responsive.dart';

class HeroAvtar extends StatefulWidget {
  const HeroAvtar({super.key});

  @override
  State<HeroAvtar> createState() => _HeroAvtarState();
}

class _HeroAvtarState extends State<HeroAvtar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final size = isMobile ? 220.0 : 300.0;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, math.sin(_controller.value * math.pi) * 8),
        child: child,
      ),
      child: Center(
        child: SizedBox(
          height: size,
          width: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Animated sweep glow ring
              AnimatedBuilder(
                animation: _controller,
                builder: (_, _) => Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(
                        colors: [
                          AppColors.neonCyan.withValues(alpha: 0.0),
                          AppColors.neonCyan.withValues(alpha: 0.5),
                          AppColors.neonPurple.withValues(alpha: 0.4),
                          AppColors.neonBlue.withValues(alpha: 0.3),
                          AppColors.neonCyan.withValues(alpha: 0.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Outer border ring
              Container(
                width: size - 4,
                height: size - 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.neonCyan.withValues(alpha: 0.15),
                    width: 1,
                  ),
                ),
              ),

              // Photo container
              Container(
                width: size - 16,
                height: size - 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.neonCyan.withValues(alpha: 0.35),
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(AppImages.profile, fit: BoxFit.cover),
                ),
              ),

              // Flutter × AI tag at bottom
              Positioned(
                bottom: isMobile ? 8 : 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF080C14).withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.neonCyan.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Text(
                    'Flutter × AI',
                    style: GoogleFonts.dmMono(
                      fontSize: 11,
                      color: AppColors.neonCyan,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
