import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.textBold,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              AppTexts.menuComingSoon,
              style: GoogleFonts.inter(fontSize: 16.sp, color: AppColors.textHint),
            ),
          ),
        ),
      ],
    );
  }
}
