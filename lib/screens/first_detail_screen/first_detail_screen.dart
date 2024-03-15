// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/country_model/country_model.dart';
import 'package:najot_talim_nt/screens/first_detail_screen/widgets/detail_items.dart';
import 'package:najot_talim_nt/screens/first_screen/widgets/call_links.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class FirstDetailScreen extends StatefulWidget {
  const FirstDetailScreen({
    super.key,
    required this.countryModel,
  });

  final CountryModel countryModel;

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
            widget.countryModel.name["official"],
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
                widget.countryModel.flag,
                style: AppTextStyle.interBold.copyWith(fontSize: 16.sp),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            CallLinks(
              link: widget.countryModel.maps["googleMaps"],
              imagePath: AppImages.map,
            ),
            SizedBox(
              width: 20.w,
            ),
            CallLinks(
              link: widget.countryModel.maps["openStreetMaps"],
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailItems(
                  title: "RASMIY NOMI:",
                  subTitle: widget.countryModel.name['official'],
                ),
                DetailItems(
                  title: "DAVLAT NOMI",
                  subTitle: widget.countryModel.name["common"],
                ),
                SizedBox(
                  height: 20.h,
                ),
                DetailItems(
                  title: "POYTAXTI:",
                  subTitle: widget.countryModel.capital[0],
                ),
                SizedBox(
                  height: 20.h,
                ),
                DetailItems(
                  title: "AHOLISI:",
                  subTitle: widget.countryModel.population.toString(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                DetailItems(
                  title: "FIFADA NOMLANISHI:",
                  subTitle: widget.countryModel.fifa,
                ),
                SizedBox(
                  height: 20.h,
                ),
                DetailItems(
                  title: "HOLATI:",
                  subTitle: widget.countryModel.independent
                      ? "Mustaqil"
                      : "Mustaqil emas",
                ),
                SizedBox(
                  height: 20.h,
                ),
                DetailItems(
                  title: "VAQT MINTAQASI:",
                  subTitle: widget.countryModel.timezones[0],
                ),
                SizedBox(
                  height: 20.h,
                ),
                DetailItems(
                  title: "QIT'A:",
                  subTitle: widget.countryModel.continents[0],
                ),
                SizedBox(
                  height: 20.h,
                ),
                DetailItems(
                  title: "JOYLASHUVI:",
                  subTitle: widget.countryModel.subregion,
                ),
                SizedBox(
                  height: 20.h,
                ),
                DetailItems(
                  title: "HAFTA BOSHI:",
                  subTitle: widget.countryModel.startOfWeek,
                ),
                SizedBox(
                  height: 20.h,
                ),
                DetailItems(title: "MAYDONI (km. kv da):", subTitle: "${widget.countryModel.area} km. kv",),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    "GERBI:",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.interBold.copyWith(
                      color: AppColors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Image.network(
                  widget.countryModel.coatOfArms["png"],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    "BAYROG'I:",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.interBold.copyWith(
                      color: AppColors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: AppColors.black, width: 1.w)),
                  child: Image.network(
                    widget.countryModel.flags['png'],
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
