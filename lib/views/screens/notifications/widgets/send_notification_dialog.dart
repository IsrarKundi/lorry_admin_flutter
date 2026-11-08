import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_texts.dart';
import '../../../screens/auth/auth_styles.dart';
import '../../../screens/auth/widgets/auth_field_surface.dart';

class SendNotificationResult {
  const SendNotificationResult({required this.title, required this.body});

  final String title;
  final String body;
}

abstract final class SendNotificationDialog {
  SendNotificationDialog._();

  static Future<SendNotificationResult?> show(BuildContext context) {
    return showDialog<SendNotificationResult>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.45),
      builder: (dialogContext) => const _SendNotificationDialogContent(),
    );
  }
}

class _SendNotificationDialogContent extends StatefulWidget {
  const _SendNotificationDialogContent();

  @override
  State<_SendNotificationDialogContent> createState() =>
      _SendNotificationDialogContentState();
}

class _SendNotificationDialogContentState
    extends State<_SendNotificationDialogContent> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  static const _noBorder = InputBorder.none;

  @override
  Widget build(BuildContext context) {
    final title = _titleController.text.trim();
    final body = _bodyController.text.trim();
    final canSend = title.isNotEmpty && body.isNotEmpty;

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 32.w),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 480.w),
        child: Padding(
          padding: EdgeInsets.fromLTRB(32.w, 32.h, 32.w, 28.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppTexts.notificationsDialogTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.modalTitleMaroon,
                ),
              ),
              SizedBox(height: 28.h),
              _FieldLabel(AppTexts.notificationsFieldTitle),
              SizedBox(height: 10.h),
              AuthFieldSurface(
                height: AuthStyles.fieldHeight,
                child: TextField(
                  controller: _titleController,
                  onChanged: (_) => setState(() {}),
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: AppColors.textPrimary,
                  ),
                  decoration: const InputDecoration(
                    border: _noBorder,
                    enabledBorder: _noBorder,
                    focusedBorder: _noBorder,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    isDense: true,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              _FieldLabel(AppTexts.notificationsFieldBody),
              SizedBox(height: 10.h),
              AuthFieldSurface(
                height: 140.h,
                borderRadius: BorderRadius.circular(16.r),
                child: TextField(
                  controller: _bodyController,
                  onChanged: (_) => setState(() {}),
                  maxLines: 5,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: AppColors.textPrimary,
                  ),
                  decoration: InputDecoration(
                    border: _noBorder,
                    enabledBorder: _noBorder,
                    focusedBorder: _noBorder,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 14.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Row(
                children: [
                  Expanded(
                    child: _CancelButton(
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _SendButton(
                      enabled: canSend,
                      onPressed: canSend
                          ? () => Navigator.of(context).pop(
                                SendNotificationResult(
                                  title: title,
                                  body: body,
                                ),
                              )
                          : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

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

class _CancelButton extends StatelessWidget {
  const _CancelButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textHint,
          side: const BorderSide(color: AppColors.authInputBorder),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          textStyle: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        child: Text(AppTexts.notificationsCancel),
      ),
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton({required this.enabled, required this.onPressed});

  final bool enabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.modalTitleMaroon,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.textHint.withValues(alpha: 0.35),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          textStyle: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        child: Text(AppTexts.notificationsSend),
      ),
    );
  }
}
