import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../data/blog_repository.dart';
import '../../../models/blog_post.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../layout/shell_styles.dart';

class BlogDetailScreen extends StatelessWidget {
  const BlogDetailScreen({super.key, required this.postId});

  final String postId;

  @override
  Widget build(BuildContext context) {
    final post = BlogRepository.findById(postId);

    if (post == null) {
      return Center(
        child: Text(
          'Blog post not found.',
          style: GoogleFonts.inter(fontSize: 16.sp, color: AppColors.textHint),
        ),
      );
    }

    return _BlogDetailContent(post: post);
  }
}

class _BlogDetailContent extends StatelessWidget {
  const _BlogDetailContent({required this.post});

  final BlogPost post;

  @override
  Widget build(BuildContext context) {
    final dateLabel = DateFormat('dd MMMM yyyy').format(post.publishedAt);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => context.go('/news-feed'),
              icon: Icon(Icons.arrow_back, size: 24.sp, color: AppColors.textBold),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            SizedBox(width: 12.w),
            Text(
              AppTexts.blogDetailTitle,
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
                      post.imageAsset,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.sellOptionTileBackground,
                        child: Icon(Icons.image_outlined, size: 64.sp),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(32.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: GoogleFonts.inter(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textBold,
                            height: 1.25,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          '$dateLabel · ${post.author}',
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: AppColors.textHint,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          post.excerpt,
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Divider(color: AppColors.authDivider, height: 1),
                        SizedBox(height: 24.h),
                        Text(
                          post.content,
                          style: GoogleFonts.inter(
                            fontSize: 15.sp,
                            color: AppColors.textPrimary,
                            height: 1.65,
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
