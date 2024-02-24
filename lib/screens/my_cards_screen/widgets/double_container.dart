import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class DoubleContainer extends StatelessWidget {
  const DoubleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 40.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: AppColors.c414A61,
                borderRadius: BorderRadius.circular(
                  20.r,
                ),
              ),
              child: Center(
                child: Text(
                  "Settings",
                  style: AppTextStyle.interMedium.copyWith(
                      color: AppColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              width: 130.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: AppColors.c414A61.withOpacity(
                  0.5,
                ),
                borderRadius: BorderRadius.circular(
                  20.r,
                ),
              ),
              child: Center(
                child: Text(
                  "Transactions",
                  style: AppTextStyle.interMedium.copyWith(
                      color: AppColors.white.withOpacity(
                        0.5,
                      ),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
