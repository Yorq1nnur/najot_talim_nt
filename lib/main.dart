import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:najot_talim_nt/screens/splash_screen/splash_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        411,
        823,
      ),
      builder: (context, child) {
        ScreenUtil.init(context);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: false,
            scaffoldBackgroundColor: AppColors.white,
          ),
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
