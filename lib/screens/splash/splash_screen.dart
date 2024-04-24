import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:najot_talim_nt/screens/book/book_screen.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import '../../utils/size/size_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BookScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return  Scaffold(
      body: Center(
        child: Lottie.asset(
          AppImages.lottie,
        ),
      ),
    );
  }
}
