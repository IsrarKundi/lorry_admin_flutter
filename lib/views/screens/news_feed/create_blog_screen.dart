import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/blog_repository.dart';
import '../../../models/blog_post.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_texts.dart';
import '../../custom_widgets/admin_primary_button.dart';
import '../../custom_widgets/app_snackbar.dart';
import '../../layout/shell_styles.dart';
import 'widgets/blog_form_fields.dart';

class CreateBlogScreen extends StatefulWidget {
  const CreateBlogScreen({super.key});

  @override
  State<CreateBlogScreen> createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  final _titleController = TextEditingController();
  final _excerptController = TextEditingController();
  final _contentController = TextEditingController();
  final _authorController = TextEditingController(text: 'Lorry Adda Team');

  @override
  void dispose() {
    _titleController.dispose();
    _excerptController.dispose();
    _contentController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  bool get _canPublish {
    return _titleController.text.trim().isNotEmpty &&
        _excerptController.text.trim().isNotEmpty &&
        _contentController.text.trim().isNotEmpty &&
        _authorController.text.trim().isNotEmpty;
  }

  void _publish() {
    if (!_canPublish) return;

    final post = BlogPost(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text.trim(),
      excerpt: _excerptController.text.trim(),
      content: _contentController.text.trim(),
      imageAsset: AppConstants.truck1Asset,
      publishedAt: DateTime.now(),
      author: _authorController.text.trim(),
    );

    BlogRepository.add(post);
    AppSnackbar.success(context, AppTexts.blogPublishedSuccess);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back, size: 24.sp, color: AppColors.textBold),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            SizedBox(width: 12.w),
            Text(
              AppTexts.blogCreateTitle,
              style: GoogleFonts.inter(
                fontSize: ShellStyles.pageTitleSize,
                fontWeight: FontWeight.w700,
                color: AppColors.textBold,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () => context.pop(),
              child: Text(
                AppTexts.blogCancel,
                style: GoogleFonts.inter(fontSize: 14.sp, color: AppColors.textHint),
              ),
            ),
            SizedBox(width: 12.w),
            AdminPrimaryButton(
              label: AppTexts.blogPublish,
              enabled: _canPublish,
              onPressed: _publish,
            ),
          ],
        ),
        SizedBox(height: 28.h),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(28.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ShellStyles.cardRadius),
                boxShadow: ShellStyles.cardShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const BlogFormLabel(AppTexts.blogFieldTitle),
                  SizedBox(height: 10.h),
                  BlogTextField(
                    controller: _titleController,
                    hint: 'Enter blog title',
                    onChanged: (_) => setState(() {}),
                  ),
                  SizedBox(height: 20.h),
                  const BlogFormLabel(AppTexts.blogFieldExcerpt),
                  SizedBox(height: 10.h),
                  BlogTextField(
                    controller: _excerptController,
                    hint: 'Short summary for the list view',
                    maxLines: 3,
                    height: 100.h,
                    onChanged: (_) => setState(() {}),
                  ),
                  SizedBox(height: 20.h),
                  const BlogFormLabel(AppTexts.blogFieldContent),
                  SizedBox(height: 10.h),
                  BlogTextField(
                    controller: _contentController,
                    hint: 'Full article content',
                    maxLines: 8,
                    height: 220.h,
                    onChanged: (_) => setState(() {}),
                  ),
                  SizedBox(height: 20.h),
                  const BlogFormLabel(AppTexts.blogFieldAuthor),
                  SizedBox(height: 10.h),
                  BlogTextField(
                    controller: _authorController,
                    hint: 'Author name',
                    onChanged: (_) => setState(() {}),
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
