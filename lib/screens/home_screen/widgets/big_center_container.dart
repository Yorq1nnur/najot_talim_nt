import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/global_widgets/small_circle_container.dart';
import 'package:najot_talim_nt/screens/home_screen/models/small_container_model.dart';
import 'package:najot_talim_nt/screens/home_screen/widgets/center_container.dart';
import 'package:najot_talim_nt/screens/home_screen/widgets/my_cards_widget.dart';
import 'package:najot_talim_nt/screens/home_screen/widgets/second_center_container.dart';
import 'package:najot_talim_nt/screens/home_screen/widgets/text_widget.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';

class BigCenterContainer extends StatelessWidget {
  const BigCenterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                15.w,
                33.h,
                15.w,
                27.h,
              ),
              margin: EdgeInsets.only(
                top: 23.h,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.c000000,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.r),
                  topRight: Radius.circular(50.r),
                  ),
              ),
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                            imagesPath.length,
                                (index) => SmallCircleContainer(
                              imagePath: imagesPath[index],
                              imageHeight: imageHeight[index],
                              imageWidth: imageWidth[index],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      TextWidget(),
                      SizedBox(
                        height: 30.h,
                      ),
                      MayCardsWidget(
                        title: 'My cards',
                        onTap: () {},
                      ),
                      CenterContainer(),
                      MayCardsWidget(
                        title: 'Recent Transactions',
                        onTap: () {},
                      ),
                      SecondCenterContainer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
