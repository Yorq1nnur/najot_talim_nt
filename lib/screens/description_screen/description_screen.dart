// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najot_talim_nt/data/models/product_model.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/size/size_utils.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: ZoomTapAnimation(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
