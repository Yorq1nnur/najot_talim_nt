// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "CUSTOM PAINT",
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...List.generate(
              titles.length,
              (index) => ZoomTapAnimation(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 10.w,
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(
                      16.r,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      titles[index],
                      style: AppTextStyle.interBold.copyWith(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> titles = [
  "FIRST SCREEN",
  "SECOND SCREEN",
  "THIRD SCREEN",
  "FOURTH SCREEN",
];
