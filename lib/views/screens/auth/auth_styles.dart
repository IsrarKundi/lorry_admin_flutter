import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Figma auth layout tokens (login + forgot-password modals).
abstract final class AuthStyles {
  AuthStyles._();

  /// Stadium-shaped inputs and primary buttons.
  static double get fieldHeight => 56.h;
  static double get fieldRadius => 26.r;
  static BorderRadius get fieldBorderRadius => BorderRadius.circular(fieldRadius);

  static double get buttonHeight => 56.h;

  /// Forgot-password modal card.
  static double get dialogRadius => 32.r;
  static double get dialogMaxWidth => 480.w;
  static EdgeInsets get dialogPadding =>
      EdgeInsets.fromLTRB(32.w, 28.h, 32.w, 32.h);

  /// Login split card.
  static double get loginCardMaxWidth => 1120.w;
  static double get loginCardMinHeight => 640.h;
  static double get loginCardRadius => 4.r;
  static double get loginFormMaxWidth => 500.w;
  static double get loginLogoWidth => 320.w;

  static double get titleSize => 24.sp;
  static double get dialogTitleSize => 22.sp;
  static double get subtitleSize => 14.sp;

  /// OTP boxes (modal step 2).
  static double get otpBoxSize => 64.w;
  static double get otpBoxRadius => 12.r;
  static double get otpGap => 16.w;

  /// Soft elevation on auth inputs (no border).
  static List<BoxShadow> get fieldShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.08),
          blurRadius: 12,
          offset: const Offset(0, 4),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 4,
          offset: const Offset(0, 1),
          spreadRadius: 0,
        ),
      ];
}
