import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/screens/splash_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/view_models/location_view_model.dart';
import 'package:najot_talim_nt/view_models/maps_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LocationViewModel()),
      ChangeNotifierProvider(create: (_) => MapsViewModel()),
      ChangeNotifierProvider(create: (_) => LocationViewModel()),
    ],
    child: const MyApp(),
  ));
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
        child: const SplashScreen(),
      );
}
