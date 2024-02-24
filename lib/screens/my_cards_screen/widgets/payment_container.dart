import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class PaymentContainer extends StatelessWidget {
  const PaymentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 48.h),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.c414A61,
          borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.only(
            left: 15.w, right: 19.w, top: 22.h, bottom: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Make a Payment",
              style: AppTextStyle.interMedium.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$220",
                  style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Due: Feb 10, 2022",
                  style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.white.withOpacity(
                      0.76,
                    ),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
