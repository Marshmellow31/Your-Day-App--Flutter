import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFF0D0D0D);
  static const Color surface = Color(0xFF121212);
  static const Color elevated = Color(0xFF1A1A1A);
  static const Color primaryText = Color(0xFFFFFFFF);
  static const Color secondaryText = Color(0xFFE5E5E5);
  static const Color mutedText = Color(0xFFA0A0A0);
  static const Color borders = Color(0xFF2A2A2A);
  static const Color primary = Color(0xFFFFFFFF);
  static const Color accent = Color(0xFFFFFFFF);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        onPrimary: Colors.black,
        secondary: AppColors.secondaryText,
        onSecondary: Colors.black,
        surface: AppColors.surface,
        onSurface: AppColors.primaryText,
        background: AppColors.background,
        onBackground: AppColors.primaryText,
        outline: AppColors.borders,
      ),
      scaffoldBackgroundColor: AppColors.background,
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.borders),
        ),
      ),
      textTheme: GoogleFonts.manropeTextTheme().copyWith(
        displayLarge: GoogleFonts.manrope(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: GoogleFonts.manrope(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.manrope(
          color: AppColors.primaryText,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.inter(
          color: AppColors.secondaryText,
        ),
        bodyMedium: GoogleFonts.inter(
          color: AppColors.secondaryText,
        ),
        labelSmall: GoogleFonts.inter(
          color: AppColors.mutedText,
          letterSpacing: 1.2,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.primaryText,
        unselectedItemColor: AppColors.mutedText,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryText,
        foregroundColor: Colors.black,
        shape: CircleBorder(),
      ),
    );
  }
}
