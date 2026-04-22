import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGradients {
  AppGradients._();

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      AppColors.gradientStart,
      AppColors.gradientMid,
      AppColors.gradientEnd,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF111827), Color(0xFF0D1421)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient neonGlow = LinearGradient(
    colors: [Color(0x3300D4FF), Color(0x333B82F6), Color(0x338B5CF6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
