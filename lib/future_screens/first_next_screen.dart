import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:najot_talim_nt/models/single_car_models.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import '../models/company_models.dart';

class FirstNextScreen extends StatefulWidget {
  const FirstNextScreen(
      {super.key,
      required this.dataModels,
      required this.logos,
      required this.index});

  final DataModels dataModels;
  final List<String> logos;
  final int index;

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

  bool isTrue = true;

  final List<String> logos = [
    AppImages.honda,
    AppImages.toyota,
    AppImages.rollsRoyce,
    AppImages.tesla,
    AppImages.honda,
    AppImages.toyota,
    AppImages.rollsRoyce,
    AppImages.tesla,
  ];

  SingleCarModels? singleCarModels;

  Future<void> _fetchCarData() async {
    http.Response response = await http.get(
      Uri.parse(
          "https://easyenglishuzb.free.mockoapp.net/companies/${widget.index}"),
    );
    if (response.statusCode == 200) {
      singleCarModels = SingleCarModels.fromJson(jsonDecode(response.body));
      setState(() {
        isTrue = !isTrue;
      });
    }
  }

  @override
  void initState() {
    _fetchCarData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        body: isTrue
            ? Center(
                child: SizedBox(
                  height: 100.h,
                  width: 100.h,
                  child: const CircularProgressIndicator(),
                ),
              )
            : Padding(
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
                        singleCarModels!.carPics.length,
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
                              child: Image.network(
                                singleCarModels!.carPics[index],
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
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              logos[widget.index - 1],
                              height: 50.h,
                              width: 50.w,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              singleCarModels!.carModel,
                              style: AppTextStyle.interThin
                                  .copyWith(color: AppColors.c_F4261A),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text(
                            textAlign: TextAlign.center,
                            singleCarModels!.description,
                            style: AppTextStyle.interBold.copyWith(
                              color: AppColors.c_1A72DD,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
