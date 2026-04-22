import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBg,
    colorScheme: const ColorScheme.dark(
      surface: AppColors.darkSurface,
      primary: AppColors.neonCyan,
      secondary: AppColors.neonPurple,
      onSurface: AppColors.textPrimary,
      onPrimary: AppColors.darkBg,
    ),
    textTheme: _buildTextTheme(dark: true),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    inputDecorationTheme: _buildInputDecorationTheme(dark: true),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBg,
    colorScheme: const ColorScheme.light(
      surface: AppColors.lightSurface,
      primary: AppColors.neonBlue,
      secondary: AppColors.neonPurple,
      onSurface: AppColors.lightTextPrimary,
      onPrimary: Colors.white,
    ),
    textTheme: _buildTextTheme(dark: false),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    inputDecorationTheme: _buildInputDecorationTheme(dark: false),
  );

  static InputDecorationTheme _buildInputDecorationTheme({required bool dark}) {
    final fillColor = dark ? AppColors.darkSurface : AppColors.lightBg;
    final borderColor = dark
        ? AppColors.darkCardBorder
        : AppColors.lightCardBorder;
    final hintColor = dark ? AppColors.textMuted : AppColors.lightTextSecondary;
    final accentColor = dark ? AppColors.neonCyan : AppColors.neonBlue;
    final labelColor = dark
        ? AppColors.textSecondary
        : AppColors.lightTextSecondary;

    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: borderColor),
    );

    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      hintStyle: GoogleFonts.dmSans(fontSize: 14, color: hintColor),
      labelStyle: GoogleFonts.dmMono(
        fontSize: 12,
        letterSpacing: 0.5,
        color: labelColor,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: defaultBorder,
      enabledBorder: defaultBorder,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: accentColor, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
    );
  }

  static TextTheme _buildTextTheme({required bool dark}) {
    final color = dark ? AppColors.textPrimary : AppColors.lightTextPrimary;
    final secondary = dark
        ? AppColors.textSecondary
        : AppColors.lightTextSecondary;
    return TextTheme(
      displayLarge: GoogleFonts.syne(
        fontSize: 72,
        fontWeight: FontWeight.w700,
        color: color,
        height: 1.1,
        letterSpacing: -2,
      ),
      displayMedium: GoogleFonts.syne(
        fontSize: 56,
        fontWeight: FontWeight.w700,
        color: color,
        height: 1.15,
        letterSpacing: -1.5,
      ),
      displaySmall: GoogleFonts.syne(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: color,
        height: 1.2,
        letterSpacing: -1,
      ),
      headlineLarge: GoogleFonts.syne(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: color,
        height: 1.25,
      ),
      headlineMedium: GoogleFonts.syne(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color,
        height: 1.3,
      ),
      headlineSmall: GoogleFonts.syne(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      titleLarge: GoogleFonts.dmSans(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      titleMedium: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      titleSmall: GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: secondary,
      ),
      bodyLarge: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: secondary,
        height: 1.7,
      ),
      bodyMedium: GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: secondary,
        height: 1.6,
      ),
      bodySmall: GoogleFonts.dmMono(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: secondary,
      ),
      labelLarge: GoogleFonts.dmMono(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: dark ? AppColors.neonCyan : AppColors.neonBlue,
        letterSpacing: 1.5,
      ),
    );
  }
}
