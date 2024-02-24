import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/global_widgets/second_small_circle_container.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class CenterContainer extends StatelessWidget {
  const CenterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 25.h,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 17.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.c292929,
        borderRadius: BorderRadius.circular(
          16.r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SecondSmallCircleContainer(
                  imagePath: AppImages.visa,
                ),
                SizedBox(
                  width: 16.w,
                ),
                RichText(
                  text: TextSpan(
                    text: "Visa Card\n",
                    style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.cEEEEEE,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: "**3245",
                        style: AppTextStyle.interMedium.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.cEEEEEE.withOpacity(
                            0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 73.w,),
                RichText(
                  text: TextSpan(
                    text: "\$2,200\n",
                    style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.cEEEEEE,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: "01/24",
                        style: AppTextStyle.interMedium.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.cEEEEEE.withOpacity(
                            0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 19.h),
            height: 1.h,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppColors.c585858
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SecondSmallCircleContainer(
                  imagePath: AppImages.masterCard,
                ),
                SizedBox(
                  width: 16.w,
                ),
                RichText(
                  text: TextSpan(
                    text: "Master Card\n",
                    style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.cEEEEEE,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: "**6539",
                        style: AppTextStyle.interMedium.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.cEEEEEE.withOpacity(
                            0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 67.w,),
                RichText(
                  text: TextSpan(
                    text: "\$650\n",
                    style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.cEEEEEE,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: "04/23",
                        style: AppTextStyle.interMedium.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.cEEEEEE.withOpacity(
                            0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
