import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';

class AppTheme {
  static ThemeData get light {
    const seedColor = Colors.teal;

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          side: BorderSide(
            color: Colors.teal.withValues(alpha: 0.12),
          ),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: AppSpacing.listPadding,
          vertical: AppSpacing.cardSpacing / 2,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 2,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.sm + 4),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm + 4,
        ),
      ),
    );
  }
}
