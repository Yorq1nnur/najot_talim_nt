import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';

class BottomRow extends StatelessWidget {
  const BottomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 50.w,
        vertical: 20.h,
      ),
      decoration: const BoxDecoration(
        color: AppColors.c_EFF5FB,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: AppColors.transparent,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppImages.bottomHome,
                width: 18.w,
                height: 18.h,
              ),
              style: IconButton.styleFrom(padding: EdgeInsets.zero),
            ),
          ),
          Material(
            color: AppColors.transparent,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppImages.bottomSearch,
                width: 18.w,
                height: 18.h,
              ),
              style: IconButton.styleFrom(padding: EdgeInsets.zero),
            ),
          ),
          Material(
            color: AppColors.transparent,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppImages.bottomShop,
                width: 18.w,
                height: 18.h,
              ),
              style: IconButton.styleFrom(padding: EdgeInsets.zero),
            ),
          ),
          Material(
            color: AppColors.transparent,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppImages.arrowProfile,
                width: 14.w,
                height: 18.h,
              ),
              style: IconButton.styleFrom(padding: EdgeInsets.zero),
            ),
          ),
        ],
      ),
    );
  }
}
