import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import '../../../screens/auth/auth_styles.dart';
import '../../../screens/auth/widgets/auth_field_surface.dart';

class BlogFormLabel extends StatelessWidget {
  const BlogFormLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textBold,
      ),
    );
  }
}

class BlogTextField extends StatelessWidget {
  const BlogTextField({
    super.key,
    required this.controller,
    this.hint,
    this.maxLines = 1,
    this.height,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? hint;
  final int maxLines;
  final double? height;
  final ValueChanged<String>? onChanged;

  static const _noBorder = InputBorder.none;

  @override
  Widget build(BuildContext context) {
    final fieldHeight = height ?? (maxLines > 1 ? 160.h : AuthStyles.fieldHeight);

    return AuthFieldSurface(
      height: fieldHeight,
      borderRadius: BorderRadius.circular(maxLines > 1 ? 16.r : AuthStyles.fieldRadius),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        maxLines: maxLines,
        style: GoogleFonts.inter(fontSize: 14.sp, color: AppColors.textPrimary),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.inter(fontSize: 14.sp, color: AppColors.textHint),
          border: _noBorder,
          enabledBorder: _noBorder,
          focusedBorder: _noBorder,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        ),
      ),
    );
  }
}
