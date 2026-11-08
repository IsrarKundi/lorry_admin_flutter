import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

abstract final class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final base = GoogleFonts.interTextTheme();

    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ).copyWith(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: AppColors.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.homeScaffoldBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.appBarBackground,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      textTheme: base.copyWith(
        bodyLarge: base.bodyLarge?.copyWith(fontSize: 14.sp, color: AppColors.textPrimary),
        bodyMedium: base.bodyMedium?.copyWith(fontSize: 14.sp, color: AppColors.textPrimary),
        bodySmall: base.bodySmall?.copyWith(fontSize: 14.sp, color: AppColors.textDarkGrey),
        titleMedium: base.titleMedium?.copyWith(
          fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
        ),
        labelLarge: base.labelLarge?.copyWith(
          fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.inter(fontSize: 14.sp, color: AppColors.textHint),
        labelStyle: GoogleFonts.inter(fontSize: 14.sp, color: AppColors.textPrimary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.textHint.withValues(alpha: 0.4),
          disabledForegroundColor: Colors.white70,
          textStyle: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w600),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
    );
  }
}
