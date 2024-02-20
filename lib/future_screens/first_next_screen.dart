import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';

class FirstNextScreen extends StatefulWidget {
  const FirstNextScreen({super.key});

  @override
  State<FirstNextScreen> createState() => _FirstNextScreenState();
}

class _FirstNextScreenState extends State<FirstNextScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(child: Scaffold(), value: SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent
    ));
  }
}
