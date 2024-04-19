import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:najot_talim_nt/screens/play/play_screen.dart';
import 'package:najot_talim_nt/screens/widgets/background_contaioner.dart';
import 'package:najot_talim_nt/screens/widgets/status_bar.dart';
import 'package:najot_talim_nt/utils/app_colors.dart';
import 'package:najot_talim_nt/utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const PlayScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: StatusBarItems.systemUiOverlayStyle(),
      child: Scaffold(
        body: BackGroundContainer(
          widget: Lottie.asset(
            AppImages.lottie,
          ),
        ),
      ),
    );
  }
}
