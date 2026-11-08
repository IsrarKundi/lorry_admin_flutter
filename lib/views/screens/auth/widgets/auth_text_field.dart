import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import '../auth_styles.dart';
import 'auth_field_surface.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.onChanged,
    this.textInputAction,
  });

  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;

  static const _noBorder = InputBorder.none;

  static TextStyle get _inputStyle => GoogleFonts.inter(
        fontSize: 14.sp,
        height: 1,
        color: AppColors.textPrimary,
      );

  static TextStyle get _hintStyle => GoogleFonts.inter(
        fontSize: 14.sp,
        height: 1,
        color: AppColors.textHint,
      );

  EdgeInsets _horizontalPadding() {
    final right = suffixIcon != null ? 44.w : 20.w;
    return EdgeInsets.fromLTRB(20.w, 0, right, 0);
  }

  Widget _buildField({required bool showHint}) {
    final fieldHeight = AuthStyles.fieldHeight;

    return SizedBox(
      height: fieldHeight,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          if (showHint)
            Padding(
              padding: _horizontalPadding(),
              child: Text(hint, style: _hintStyle),
            ),
          TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            onChanged: onChanged,
            textInputAction: textInputAction,
            maxLines: 1,
            textAlignVertical: TextAlignVertical.center,
            style: _inputStyle,
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: _horizontalPadding(),
              suffixIcon: suffixIcon,
              suffixIconConstraints: BoxConstraints(
                minWidth: 44.w,
                minHeight: fieldHeight,
                maxHeight: fieldHeight,
              ),
              border: _noBorder,
              enabledBorder: _noBorder,
              focusedBorder: _noBorder,
              disabledBorder: _noBorder,
              errorBorder: _noBorder,
              focusedErrorBorder: _noBorder,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final field = controller != null
        ? ListenableBuilder(
            listenable: controller!,
            builder: (context, _) => _buildField(showHint: controller!.text.isEmpty),
          )
        : _buildField(showHint: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textBold,
          ),
        ),
        SizedBox(height: 10.h),
        AuthFieldSurface(height: AuthStyles.fieldHeight, child: field),
      ],
    );
  }
}
