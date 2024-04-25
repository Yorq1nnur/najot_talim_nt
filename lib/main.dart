import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/bloc/book_bloc.dart';
import 'package:najot_talim_nt/screens/tab_box.dart';
import 'package:najot_talim_nt/services/book_manager_services.dart';

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
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BookBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(
          360,
          800,
        ),
        builder: (context, child) {
          ScreenUtil.init(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
              ),
              useMaterial3: false,
              canvasColor: Colors.black,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
              ),
            ),
            home: child,
          );
        },
        child: const TabBox(),
      ),
    );
  }
}
