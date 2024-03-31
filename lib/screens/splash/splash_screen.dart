import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:najot_talim_nt/screens/addresses/addresses_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/view_models/maps_view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const AddressesScreen();
          },
        ),
      );
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<MapsViewModel>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Lottie.asset(
          AppImages.lottie,
        ),
      ),
    );
  }
}