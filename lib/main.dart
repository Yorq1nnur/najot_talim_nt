import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/screens/global_screen/global_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) =>
      ScreenUtilInit(
        designSize: const Size(
          428,
          926,
        ),
        builder: (context, child) {
          ScreenUtil.init(
            context,
          );
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: false,
              scaffoldBackgroundColor: AppColors.white,
            ),
            home: child,
          );
        },
        child: const GlobalScreen(),
      );
}
