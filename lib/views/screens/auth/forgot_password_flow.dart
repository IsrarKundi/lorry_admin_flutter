import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../custom_widgets/app_snackbar.dart';
import 'widgets/auth_dialog_shell.dart';
import 'widgets/auth_primary_button.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/otp_input_row.dart';

/// Three-step forgot-password dialogs matching the admin design.
abstract final class ForgotPasswordFlow {
  ForgotPasswordFlow._();

  static Future<void> start(BuildContext context) async {
    final email = await _showResetEmailDialog(context);
    if (email == null || !context.mounted) return;

    final codeOk = await _showEnterCodeDialog(context, email: email);
    if (codeOk != true || !context.mounted) return;

    final passwordOk = await _showNewPasswordDialog(context);
    if (passwordOk != true || !context.mounted) return;

    AppSnackbar.success(context, 'Password updated successfully.');
  }

  static Future<String?> _showResetEmailDialog(BuildContext context) {
    final emailController = TextEditingController();

    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.45),
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            final email = emailController.text.trim();
            final valid = email.isNotEmpty && email.contains('@');

            return AuthDialogShell(
              title: AppTexts.forgotResetTitle,
              subtitle: AppTexts.forgotResetSubtitle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AuthTextField(
                    label: AppTexts.loginEmailLabel,
                    hint: AppTexts.loginEmailHint,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    onChanged: (_) => setState(() {}),
                  ),
                  SizedBox(height: 28.h),
                  AuthPrimaryButton(
                    label: AppTexts.forgotNext,
                    enabled: valid,
                    onPressed: valid
                        ? () => Navigator.of(dialogContext).pop(email)
                        : null,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static Future<bool?> _showEnterCodeDialog(
    BuildContext context, {
    required String email,
  }) {
    final otpKey = GlobalKey<OtpInputRowState>();

    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.45),
      builder: (dialogContext) {
        return AuthDialogShell(
          title: AppTexts.forgotCodeTitle,
          subtitle: AppTexts.forgotCodeSubtitle(email),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OtpInputRow(key: otpKey),
              SizedBox(height: 28.h),
              AuthPrimaryButton(
                label: AppTexts.forgotNext,
                onPressed: () {
                  final code = otpKey.currentState?.value ?? '';
                  if (code.length < 4) {
                    AppSnackbar.error(dialogContext, 'Please enter the 4-digit code.');
                    return;
                  }
                  Navigator.of(dialogContext).pop(true);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<bool?> _showNewPasswordDialog(BuildContext context) {
    final passwordController = TextEditingController();
    final confirmController = TextEditingController();
    var obscurePassword = true;
    var obscureConfirm = true;

    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.45),
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            final password = passwordController.text;
            final confirm = confirmController.text;
            final valid = password.length >= 6 && password == confirm;

            return AuthDialogShell(
              title: AppTexts.forgotNewPasswordTitle,
              subtitle: AppTexts.forgotNewPasswordSubtitle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AuthTextField(
                    label: AppTexts.forgotPasswordLabel,
                    hint: AppTexts.forgotPasswordHint,
                    controller: passwordController,
                    obscureText: obscurePassword,
                    onChanged: (_) => setState(() {}),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: AppColors.textDarkGrey,
                      ),
                      onPressed: () => setState(() => obscurePassword = !obscurePassword),
                    ),
                  ),
                  SizedBox(height: 18.h),
                  AuthTextField(
                    label: AppTexts.forgotConfirmPasswordLabel,
                    hint: AppTexts.forgotConfirmPasswordHint,
                    controller: confirmController,
                    obscureText: obscureConfirm,
                    onChanged: (_) => setState(() {}),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureConfirm ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: AppColors.textDarkGrey,
                      ),
                      onPressed: () => setState(() => obscureConfirm = !obscureConfirm),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  AuthPrimaryButton(
                    label: AppTexts.forgotNext,
                    enabled: valid,
                    onPressed: valid
                        ? () => Navigator.of(dialogContext).pop(true)
                        : null,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
