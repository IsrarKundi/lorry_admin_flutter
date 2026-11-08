import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import '../auth_styles.dart';
import 'auth_field_surface.dart';

class OtpInputRow extends StatefulWidget {
  const OtpInputRow({
    super.key,
    this.length = 4,
    this.onCompleted,
  });

  final int length;
  final ValueChanged<String>? onCompleted;

  @override
  State<OtpInputRow> createState() => OtpInputRowState();
}

class OtpInputRowState extends State<OtpInputRow> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  static const _noBorder = InputBorder.none;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String get value => _controllers.map((c) => c.text).join();

  void _onChanged(int index, String value) {
    if (value.length > 1) {
      _controllers[index].text = value.substring(value.length - 1);
    }
    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    if (value.isNotEmpty && index == widget.length - 1) {
      final code = this.value;
      if (code.length == widget.length) {
        widget.onCompleted?.call(code);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        return Padding(
          padding: EdgeInsets.only(
            left: index == 0 ? 0 : AuthStyles.otpGap / 2,
            right: index == widget.length - 1 ? 0 : AuthStyles.otpGap / 2,
          ),
          child: AuthFieldSurface(
            width: AuthStyles.otpBoxSize,
            height: AuthStyles.otpBoxSize,
            borderRadius: BorderRadius.circular(AuthStyles.otpBoxRadius),
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              style: GoogleFonts.inter(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textBold,
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.zero,
                border: _noBorder,
                enabledBorder: _noBorder,
                focusedBorder: _noBorder,
              ),
              onChanged: (v) => _onChanged(index, v),
            ),
          ),
        );
      }),
    );
  }
}
