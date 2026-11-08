import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/inspection_repository.dart';
import '../../../models/inspection_request.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../custom_widgets/inspection_card.dart';
import '../../layout/shell_styles.dart';
import 'widgets/inspection_filter_buttons.dart';

class InspectionsScreen extends StatefulWidget {
  const InspectionsScreen({super.key});

  @override
  State<InspectionsScreen> createState() => _InspectionsScreenState();
}

class _InspectionsScreenState extends State<InspectionsScreen> {
  InspectionStatus _filter = InspectionStatus.newRequest;

  List<InspectionRequest> get _filtered =>
      InspectionRepository.items.where((i) => i.status == _filter).toList();

  @override
  Widget build(BuildContext context) {
    final items = _filtered;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppTexts.inspectionsPageTitle,
              style: GoogleFonts.inter(
                fontSize: ShellStyles.pageTitleSize,
                fontWeight: FontWeight.w700,
                color: AppColors.textBold,
                height: 1.1,
              ),
            ),
            const Spacer(),
            InspectionFilterButtons(
              onFilterChanged: (status) => setState(() => _filter = status),
            ),
          ],
        ),
        SizedBox(height: 28.h),
        Expanded(
          child: items.isEmpty
              ? Center(
                  child: Text(
                    AppTexts.menuComingSoon,
                    style: GoogleFonts.inter(fontSize: 16.sp, color: AppColors.textHint),
                  ),
                )
              : GridView.builder(
                  padding: EdgeInsets.only(bottom: 16.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.w,
                    childAspectRatio: 0.82,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final inspection = items[index];
                    return InspectionCard(
                      inspection: inspection,
                      onTap: () => context.go('/inspections/${inspection.id}'),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
