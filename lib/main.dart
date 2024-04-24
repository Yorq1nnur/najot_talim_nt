import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/screens/splash/splash_screen.dart';
import 'package:najot_talim_nt/services/book_manager_services.dart';
import 'bloc/book_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FileManagerService();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BookBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(
          376,
          815,
        ),
        builder: (
          context,
          child,
        ) {
          ScreenUtil.init(
            context,
          );
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.black,
              useMaterial3: false,
            ),
            home: child,
          );
        },
        child: const SplashScreen(),
      ),
    );
  }
}
