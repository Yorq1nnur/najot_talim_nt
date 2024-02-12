import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class TextButtons extends StatefulWidget {
  const TextButtons({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  State<TextButtons> createState() => _TextButtonsState();
}

class _TextButtonsState extends State<TextButtons> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 24.w,
          top: 28.h,
          bottom: 28.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: AppColors.c_000000.withOpacity(0.04),
              blurRadius: 40,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Text(
          widget.title,
          style: AppTextStyle.interBold.copyWith(
            color: AppColors.c_0A1034,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
