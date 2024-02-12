// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/accessories_screen.dart';
import 'package:najot_talim_nt/all_screen.dart';
import 'package:najot_talim_nt/buttons.dart';
import 'package:najot_talim_nt/computers_screen.dart';
import 'package:najot_talim_nt/smart_objects_screen.dart';
import 'package:najot_talim_nt/smartphones_screen.dart';
import 'package:najot_talim_nt/speakers_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppImages.arrowBack,
                        height: 24.h,
                        width: 28.w,
                      ),
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      "Categories",
                      style: AppTextStyle.interBold.copyWith(
                        color: AppColors.c_0A1034,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButtons(
                              title: "All",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AllScreen();
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            TextButtons(
                              title: "Computers",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ComputerScreen();
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            TextButtons(
                              title: "Accessories",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AccessoriesScreen();
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            TextButtons(
                              title: "Smartphones",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SmartPhonesScreen();
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            TextButtons(
                              title: "Smart objects",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SmartObjectsScreen();
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            TextButtons(
                              title: "Speakers",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SpeakersScreen();
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 50.w,
                  vertical: 20.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.c_EFF5FB,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      color: AppColors.transparent,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppImages.bottomHome,
                          width: 18.w,
                          height: 18.h,
                        ),
                        style: IconButton.styleFrom(padding: EdgeInsets.zero),
                      ),
                    ),
                    Material(
                      color: AppColors.transparent,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppImages.bottomSearch,
                          width: 18.w,
                          height: 18.h,
                        ),
                        style: IconButton.styleFrom(padding: EdgeInsets.zero),
                      ),
                    ),
                    Material(
                      color: AppColors.transparent,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppImages.bottomShop,
                          width: 18.w,
                          height: 18.h,
                        ),
                        style: IconButton.styleFrom(padding: EdgeInsets.zero),
                      ),
                    ),
                    Material(
                      color: AppColors.transparent,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppImages.arrowProfile,
                          width: 14.w,
                          height: 18.h,
                        ),
                        style: IconButton.styleFrom(padding: EdgeInsets.zero),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
