import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class ViewItems extends StatelessWidget {
  const ViewItems({
    super.key,
    required this.onTap,
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });

  final VoidCallback onTap;
  final String title;
  final String subTitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      titleTextStyle: AppTextStyle.interBold.copyWith(
        color: AppColors.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.w900,
      ),
      subtitle: Text(subTitle),
      subtitleTextStyle: AppTextStyle.interBold.copyWith(
        color: AppColors.black.withOpacity(
          0.5,
        ),
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      trailing: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            16.r,
          ),
          border: Border.all(
            color: AppColors.black,
            width: 1.w,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            16.r,
          ),
          child: Image.network(
            imagePath,
            height: 50.h,
            width: 100.w,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
