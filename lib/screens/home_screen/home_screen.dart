// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/global_widgets/small_circle_container.dart';
import 'package:najot_talim_nt/screens/home_screen/models/small_container_model.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        backgroundColor: AppColors.c414A61,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 25.w,
                right: 25.w,
                top: 33.h,
                bottom: 23.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning!",
                        style: AppTextStyle.interMedium.copyWith(
                          color: AppColors.cCECECE,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "John Smith",
                        style: AppTextStyle.interMedium.copyWith(
                          color: AppColors.cF9F9F9,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    AppImages.profile,
                    height: 60.h,
                    width: 60.w,
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$ 8,640.00",
                    style: AppTextStyle.interMedium.copyWith(
                      color: AppColors.cF9F9F9,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "Available Balance",
                    style: AppTextStyle.interMedium.copyWith(
                      color: AppColors.cD8D8D8,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                15.w,
                33.h,
                15.w,
                27.h,
              ),
              margin: EdgeInsets.only(
                top: 23.h,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.c000000,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.r),
                  topRight: Radius.circular(50.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        imagesPath.length,
                        (index) => SmallCircleContainer(
                          imagePath: imagesPath[index],
                          imageHeight: imageHeight[index],
                          imageWidth: imageWidth[index],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
