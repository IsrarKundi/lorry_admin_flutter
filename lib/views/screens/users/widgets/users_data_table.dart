import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/admin_user.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_texts.dart';
import '../../../custom_widgets/admin_data_table_shell.dart';

class UsersDataTable extends StatefulWidget {
  const UsersDataTable({super.key, required this.users});

  final List<AdminUser> users;

  @override
  State<UsersDataTable> createState() => _UsersDataTableState();
}

class _UsersDataTableState extends State<UsersDataTable> {
  bool _sortAscending = true;

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
    final rows = List<AdminUser>.from(widget.users)
      ..sort((a, b) {
        final cmp = a.status.name.compareTo(b.status.name);
        return _sortAscending ? cmp : -cmp;
      });

    return AdminDataTableShell(
      builder: (tableWidth) => DataTable2(
        columnSpacing: 16.w,
        horizontalMargin: 24.w,
        minWidth: tableWidth,
        headingRowHeight: 52.h,
        dataRowHeight: 56.h,
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
            label: Text(AppTexts.usersColUserId, style: _headerStyle),
            size: ColumnSize.S,
            fixedWidth: 100.w,
          ),
          DataColumn2(
            label: Text(AppTexts.usersColName, style: _headerStyle),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text(AppTexts.usersColEmail, style: _headerStyle),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text(AppTexts.usersColTotalAds, style: _headerStyle),
            size: ColumnSize.S,
            fixedWidth: 110.w,
          ),
          DataColumn2(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppTexts.usersColStatus, style: _headerStyle),
                SizedBox(width: 4.w),
                GestureDetector(
                  onTap: () => setState(() => _sortAscending = !_sortAscending),
                  child: Icon(
                    Icons.unfold_more,
                    size: 18.sp,
                    color: AppColors.textDarkGrey,
                  ),
                ),
              ],
            ),
            size: ColumnSize.S,
            fixedWidth: 120.w,
          ),
          DataColumn2(
            label: const SizedBox.shrink(),
            size: ColumnSize.S,
            fixedWidth: 56.w,
          ),
        ],
        rows: List.generate(rows.length, (index) {
          final user = rows[index];
          final rowColor = index.isEven ? Colors.white : AppColors.tableRowAlternate;

          return DataRow2(
            color: WidgetStateProperty.all(rowColor),
            cells: [
              DataCell(Text(user.id, style: _cellStyle)),
              DataCell(Text(user.name, style: _cellStyle)),
              DataCell(Text(user.email, style: _cellStyle)),
              DataCell(Text(user.totalAds.toString(), style: _cellStyle)),
              DataCell(
                Text(
                  user.status == UserAccountStatus.active
                      ? AppTexts.usersStatusActive
                      : AppTexts.usersStatusBlocked,
                  style: _cellStyle,
                ),
              ),
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
