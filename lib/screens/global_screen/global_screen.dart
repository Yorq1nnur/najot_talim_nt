// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/screens/first_screen/first_screen.dart';
import 'package:najot_talim_nt/screens/fourth_screen/fourth_screen.dart';
import 'package:najot_talim_nt/screens/second_screen/second_screen.dart';
import 'package:najot_talim_nt/screens/third_screen/third_screen.dart';
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
              buttonModels.length,
              (index) => ZoomTapAnimation(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => buttonModels[index].widget,
                    ),
                  );
                },
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
                      buttonModels[index].title,
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

class ButtonModels {
  final String title;
  final Widget widget;

  ButtonModels({
    required this.title,
    required this.widget,
  });
}

final List<ButtonModels> buttonModels = [
  ButtonModels(
    title: "FIRST SCREEN",
    widget: FirstScreen(title: "FIRST SCREEN"),
  ),
  ButtonModels(
    title: "SECOND SCREEN",
    widget: SecondScreen(title: "SECOND SCREEN"),
  ),
  ButtonModels(
    title: "THIRD SCREEN",
    widget: ThirdScreen(title: "THIRD SCREEN"),
  ),
  ButtonModels(
    title: "FOURTH SCREEN",
    widget: FourthScreen(title: "FOURTH SCREEN"),
  ),
];
