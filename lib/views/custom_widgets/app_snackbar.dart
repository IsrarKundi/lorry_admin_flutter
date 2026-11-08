import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

abstract final class AppSnackbar {
  AppSnackbar._();

  static const Duration _defaultDuration = Duration(seconds: 3);

  static TextStyle get _messageStyle => GoogleFonts.inter(
        fontSize: 14.sp,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      );

  static void success(BuildContext c, String m, {Duration? duration, SnackBarAction? action}) =>
      _show(c, message: m, backgroundColor: AppColors.snackbarSuccess, duration: duration, action: action);

  static void error(BuildContext c, String m, {Duration? duration, SnackBarAction? action}) =>
      _show(c, message: m, backgroundColor: AppColors.primary, duration: duration, action: action);

  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    Duration? duration,
    SnackBarAction? action,
  }) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) return;
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message, style: _messageStyle),
          behavior: SnackBarBehavior.floating,
          backgroundColor: backgroundColor,
          duration: duration ?? _defaultDuration,
          action: action,
        ),
      );
  }
}
