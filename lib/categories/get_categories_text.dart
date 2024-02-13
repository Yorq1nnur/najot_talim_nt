import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class GetCategoriesText extends StatelessWidget {
  const GetCategoriesText({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: onTap,
            icon: SvgPicture.asset(
              AppImages.arrowBack,
              height: 24.h,
              width: 28.w,
            ),
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            title,
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.c_0A1034,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
        ],
      ),
    );
  }
}
