import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              AppImages.background,
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 33.h),
                child: SizedBox(
                  width: 100.w,
                  height: 75.h,
                  child: Stack(
                    children: [
                      Image.asset(
                        AppImages.cub,
                        width: 100.w,
                        height: 75.h,
                        fit: BoxFit.fill,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "1",
                          style: AppTextStyle.interBold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            50.r,
                          ),
                          border: Border.all(
                            color: AppColors.c3E87FF,
                            width: 2.w,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            SvgPicture.asset(
                              AppImages.star,
                              height: 26.h,
                              width: 25.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "0",
                              style: AppTextStyle.interBold,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 40.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            50.r,
                          ),
                          border: Border.all(
                            color: AppColors.c3E87FF,
                            width: 2.w,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "0",
                              style: AppTextStyle.interBold,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            SvgPicture.asset(
                              AppImages.silver,
                              height: 28.h,
                              width: 25.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 45.h,
                          width: 50.w,
                          child: Stack(
                            children: [
                              Container(
                                height: 50.h,
                                width: 50.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.c3E87FF,
                                  border: Border.all(
                                    color: AppColors.c3E87FF,
                                    width: 2.w,
                                  ),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(AppImages.lamp, width: 16.w, height: 27.w,),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Container(
                                    height: 20.h,
                                    width: 20.h,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.c0045B5,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: AppColors.white,
                                        size: 15.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
