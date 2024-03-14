// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/first_model/first_model.dart';
import 'package:najot_talim_nt/screens/first_detail_screen/widgets/detail_items.dart';
import 'package:najot_talim_nt/screens/first_screen/widgets/call_links.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class FirstDetailScreen extends StatefulWidget {
  const FirstDetailScreen({
    super.key,
    required this.firstModel,
  });

  final FirstModel firstModel;

  @override
  State<FirstDetailScreen> createState() => _FirstDetailScreenState();
}

class _FirstDetailScreenState extends State<FirstDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: Text(
            widget.firstModel.name["official"],
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              decoration:
                  BoxDecoration(color: AppColors.black, shape: BoxShape.circle),
              child: Text(
                widget.firstModel.flag,
                style: AppTextStyle.interBold.copyWith(fontSize: 16.sp),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            CallLinks(
              link: widget.firstModel.maps["googleMaps"],
              imagePath: AppImages.map,
            ),
            SizedBox(
              width: 20.w,
            ),
            CallLinks(
              link: widget.firstModel.maps["openStreetMaps"],
              imagePath: AppImages.cityMap,
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailItems(
                title: "DAVLAT NOMI",
                subTitle: widget.firstModel.name["common"],
              ),
              SizedBox(
                height: 20.h,
              ),
              DetailItems(
                title: "POYTAXTI:",
                subTitle: widget.firstModel.capital[0],
              ),
              SizedBox(
                height: 20.h,
              ),
              DetailItems(
                title: "AHOLISI:",
                subTitle: widget.firstModel.population.toString(),
              ),
              SizedBox(
                height: 20.h,
              ),
              DetailItems(
                title: "FIFADA NOMLANISHI:",
                subTitle: widget.firstModel.fifa,
              ),
              SizedBox(
                height: 20.h,
              ),
              DetailItems(
                title: "HOLATI:",
                subTitle: widget.firstModel.independent
                    ? "Mustaqil"
                    : "Mustaqil emas",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
