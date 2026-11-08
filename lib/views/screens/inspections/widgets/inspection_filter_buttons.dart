import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/inspection_request.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_texts.dart';

class InspectionFilterButtons extends StatelessWidget {
  const InspectionFilterButtons({
    super.key,
    required this.onFilterChanged,
  });

  final ValueChanged<InspectionStatus> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _FilterPill(
          label: AppTexts.inspectionsFilterNewRequest,
          backgroundColor: AppColors.primary,
          onTap: () => onFilterChanged(InspectionStatus.newRequest),
        ),
        SizedBox(width: 12.w),
        _FilterPill(
          label: AppTexts.inspectionsFilterAssigned,
          backgroundColor: AppColors.usersBlockButton,
          onTap: () => onFilterChanged(InspectionStatus.assigned),
        ),
      ],
    );
  }
}

class _FilterPill extends StatelessWidget {
  const _FilterPill({
    required this.label,
    required this.backgroundColor,
    required this.onTap,
  });

  final String label;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(24.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
