import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class CardsContainer extends StatelessWidget {
  const CardsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 48.h,
        bottom: 19.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.c5A6D9E,
            AppColors.cBECAF5,
          ],
        ),
        borderRadius: BorderRadius.circular(
          20.r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset(
              AppImages.visa,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "**** **** **** 3245",
            style: AppTextStyle.interMedium.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.c031952.withOpacity(
                0.86,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "Available Balance",
            style: AppTextStyle.interMedium.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.white.withOpacity(
                0.8,
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$2,200",
                style: AppTextStyle.interMedium.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white),
              ),
              Text(
                "01/24",
                style: AppTextStyle.interMedium.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
