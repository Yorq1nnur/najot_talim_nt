import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:najot_talim_nt/screens/global_screen/global_screen.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';

class MyGameScreen extends StatefulWidget {
  const MyGameScreen({super.key});

  @override
  State<MyGameScreen> createState() => _MyGameScreenState();
}

class _MyGameScreenState extends State<MyGameScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const GlobalScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Center(
          child: Lottie.asset(
            AppImages.lottie,
          ),
        ),
      ),
    );
  }
}
