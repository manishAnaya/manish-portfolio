import 'package:flutter/material.dart';
import 'package:manish_flutter_portfolio/core/app_theme/app_colors.dart';

class BackgroundOrbs extends StatelessWidget {
  const BackgroundOrbs({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 700,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: size.width * 0.1,
            child: _Orb(color: AppColors.neonCyan, size: 400),
          ),
          Positioned(
            top: 200,
            left: -50,
            child: _Orb(color: AppColors.neonPurple, size: 300),
          ),
          Positioned(
            bottom: 10,
            right: size.width * 0.3,
            child: _Orb(color: AppColors.neonBlue, size: 250),
          ),
        ],
      ),
    );
  }
}

class _Orb extends StatelessWidget {
  final Color color;
  final double size;
  const _Orb({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color.withValues(alpha: 0.12), color.withValues(alpha: 0.0)],
        ),
      ),
    );
  }
}
