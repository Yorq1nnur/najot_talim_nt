import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/categories/all_categories.dart';
import 'package:najot_talim_nt/items/bottom_row.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import '../categories/category_model.dart';
import '../categories/get_categories_text.dart';

class SpeakersScreen extends StatefulWidget {
  const SpeakersScreen({super.key});

  @override
  State<SpeakersScreen> createState() => _SpeakersScreenState();
}

class _SpeakersScreenState extends State<SpeakersScreen> {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        backgroundColor: AppColors.cFDFEFF,
        body: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetCategoriesText(
                  title: "Speakers",
                  onTap: () {
                    Navigator.pop(context);
                  }),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 52.w,
                  top: 15.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 9.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.cFDFEFF,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.cA7A9BE,
                              blurRadius: 1.5,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Ascending price",
                              style: AppTextStyle.interBold.copyWith(
                                color: AppColors.cA7A9BE,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            SvgPicture.asset(
                              AppImages.arrowTop,
                              width: 8.w,
                              height: 9.h,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            SvgPicture.asset(
                              AppImages.arrowBottom,
                              width: 7.w,
                              height: 4.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Filter",
                          style: AppTextStyle.interBold.copyWith(
                            color: AppColors.cA7A9BE,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        SvgPicture.asset(
                          AppImages.arrowBottom,
                          width: 7.w,
                          height: 4.h,
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      AppImages.filter,
                      width: 18.w,
                      height: 18.h,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.symmetric(
                    vertical: 32.h,
                    horizontal: 16.w,
                  ),
                  mainAxisSpacing: 8.h,
                  //vertically
                  crossAxisSpacing: 9.w,
                  //horizontally
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  //Axis.vertical=> childAspectRatio = width/height.
                  //Axis.horizontal=> childAspectRatio = height/width.
                  children: [
                    ...List.generate(
                      speakersModels.length,
                      (index) => CategoryModel(
                        image: speakersModels[index].image,
                        title: speakersModels[index].title,
                        price: speakersModels[index].price,
                      ),
                    ),
                  ],
                ),
              ),
              const BottomRow(),
            ],
          ),
        ),
      ),
    );
  }
}
