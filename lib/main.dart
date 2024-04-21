import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/screens/tab_box/tab_box_screen.dart';
import 'bloc/scanner_bloc.dart';
import 'bloc/scanner_event.dart';

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
        428,
        926,
      ),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => ScannerBloc()..add(LoadScannerEvent()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: child,
          ),
        );
      },
      child: const TabBoxScreen(),
    );
  }
}
