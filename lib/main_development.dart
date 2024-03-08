import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/app_router.dart';
import 'core/config/application_theme.dart';
import 'core/config/page_route_names.dart';
import 'core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Fix text hides in release mode
  await ScreenUtil.ensureScreenSize();

  // Setup getIt package for DI
  configureDependencies();

  // Run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-Commerce Development',
          theme: ApplicationTheme.applicationTheme,
          themeMode: ThemeMode.light,
          initialRoute: PageRouteNames.initial,
          onGenerateRoute: AppRouter.onGeneratedRoute,
          builder: EasyLoading.init(
            builder: BotToastInit(),
          ),
        );
      },
    );
  }
}
