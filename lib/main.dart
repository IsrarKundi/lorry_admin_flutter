import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'routes/app_router.dart';
import 'themes/app_theme.dart';
import 'utils/app_texts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LorryAddaAdminApp());
}

class LorryAddaAdminApp extends StatelessWidget {
  const LorryAddaAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: AppTexts.appTitle,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          routerConfig: appRouter,
        );
      },
    );
  }
}
