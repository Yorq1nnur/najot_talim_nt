import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';

class ButtonItems extends StatelessWidget {
  const ButtonItems({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: 50.h,
        width: 50.w,
        margin: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 5.h,
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            imageUrl,
            // width: 20.w,
            // height: 35.h,
          ),
        ),
      ),
    );
  }
}
