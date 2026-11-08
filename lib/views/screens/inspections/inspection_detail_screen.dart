import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../data/inspection_repository.dart';
import '../../../models/inspection_request.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../layout/shell_styles.dart';

class InspectionDetailScreen extends StatelessWidget {
  const InspectionDetailScreen({super.key, required this.inspectionId});

  final String inspectionId;

  @override
  Widget build(BuildContext context) {
    final inspection = InspectionRepository.findById(inspectionId);

    if (inspection == null) {
      return Center(
        child: Text(
          'Inspection not found.',
          style: GoogleFonts.inter(fontSize: 16.sp, color: AppColors.textHint),
        ),
      );
    }

    return _InspectionDetailContent(inspection: inspection);
  }
}

class _InspectionDetailContent extends StatelessWidget {
  const _InspectionDetailContent({required this.inspection});

  final InspectionRequest inspection;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMMM yyyy, hh:mm a');
    final isNew = inspection.status == InspectionStatus.newRequest;
    final statusLabel =
        isNew ? AppTexts.inspectionsStatusNew : AppTexts.inspectionsStatusAssigned;
    final statusColor = isNew ? AppColors.primary : AppColors.usersBlockButton;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => context.go('/inspections'),
              icon: Icon(Icons.arrow_back, size: 24.sp, color: AppColors.textBold),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            SizedBox(width: 12.w),
            Text(
              AppTexts.inspectionsDetailTitle,
              style: GoogleFonts.inter(
                fontSize: ShellStyles.pageTitleSize,
                fontWeight: FontWeight.w700,
                color: AppColors.textBold,
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ShellStyles.cardRadius),
                boxShadow: ShellStyles.cardShadow,
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 7,
                    child: Image.asset(
                      inspection.imageAsset,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.sellOptionTileBackground,
                        child: Icon(Icons.local_shipping_outlined, size: 64.sp),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(32.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                inspection.vehicleTitle,
                                style: GoogleFonts.inter(
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textBold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: statusColor,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                statusLabel,
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        _DetailRow(
                          label: AppTexts.inspectionsRequestId,
                          value: inspection.requestCode,
                        ),
                        _DetailRow(
                          label: AppTexts.inspectionsLocation,
                          value: inspection.location,
                        ),
                        _DetailRow(
                          label: AppTexts.inspectionsRequestedOn,
                          value: dateFormat.format(inspection.requestedAt),
                        ),
                        _DetailRow(
                          label: AppTexts.inspectionsOwner,
                          value: inspection.ownerName,
                        ),
                        _DetailRow(
                          label: AppTexts.inspectionsPhone,
                          value: inspection.ownerPhone,
                        ),
                        _DetailRow(
                          label: AppTexts.inspectionsInspector,
                          value: inspection.inspectorName ?? '—',
                        ),
                        _DetailRow(
                          label: AppTexts.inspectionsScheduled,
                          value: inspection.scheduledAt != null
                              ? dateFormat.format(inspection.scheduledAt!)
                              : AppTexts.inspectionsNotScheduled,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          AppTexts.inspectionsNotes,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          inspection.notes,
                          style: GoogleFonts.inter(
                            fontSize: 15.sp,
                            color: AppColors.textPrimary,
                            height: 1.55,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140.w,
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: AppColors.textHint,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
