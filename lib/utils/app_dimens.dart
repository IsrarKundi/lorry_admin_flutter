import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class AppDimens {
  AppDimens._();

  static double get screenPaddingHorizontal => 24.w;
  static double get screenPaddingVertical => 24.h;

  static EdgeInsets get screenPadding => EdgeInsets.symmetric(
        horizontal: screenPaddingHorizontal,
        vertical: screenPaddingVertical,
      );

  static double get spaceHorizontalTight => 8.w;
  static double get spaceHorizontalMedium => 16.w;
  static double get spaceHorizontalLoose => 24.w;

  static double get spaceVerticalTight => 8.h;
  static double get spaceVerticalMedium => 16.h;
  static double get spaceVerticalLoose => 24.h;

  /// Admin shell (Figma).
  static double get sidebarWidth => 272.w;
  static double get sidebarCollapsedWidth => 72.w;
  static double get topBarHeight => 72.h;
  static double get mainContentPaddingH => 40.w;
  static double get mainContentPaddingV => 32.h;
}
