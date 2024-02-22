import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';

class FreeScreen extends StatefulWidget {
  const FreeScreen({super.key});

  @override
  State<FreeScreen> createState() => _FreeScreenState();
}

class _FreeScreenState extends State<FreeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
        ),
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.yellowAccent,
              ],
            )),
            child: Center(
              child: Lottie.asset(AppImages.lottie),
            ),
          ),
        ));
  }
}
