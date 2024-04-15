import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/screens/global_screen/countries_screen.dart';
import 'blocs/countries_bloc.dart';
import 'data/api/api_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ApiClient apiClient =
      ApiClient(graphQLClient: ApiClient.create().graphQLClient);

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) =>
          CountriesBloc(apiClient: apiClient)..add(FetchCountries('EU')),
    )
  ], child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        375,
        812,
      ),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false),
          home: child,
        );
      },
      child: const CountriesScreen(),
    );
  }
}
