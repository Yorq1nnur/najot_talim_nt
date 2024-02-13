import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class CategoryModel extends StatefulWidget {
  const CategoryModel(
      {super.key,
      required this.image,
      required this.title,
      required this.price});

  final String image;
  final String title;
  final int price;

  @override
  State<CategoryModel> createState() => _CategoryModelState();
}

class _CategoryModelState extends State<CategoryModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: AppColors.c_000000.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 32.h,
          ),
          Center(
            child: Image.asset(
              widget.image,
              height: 69.h,
              width: 169.w,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Text(
              widget.title,
              style: AppTextStyle.interBold.copyWith(
                color: AppColors.c_0A1034,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Text(
              "USD ${widget.price}",
              style: AppTextStyle.interBold.copyWith(
                color: AppColors.c_0A1034,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
