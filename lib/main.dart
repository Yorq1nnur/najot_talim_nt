import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/storage_repository/storage_repository.dart';
import 'package:najot_talim_nt/screens/login_screen/login_screen.dart';
import 'package:najot_talim_nt/screens/registration_screen/registration_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/constants/app_constants.dart';
import 'cubits/currency/countries_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.instance;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CountriesCubit()..fetchCountries()),
      ],
      child: const MyApp(),
    ),
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
          375,
          812,
        ),
        builder: (context, child) {
          ScreenUtil.init(
            context,
          );
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: AppColors.white,
            ),
            home: child,
          );
        },
        child: StorageRepository.getBool(key: AppConstants.isRegistered)
            ? const LoginScreen()
            : const RegistrationScreen(),
      );
}
