import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/global_widgets/second_small_circle_container.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class SecondCenterContainer extends StatelessWidget {
  const SecondCenterContainer({super.key});

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
                  imagePath: AppImages.shop,
                ),
                SizedBox(
                  width: 16.w,
                ),
                RichText(
                  text: TextSpan(
                    text: "Grocery",
                    style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.cEEEEEE,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(width: 90.w,),
                RichText(
                  text: TextSpan(
                    text: "-\$400",
                    style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.cEEEEEE,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
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
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SecondSmallCircleContainer(
                  imagePath: AppImages.iescoBill,
                ),
                SizedBox(
                  width: 16.w,
                ),
                RichText(
                  text: TextSpan(
                    text: "IESCO Bill",
                    style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.cEEEEEE,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(width: 78.w,),
                RichText(
                  text: TextSpan(
                    text: "-\$120",
                    style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.cEEEEEE,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
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
