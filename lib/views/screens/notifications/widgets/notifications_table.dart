import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../models/push_notification_item.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_texts.dart';
import '../../../custom_widgets/admin_data_table_shell.dart';

class NotificationsTable extends StatelessWidget {
  const NotificationsTable({super.key, required this.items});

  final List<PushNotificationItem> items;

  static final _dateFormat = DateFormat('E dd MMM, yyyy hh:mm a');

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
        dataRowHeight: 60.h,
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
            label: Text(AppTexts.notificationsColDateTime, style: _headerStyle),
            size: ColumnSize.S,
            fixedWidth: 220.w,
          ),
          DataColumn2(
            label: Text(AppTexts.notificationsColTitle, style: _headerStyle),
            size: ColumnSize.S,
            fixedWidth: 200.w,
          ),
          DataColumn2(
            label: Text(AppTexts.notificationsColBody, style: _headerStyle),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: const SizedBox.shrink(),
            size: ColumnSize.S,
            fixedWidth: 56.w,
          ),
        ],
        rows: List.generate(items.length, (index) {
          final item = items[index];
          final titleStyle = item.isTitleLink
              ? _cellStyle.copyWith(
                  color: AppColors.linkBlue,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.linkBlue,
                  fontWeight: FontWeight.w500,
                )
              : _cellStyle.copyWith(fontWeight: FontWeight.w600);

          return DataRow2(
            color: WidgetStateProperty.all(Colors.white),
            cells: [
              DataCell(Text(_dateFormat.format(item.sentAt), style: _cellStyle)),
              DataCell(Text(item.title, style: titleStyle)),
              DataCell(Text(item.body, style: _cellStyle)),
              DataCell(
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      size: 22.sp,
                      color: AppColors.textDarkGrey,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
