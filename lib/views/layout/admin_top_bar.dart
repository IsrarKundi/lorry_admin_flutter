import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_dimens.dart';
import '../../utils/app_nav_assets.dart';
import '../../utils/app_texts.dart';

/// Figma top bar: flat search label + underline, bell, profile avatar.
class AdminTopBar extends StatelessWidget {
  const AdminTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: AppDimens.topBarHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppNavAssets.search,
                width: 22.w,
                height: 22.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.textDarkGrey,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                AppTexts.searchHint,
                style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  color: AppColors.textDarkGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(24.r),
                  child: Padding(
                    padding: EdgeInsets.all(6.w),
                    child: SvgPicture.asset(
                      AppNavAssets.notification,
                      width: 26.w,
                      height: 26.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.authDivider, width: 1.5),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=120&h=120&fit=crop',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: AppColors.authDivider),
      ],
    );
  }
}
