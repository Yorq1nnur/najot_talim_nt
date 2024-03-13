// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class AnimatedPaddingScreen extends StatefulWidget {
  const AnimatedPaddingScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<AnimatedPaddingScreen> createState() => _AnimatedPaddingScreenState();
}

class _AnimatedPaddingScreenState extends State<AnimatedPaddingScreen> {
  bool isTrue = false;

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
        child: InkWell(
          onTap: () {
            setState(() {
              isTrue = !isTrue;
            });
          },
          child: AnimatedContainer(
            height: 200,
            duration: const Duration(seconds: 3),
            color: Colors.blue,
            width: isTrue ? 400 : 100,
          ),
        ),
      ),
    );
  }
}
