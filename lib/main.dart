import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/bloc/game_bloc.dart';
import 'package:najot_talim_nt/bloc/game_event.dart';
import 'package:najot_talim_nt/screens/splash/splash_screen.dart';
import 'package:najot_talim_nt/utils/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        375,
        812,
      ),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => GameBloc()
                ..add(
                  LoadQuestionsEvent(),
                ),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.black,
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.black
              ),
              useMaterial3: false,
            ),
            home: child,
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}
