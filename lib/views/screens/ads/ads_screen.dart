import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/ad_listing.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../layout/shell_styles.dart';
import 'ads_mock_data.dart';
import 'widgets/ads_category_section.dart';
import 'widgets/ads_filter_buttons.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  AdsScreenTab _tab = AdsScreenTab.ads;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppTexts.adsPageTitle,
              style: GoogleFonts.inter(
                fontSize: ShellStyles.pageTitleSize,
                fontWeight: FontWeight.w700,
                color: AppColors.textBold,
                height: 1.1,
              ),
            ),
            const Spacer(),
            AdsFilterButtons(
              onTabChanged: (tab) => setState(() => _tab = tab),
            ),
          ],
        ),
        SizedBox(height: 28.h),
        Expanded(
          child: _tab == AdsScreenTab.ads ? _AdsContent() : _ReportsPlaceholder(),
        ),
      ],
    );
  }
}

class _AdsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AdsCategorySection(
            title: AppTexts.adsSectionNewTruck,
            listings: AdsMockData.forCategory(AdCategory.newTruck),
          ),
          SizedBox(height: 32.h),
          AdsCategorySection(
            title: AppTexts.adsSectionUsedTruck,
            listings: AdsMockData.forCategory(AdCategory.usedTruck),
          ),
          SizedBox(height: 32.h),
          AdsCategorySection(
            title: AppTexts.adsSectionBodyParts,
            listings: AdsMockData.forCategory(AdCategory.bodyParts),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

class _ReportsPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppTexts.menuComingSoon,
        style: GoogleFonts.inter(fontSize: 16.sp, color: AppColors.textHint),
      ),
    );
  }
}
