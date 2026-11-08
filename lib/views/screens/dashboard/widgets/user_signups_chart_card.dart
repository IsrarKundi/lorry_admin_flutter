import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_texts.dart';
import '../../../custom_widgets/admin_card.dart';

class UserSignupsChartCard extends StatelessWidget {
  const UserSignupsChartCard({super.key});

  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];
  static const _values = [
    120.0, 140.0, 130.0, 150.0, 160.0, 145.0,
    170.0, 165.0, 180.0, 220.0, 190.0, 175.0,
  ];
  static const _highlightIndex = 9;

  @override
  Widget build(BuildContext context) {
    return AdminCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  AppTexts.dashboardUserSignups,
                  style: GoogleFonts.inter(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBold,
                  ),
                ),
              ),
              _PeriodDropdown(),
            ],
          ),
          SizedBox(height: 32.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: BarChart(
                BarChartData(
                  maxY: 250,
                  minY: 0,
                  alignment: BarChartAlignment.spaceAround,
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28.h,
                        getTitlesWidget: (value, meta) {
                          final i = value.toInt();
                          if (i < 0 || i >= _months.length) {
                            return const SizedBox.shrink();
                          }
                          return Text(
                            _months[i],
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              color: AppColors.textDarkGrey,
                              fontWeight: FontWeight.w400,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  barGroups: List.generate(_values.length, (i) {
                    final isHighlight = i == _highlightIndex;
                    return BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: _values[i],
                          width: 22.w,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(4.r),
                          ),
                          color: isHighlight
                              ? AppColors.primary
                              : AppColors.chartBarInactive,
                        ),
                      ],
                      showingTooltipIndicators: isHighlight ? [0] : [],
                    );
                  }),
                  barTouchData: BarTouchData(
                    enabled: false,
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (_) => AppColors.chartTooltipBackground,
                      tooltipBorder: BorderSide.none,
                      tooltipPadding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 6.h,
                      ),
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          rod.toY.toInt().toString(),
                          GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                duration: Duration.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PeriodDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.authDivider),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppTexts.dashboardMonthly,
            style: GoogleFonts.inter(
              fontSize: 13.sp,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 2.w),
          Icon(Icons.keyboard_arrow_down, size: 20.sp, color: AppColors.textDarkGrey),
        ],
      ),
    );
  }
}
