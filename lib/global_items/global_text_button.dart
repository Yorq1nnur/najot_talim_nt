import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class GlobalTextBotton extends StatelessWidget {
  const GlobalTextBotton({super.key, required this.onTap, required this.title});

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            4.r,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.c0001FC.withOpacity(
                0.08,
              ),
              blurRadius: 40.r,
              offset: Offset(
                0,
                16.r,
              ),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyle.interBold.copyWith(
                color: AppColors.c0001FC,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
