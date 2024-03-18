// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/models/button_model/button_model.dart';
import 'package:najot_talim_nt/screens/global_screen/widgets/button_items.dart';
import 'package:najot_talim_nt/screens/global_screen/widgets/result_item.dart';
import 'package:najot_talim_nt/screens/global_screen/widgets/second_button_items.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: AppColors.white,
              height: 440.h,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 200.h,
                  bottom: 120.h,
                ),
                child: ResultItem(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 20.h,
                ),
                height: 350.h,
                decoration: BoxDecoration(
                  color: AppColors.cE9F6FF,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      20.r,
                    ),
                    topRight: Radius.circular(
                      20.r,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          buttonModels.length,
                          (index) => ButtonItems(
                            imageUrl: buttonModels[index].image,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          firstButtonModel.length,
                          (index) => SecondButtonItems(
                            text: firstButtonModel[index],
                          ),
                        ),
                        ButtonItems(
                          imageUrl: AppImages.multiply,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          firstButtonModel.length,
                          (index) => SecondButtonItems(
                            text: secondButtonModel[index],
                          ),
                        ),
                        ButtonItems(
                          imageUrl: AppImages.subtract,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          firstButtonModel.length,
                          (index) => SecondButtonItems(
                            text: thirdButtonModel[index],
                          ),
                        ),
                        ButtonItems(
                          imageUrl: AppImages.add,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          fourthButtonModel.length,
                          (index) => SecondButtonItems(
                            text: fourthButtonModel[index],
                          ),
                        ),
                        ButtonItems(
                          imageUrl: AppImages.history,
                        ),
                        ButtonItems(
                          imageUrl: AppImages.equal,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
