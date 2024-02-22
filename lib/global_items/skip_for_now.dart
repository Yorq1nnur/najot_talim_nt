import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class SkipForNow extends StatelessWidget {
  const SkipForNow({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: onTap,
      child: Text(
        "Skip for now",
        style: AppTextStyle.interBold.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
