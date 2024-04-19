import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:najot_talim_nt/screens/play/play_screen.dart';
import 'package:najot_talim_nt/screens/widgets/background_contaioner.dart';
import 'package:najot_talim_nt/screens/widgets/status_bar.dart';
import 'package:najot_talim_nt/utils/app_images.dart';

class LottieScreen extends StatefulWidget {
  const LottieScreen({super.key});

  @override
  State<LottieScreen> createState() => _LottieScreenState();
}

class _LottieScreenState extends State<LottieScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
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
          widget: Center(
            child: Lottie.asset(AppImages.victory),
          ),
        ),
      ),
    );
  }
}
