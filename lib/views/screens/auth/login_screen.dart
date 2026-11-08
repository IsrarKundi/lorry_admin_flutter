import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_texts.dart';
import 'auth_styles.dart';
import 'forgot_password_flow.dart';
import 'widgets/auth_primary_button.dart';
import 'widgets/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    context.go('/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    final viewportHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
          child: Container(
            width: AuthStyles.loginCardMaxWidth,
            constraints: BoxConstraints(
              minHeight: viewportHeight * 0.82,
              maxWidth: AuthStyles.loginCardMaxWidth,
            ),
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(AuthStyles.loginCardRadius),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withValues(alpha: 0.04),
              //     blurRadius: 16,
              //     offset: const Offset(0, 4),
              //   ),
              // ],
            ),
            clipBehavior: Clip.antiAlias,
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: _LogoPanel()),
                  const VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: AppColors.authDivider,
                  ),
                  Expanded(
                    child: _LoginFormPanel(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      obscurePassword: _obscurePassword,
                      onTogglePassword: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                      onForgotPassword: () => ForgotPasswordFlow.start(context),
                      onLogin: _onLogin,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LogoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppConstants.logoAsset,
        width: AuthStyles.loginLogoWidth,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _LoginFormPanel extends StatelessWidget {
  const _LoginFormPanel({
    required this.emailController,
    required this.passwordController,
    required this.obscurePassword,
    required this.onTogglePassword,
    required this.onForgotPassword,
    required this.onLogin,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool obscurePassword;
  final VoidCallback onTogglePassword;
  final VoidCallback onForgotPassword;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: AuthStyles.loginFormMaxWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 48.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppTexts.loginWelcomeTitle,
                style: GoogleFonts.inter(
                  fontSize: AuthStyles.titleSize,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textBold,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                AppTexts.loginWelcomeSubtitle,
                style: GoogleFonts.inter(
                  fontSize: AuthStyles.subtitleSize,
                  color: AppColors.textHint,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 56.h),
              AuthTextField(
                label: AppTexts.loginEmailLabel,
                hint: AppTexts.loginEmailHint,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 22.h),
              AuthTextField(
                label: AppTexts.loginPasswordLabel,
                hint: AppTexts.loginPasswordHint,
                controller: passwordController,
                obscureText: obscurePassword,
                textInputAction: TextInputAction.done,
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(
                    minWidth: 44.w,
                    minHeight: AuthStyles.fieldHeight,
                  ),
                  icon: Icon(
                    obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.textDarkGrey,
                    size: 22.sp,
                  ),
                  onPressed: onTogglePassword,
                ),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: onForgotPassword,
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 6.h),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    AppTexts.loginForgotPassword,
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 48.h),
              AuthPrimaryButton(label: AppTexts.loginButton, onPressed: onLogin),
            ],
          ),
        ),
      ),
    );
  }
}
