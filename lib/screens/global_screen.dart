// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

import '../utils/colors/app_colors.dart';

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
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 72.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 110.w,
                  vertical: 16.h,
                ),
                decoration: BoxDecoration(color: AppColors.white),
                child: Text(
                  "Let’s start",
                  style: AppTextStyle.interBold.copyWith(
                      color: AppColors.c0001FC,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
