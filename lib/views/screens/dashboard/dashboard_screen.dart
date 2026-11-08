import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../layout/shell_styles.dart';
import 'widgets/total_ads_donut_card.dart';
import 'widgets/user_signups_chart_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.dashboardOverviewTitle,
          style: GoogleFonts.inter(
            fontSize: ShellStyles.pageTitleSize,
            fontWeight: FontWeight.w700,
            color: AppColors.textBold,
            height: 1.1,
          ),
        ),
        SizedBox(height: 28.h),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                flex: 62,
                child: UserSignupsChartCard(),
              ),
              SizedBox(width: 28.w),
              const Expanded(
                flex: 38,
                child: TotalAdsDonutCard(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
