import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/blog_repository.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../custom_widgets/admin_primary_button.dart';
import '../../layout/shell_styles.dart';
import 'widgets/blog_posts_table.dart';

class BlogNewsFeedScreen extends StatefulWidget {
  const BlogNewsFeedScreen({super.key});

  @override
  State<BlogNewsFeedScreen> createState() => _BlogNewsFeedScreenState();
}

class _BlogNewsFeedScreenState extends State<BlogNewsFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppTexts.blogPageTitle,
              style: GoogleFonts.inter(
                fontSize: ShellStyles.pageTitleSize,
                fontWeight: FontWeight.w700,
                color: AppColors.textBold,
                height: 1.1,
              ),
            ),
            const Spacer(),
            AdminPrimaryButton(
              label: AppTexts.blogAddNew,
              onPressed: () async {
                await context.push('/news-feed/create');
                if (mounted) setState(() {});
              },
            ),
          ],
        ),
        SizedBox(height: 28.h),
        Expanded(child: BlogPostsTable(posts: BlogRepository.posts)),
      ],
    );
  }
}
