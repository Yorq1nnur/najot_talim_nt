import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 10.w,),
        Text(
          "Transfer",
          style: AppTextStyle.interMedium.copyWith(
            color: AppColors.cEEEEEE,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 35.w,),
        Text(
          "Bills",
          style: AppTextStyle.interMedium.copyWith(
            color: AppColors.cEEEEEE,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 35.w,),
        Text(
          "Recharge",
          style: AppTextStyle.interMedium.copyWith(
            color: AppColors.cEEEEEE,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 30.w,),
        Text(
          "More",
          style: AppTextStyle.interMedium.copyWith(
            color: AppColors.cEEEEEE,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
