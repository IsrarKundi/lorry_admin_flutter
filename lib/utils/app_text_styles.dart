import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTextStyles {
  AppTextStyles._();

  static TextStyle _inter({
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
  }) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      );

  static TextStyle body14({Color? color, FontWeight? fontWeight}) => _inter(
        fontSize: 14.sp,
        color: color ?? AppColors.textPrimary,
        fontWeight: fontWeight,
      );

  static TextStyle body14Bold() => _inter(
        fontSize: 14.sp,
        color: AppColors.textBold,
        fontWeight: FontWeight.w500,
      );

  static TextStyle hint14() => _inter(
        fontSize: 14.sp,
        color: AppColors.textHint,
      );

  static TextStyle primary14({FontWeight? fontWeight}) => _inter(
        fontSize: 14.sp,
        color: AppColors.primary,
        fontWeight: fontWeight,
      );

  static TextStyle darkGrey14() => _inter(
        fontSize: 14.sp,
        color: AppColors.textDarkGrey,
      );

  static TextStyle section16({FontWeight? fontWeight}) => _inter(
        fontSize: 16.sp,
        color: AppColors.textPrimary,
        fontWeight: fontWeight ?? FontWeight.w600,
      );

  /// Admin-only — page header (24sp).
  static TextStyle pageTitle24() => _inter(
        fontSize: 24.sp,
        color: AppColors.textBold,
        fontWeight: FontWeight.w700,
      );
}
