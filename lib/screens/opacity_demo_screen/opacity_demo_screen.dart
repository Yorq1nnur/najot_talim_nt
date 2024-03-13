// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class OpacityDemoScreen extends StatefulWidget {
  const OpacityDemoScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<OpacityDemoScreen> createState() => _OpacityDemoScreenState();
}

class _OpacityDemoScreenState extends State<OpacityDemoScreen> {
  double opacityLevel = 1.0;

  void changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: AppTextStyle.interBold.copyWith(
            color: AppColors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 2),
          curve: Curves.decelerate,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.amberAccent,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeOpacity,
        child: const Icon(Icons.qr_code_scanner_outlined),
      ),
    );
  }
}
