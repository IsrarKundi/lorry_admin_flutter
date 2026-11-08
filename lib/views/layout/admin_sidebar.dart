import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/admin_nav_item.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_dimens.dart';
import 'admin_nav_config.dart';
import 'shell_styles.dart';
import 'widgets/admin_nav_icon.dart';

class AdminSidebar extends StatelessWidget {
  const AdminSidebar({super.key, required this.currentPath});

  final String currentPath;

  bool _isActive(String path) {
    if (path == '/dashboard') {
      return currentPath == '/dashboard' || currentPath == '/';
    }
    return currentPath.startsWith(path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.sidebarWidth,
      decoration: const BoxDecoration(
        color: AppColors.sidebarBackground,
        border: Border(
          right: BorderSide(color: AppColors.authDivider, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                AppConstants.logoAsset,
                height: 172.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: AdminNavConfig.items.length,
              itemBuilder: (context, index) {
                final item = AdminNavConfig.items[index];
                return _NavTile(
                  item: item,
                  isActive: _isActive(item.path),
                  onTap: () => context.go(item.path),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  final AdminNavItem item;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.primary : AppColors.textDarkGrey;

    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Material(
        color: isActive ? AppColors.navActiveBackground : Colors.transparent,
        borderRadius: BorderRadius.circular(ShellStyles.navItemRadius),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(ShellStyles.navItemRadius),
          hoverColor: AppColors.navActiveBackground.withValues(alpha: 0.5),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              children: [
                AdminNavIcon(asset: item.iconAsset, color: color),
                SizedBox(width: 14.w),
                Expanded(
                  child: Text(
                    item.label,
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
