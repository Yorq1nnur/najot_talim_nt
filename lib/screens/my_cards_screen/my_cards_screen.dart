// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/screens/my_cards_screen/models/color_model.dart';
import 'package:najot_talim_nt/screens/my_cards_screen/widgets/cards_container.dart';
import 'package:najot_talim_nt/screens/my_cards_screen/widgets/center_small_containers.dart';
import 'package:najot_talim_nt/screens/my_cards_screen/widgets/double_container.dart';
import 'package:najot_talim_nt/screens/my_cards_screen/widgets/options_row.dart';
import 'package:najot_talim_nt/screens/my_cards_screen/widgets/payment_container.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class MyCardsScreen extends StatefulWidget {
  const MyCardsScreen({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  State<MyCardsScreen> createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
            vertical: 46.h,
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  "My Cards",
                  style: AppTextStyle.interThin.copyWith(
                    color: AppColors.cF9F9F9,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardsContainer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                              containerColors.length,
                              (index) => CenterSmallContainers(
                                  containerColor: containerColors[index]))
                        ],
                      ),
                      PaymentContainer(),
                      DoubleContainer(),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 20.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.c292929,
                          borderRadius: BorderRadius.circular(
                            20.r,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OptionsRow(title: "View Statement", imagePath: AppImages.viewStatement),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20.h),
                              width: double.infinity,
                              height: 1.h,
                              decoration: BoxDecoration(
                                color: AppColors.c585858
                              ),
                            ),
                            OptionsRow(title: "Change pin", imagePath: AppImages.changePin),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20.h),
                              width: double.infinity,
                              height: 1.h,
                              decoration: BoxDecoration(
                                  color: AppColors.c585858
                              ),
                            ),
                            OptionsRow(title: "Remove card", imagePath: AppImages.removeCard),
                          ],
                        ),
                      )
                    ],
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
