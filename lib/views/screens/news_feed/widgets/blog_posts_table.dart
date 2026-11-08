import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../models/blog_post.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_texts.dart';
import '../../../custom_widgets/admin_data_table_shell.dart';

class BlogPostsTable extends StatelessWidget {
  const BlogPostsTable({super.key, required this.posts});

  final List<BlogPost> posts;

  static final _dateFormat = DateFormat('dd MMM yyyy');

  TextStyle get _headerStyle => GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textBold,
      );

  TextStyle get _cellStyle => GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      );

  @override
  Widget build(BuildContext context) {
    return AdminDataTableShell(
      fallbackMinWidth: 900,
      builder: (tableWidth) => DataTable2(
        columnSpacing: 20.w,
        horizontalMargin: 24.w,
        minWidth: tableWidth,
        headingRowHeight: 52.h,
        dataRowHeight: 72.h,
        dividerThickness: 0,
        isHorizontalScrollBarVisible: true,
        isVerticalScrollBarVisible: true,
        headingRowDecoration: BoxDecoration(
          color: AppColors.tableHeaderBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        columns: [
          DataColumn2(
            label: Text(AppTexts.blogColTitle, style: _headerStyle),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text(AppTexts.blogColPublished, style: _headerStyle),
            size: ColumnSize.S,
            fixedWidth: 140.w,
          ),
          DataColumn2(
            label: Text(AppTexts.blogColAuthor, style: _headerStyle),
            size: ColumnSize.S,
            fixedWidth: 180.w,
          ),
          DataColumn2(
            label: const SizedBox.shrink(),
            size: ColumnSize.S,
            fixedWidth: 56.w,
          ),
        ],
        rows: List.generate(posts.length, (index) {
          final post = posts[index];
          final rowColor = index.isEven ? Colors.white : AppColors.tableRowAlternate;

          return DataRow2(
            color: WidgetStateProperty.all(rowColor),
            onTap: () => context.go('/news-feed/${post.id}'),
            cells: [
              DataCell(
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(
                        post.imageAsset,
                        width: 56.w,
                        height: 40.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 56.w,
                          height: 40.h,
                          color: AppColors.sellOptionTileBackground,
                          child: Icon(Icons.image_outlined, size: 20.sp),
                        ),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            post.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: _cellStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.linkBlue,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.linkBlue,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            post.excerpt,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: _cellStyle.copyWith(
                              fontSize: 12.sp,
                              color: AppColors.textHint,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              DataCell(Text(_dateFormat.format(post.publishedAt), style: _cellStyle)),
              DataCell(Text(post.author, style: _cellStyle)),
              DataCell(
                IconButton(
                  onPressed: () => context.go('/news-feed/${post.id}'),
                  icon: Icon(Icons.more_horiz, size: 22.sp, color: AppColors.textDarkGrey),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
