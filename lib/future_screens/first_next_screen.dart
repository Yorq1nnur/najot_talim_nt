import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import '../models/company_models.dart';

class FirstNextScreen extends StatefulWidget {
  const FirstNextScreen(
      {super.key, required this.dataModels, required this.logos});

  final DataModels dataModels;
  final List<String> logos;

  @override
  State<FirstNextScreen> createState() => _FirstNextScreenState();
}

class _FirstNextScreenState extends State<FirstNextScreen> {
  final List<String> cars = [
    AppImages.firstCarusel,
    AppImages.secondCarusel,
    AppImages.thirdCarusel,
    AppImages.forthCarusel,
    AppImages.firstCarusel,
    AppImages.secondCarusel,
    AppImages.thirdCarusel,
    AppImages.forthCarusel,
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
        ),
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                CarouselSlider(
                  items: List.generate(
                    widget.logos.length,
                    (index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r),
                            border: Border.all(
                              color: AppColors.c_C4C4C4,
                              width: 1.r,
                            )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            24.r,
                          ),
                          child: Image.asset(
                            cars[index],
                            height: 200.h,
                            width: 250.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  options: CarouselOptions(
                    height: 0.22 * MediaQuery.of(context).size.height,
                    viewportFraction: 0.85,
                    initialPage: 0,
                    enableInfiniteScroll: false,
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
              ],
            ),
          ),
        ));
  }
}
