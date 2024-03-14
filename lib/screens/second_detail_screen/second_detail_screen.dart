// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/second_model/second_model.dart';
import 'package:najot_talim_nt/screens/second_detail_screen/widgets/second_detail_items.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:carousel_slider/carousel_controller.dart';

class SecondDetailScreen extends StatelessWidget {
  const SecondDetailScreen({
    super.key,
    required this.secondModel,
  });

  final SecondModel secondModel;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            secondModel.name,
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.black,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(
                  16.r,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  16.r,
                ),
                child: Image.network(
                  secondModel.avatarUrl,
                  height: 30.h,
                  width: 30.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: List.generate(
                  10,
                  (index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.black,
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(
                          16.r,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          16.r,
                        ),
                        child: Image.network(
                          secondModel.avatarUrl,
                        ),
                      ),
                    );
                  },
                ),
                options: CarouselOptions(
                  height: 0.2 * height,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.linear,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                  onPageChanged: (v, d) {},
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SecondDetailItems(
                title: "NAME:",
                subTitle: secondModel.name,
              ),
              SizedBox(
                height: 20.h,
              ),
              SecondDetailItems(
                title: "USERNAME:",
                subTitle: secondModel.username,
              ),
              SizedBox(
                height: 20.h,
              ),
              SecondDetailItems(
                title: "STATE:",
                subTitle: secondModel.state,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
