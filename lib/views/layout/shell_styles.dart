import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class ShellStyles {
  ShellStyles._();

  static double get cardRadius => 20.r;
  static EdgeInsets get cardPadding => EdgeInsets.fromLTRB(28.w, 24.h, 28.w, 28.h);

  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 24,
          offset: const Offset(0, 6),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.02),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];

  static double get pageTitleSize => 30.sp;
  static double get navItemRadius => 12.r;
}
