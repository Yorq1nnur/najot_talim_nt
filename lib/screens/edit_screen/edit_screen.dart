// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/product_model.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: ZoomTapAnimation(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.black,
                size: 20.sp,
              ),
            ),
          ),
          title: Text(
            "UPDATE ITEM",
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w900,
              fontSize: 20.sp,
            ),
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}
