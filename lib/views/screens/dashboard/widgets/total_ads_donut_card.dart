import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_texts.dart';
import '../../../custom_widgets/admin_card.dart';

class TotalAdsDonutCard extends StatelessWidget {
  const TotalAdsDonutCard({super.key});

  /// Figma legend order: Used Truck (red), New Truck (maroon), Body Parts (light).
  static const _segments = [
    _DonutSegment(AppTexts.dashboardUsedTruck, 244, AppColors.primary),
    _DonutSegment(AppTexts.dashboardNewTruck, 200, AppColors.chartDonutDark),
    _DonutSegment(AppTexts.dashboardBodyParts, 200, AppColors.chartDonutLight),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminCard(
      child: Column(
        children: [
          Text(
            AppTexts.dashboardTotalAdsToday,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textBold,
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 3,
                        centerSpaceRadius: 78.r,
                        startDegreeOffset: -90,
                        sections: _segments
                            .map(
                              (s) => PieChartSectionData(
                                value: s.value.toDouble(),
                                color: s.color,
                                radius: 42.r,
                                showTitle: false,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppTexts.dashboardTotalAdsLabel,
                          style: GoogleFonts.inter(
                            fontSize: 13.sp,
                            color: AppColors.textHint,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '444',
                          style: GoogleFonts.inter(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textBold,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          ..._segments.map((s) => _LegendRow(segment: s)),
        ],
      ),
    );
  }
}

class _DonutSegment {
  const _DonutSegment(this.label, this.value, this.color);
  final String label;
  final int value;
  final Color color;
}

class _LegendRow extends StatelessWidget {
  const _LegendRow({required this.segment});

  final _DonutSegment segment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Container(
            width: 12.w,
            height: 12.w,
            decoration: BoxDecoration(
              color: segment.color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              segment.label,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            segment.value.toString(),
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textBold,
            ),
          ),
        ],
      ),
    );
  }
}
