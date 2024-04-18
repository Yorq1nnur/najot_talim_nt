import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najot_talim_nt/data/result.dart';
import 'package:najot_talim_nt/ui/screen/game/game_screen.dart';
import 'package:najot_talim_nt/ui/screen/game/game_screen_presenter.dart';
import 'package:najot_talim_nt/ui/screen/game/section/victory.dart';
import 'package:najot_talim_nt/ui/screen/theme_provider.dart';
import 'package:najot_talim_nt/utils/lib/provider/provider_ext.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) {
          return ThemeProvider()..init();
        }),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.provider<ThemeProvider>();

    const title = "Sliding puzzle";
    transparentStatusBar(themeProvider.useDarkTheme);

    log('theme = ${themeProvider.useDarkTheme}');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: themeProvider.themeData,
      home: Builder(
        builder: (context) {
          return GameScreenPresenter(
            child: const GameScreen(),
            onSolve: (Result result) {
              showDialog(
                context: context,
                builder: (context) => GameVictoryDialog(result: result),
              );
            },
          );
        },
      ),
    );
  }

  void transparentStatusBar(bool useDarkTheme) {
    final overlay =
        useDarkTheme ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;
    SystemChrome.setSystemUIOverlayStyle(
      overlay.copyWith(statusBarColor: Colors.transparent),
    );
  }
}
