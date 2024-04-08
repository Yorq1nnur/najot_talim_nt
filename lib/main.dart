import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/blocs/books/books_bloc.dart';
import 'package:najot_talim_nt/data/repositories/books_repository.dart';
import 'package:najot_talim_nt/screens/card/card_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'blocs/books/books_event.dart';
import 'data/api_provider/api_provider.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = ApiProvider();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => BooksRepository(
            apiProvider: apiProvider,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BooksBloc(
              booksRepository: context.read<BooksRepository>(),
            )..add(
                GetBooksEvent(),
              ),
          )
        ],
        child: const MyApp(),
      ),
    );
  }
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
              useMaterial3: false,
              scaffoldBackgroundColor: AppColors.white,
            ),
            home: child,
          );
        },
        child: const CardScreen(),
      );
}
