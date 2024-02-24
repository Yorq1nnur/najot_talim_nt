import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class OptionsRow extends StatelessWidget {
  const OptionsRow({
    super.key,
    required this.title,
    required this.imagePath,
  });

  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Container(
            height: 52.w,
            width: 52.w,
            decoration: const BoxDecoration(
              color: AppColors.c6A6A6A,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                imagePath,
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Text(
            title,
            style: AppTextStyle.interMedium.copyWith(
              color: AppColors.cEEEEEE,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            AppImages.arrowFollow,
          ),
        ],
      ),
    );
  }
}
