import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/admin_user.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../layout/shell_styles.dart';
import 'users_mock_data.dart';
import 'widgets/users_data_table.dart';
import 'widgets/users_filter_buttons.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  UserAccountStatus _filter = UserAccountStatus.active;

  List<AdminUser> get _filteredUsers => UsersMockData.all
      .where((u) => u.status == _filter)
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppTexts.usersPageTitle,
              style: GoogleFonts.inter(
                fontSize: ShellStyles.pageTitleSize,
                fontWeight: FontWeight.w700,
                color: AppColors.textBold,
                height: 1.1,
              ),
            ),
            const Spacer(),
            UsersFilterButtons(
              onChanged: (status) => setState(() => _filter = status),
            ),
          ],
        ),
        SizedBox(height: 28.h),
        Expanded(
          child: UsersDataTable(users: _filteredUsers),
        ),
      ],
    );
  }
}
