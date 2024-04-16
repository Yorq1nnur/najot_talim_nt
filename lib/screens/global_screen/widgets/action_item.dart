import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';

class ActionItems extends StatelessWidget {
  const ActionItems({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      width: 57.w,
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
              child: SvgPicture.asset(
                imagePath,
                width: 16.w,
                height: 27.w,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.w,
              ),
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
    );
  }
}
