import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/local/storage_repository.dart';
import 'package:najot_talim_nt/screens/global_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  StorageRepository.instance;

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor:  AppColors.c0001FC,
              useMaterial3: false),
          home: child,
        );
      },
      child: const GlobalScreen(),
    );
  }
}