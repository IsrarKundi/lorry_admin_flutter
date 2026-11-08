import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/ad_listing.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_texts.dart';
import '../../../custom_widgets/ad_listing_card.dart';

class AdsCategorySection extends StatelessWidget {
  const AdsCategorySection({
    super.key,
    required this.title,
    required this.listings,
    this.onViewAll,
  });

  final String title;
  final List<AdListing> listings;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textBold,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Divider(
                height: 1,
                thickness: 1,
                color: AppColors.authDivider,
              ),
            ),
            SizedBox(width: 16.w),
            TextButton(
              onPressed: onViewAll,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                AppTexts.adsViewAll,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < listings.length; i++) ...[
              if (i > 0) SizedBox(width: 16.w),
              Expanded(
                child: AdListingCard(
                  imageAsset: listings[i].imageAsset,
                  title: listings[i].title,
                  price: listings[i].price,
                  location: listings[i].location,
                  details: listings[i].detailsLabel,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
