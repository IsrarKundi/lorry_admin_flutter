import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import '../auth_styles.dart';

class AuthDialogShell extends StatelessWidget {
  const AuthDialogShell({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    this.onClose,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 8,
      shadowColor: Colors.black.withValues(alpha: 0.12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AuthStyles.dialogRadius),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 32.w),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: AuthStyles.dialogMaxWidth),
        child: Padding(
          padding: AuthStyles.dialogPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                height: 28.h,
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: onClose ?? () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close, size: 24.sp, color: AppColors.textBold),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: AuthStyles.dialogTitleSize,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textBold,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: AuthStyles.subtitleSize,
                  color: AppColors.textHint,
                  height: 1.45,
                ),
              ),
              SizedBox(height: 28.h),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
