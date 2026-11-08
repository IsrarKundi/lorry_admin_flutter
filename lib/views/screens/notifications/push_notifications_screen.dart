import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/push_notification_item.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../custom_widgets/app_snackbar.dart';
import '../../layout/shell_styles.dart';
import 'notifications_mock_data.dart';
import 'widgets/notifications_table.dart';
import 'widgets/send_notification_dialog.dart';

class PushNotificationsScreen extends StatefulWidget {
  const PushNotificationsScreen({super.key});

  @override
  State<PushNotificationsScreen> createState() => _PushNotificationsScreenState();
}

class _PushNotificationsScreenState extends State<PushNotificationsScreen> {
  late List<PushNotificationItem> _items =
      List.from(NotificationsMockData.initial);

  Future<void> _onSendNew() async {
    final result = await SendNotificationDialog.show(context);
    if (result == null || !mounted) return;

    setState(() {
      _items = [
        PushNotificationItem(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          sentAt: DateTime.now(),
          title: result.title,
          body: result.body,
        ),
        ..._items,
      ];
    });
    AppSnackbar.success(context, AppTexts.notificationsSentSuccess);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppTexts.notificationsPageTitle,
              style: GoogleFonts.inter(
                fontSize: ShellStyles.pageTitleSize,
                fontWeight: FontWeight.w700,
                color: AppColors.textBold,
                height: 1.1,
              ),
            ),
            const Spacer(),
            Material(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10.r),
              child: InkWell(
                onTap: _onSendNew,
                borderRadius: BorderRadius.circular(10.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  child: Text(
                    AppTexts.notificationsSendNew,
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 28.h),
        Expanded(child: NotificationsTable(items: _items)),
      ],
    );
  }
}
