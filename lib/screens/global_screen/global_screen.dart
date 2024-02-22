// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

import '../../utils/colors/app_colors.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 160.h,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "LATECH",
                        style: AppTextStyle.interBold.copyWith(
                            color: AppColors.white,
                            fontSize: 42.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "TECH MARKET",
                        style: AppTextStyle.interBold.copyWith(
                          color: AppColors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  AppImages.first,
                  height: 216.h,
                  width: 216.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 70.h,),
              Material(
                color: AppColors.transparent,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnBoardingScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(
                        4.r,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.c0001FC.withOpacity(
                            0.08,
                          ),
                          blurRadius: 40.r,
                          offset: Offset(
                            0,
                            16.r,
                          ),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Let’s start",
                        style: AppTextStyle.interBold.copyWith(
                            color: AppColors.c0001FC,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70.h,),
              Center(
                child: Text(
                  "Skip for now",
                  style: AppTextStyle.interBold.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
