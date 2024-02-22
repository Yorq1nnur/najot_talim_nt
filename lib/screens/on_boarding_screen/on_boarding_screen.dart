import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/screens/on_boarding_screen/on_boarding_model.dart';
import 'package:najot_talim_nt/screens/on_boarding_screen/page_view_item.dart';
import 'package:najot_talim_nt/screens/registration_method_screen/registration_method_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

final PageController pageController = PageController();

int activeIndex = 0;

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  ...List.generate(
                    onBoardingImageModel.length,
                    (index) => PageViewItem(
                      imagePath: onBoardingImageModel[index],
                      place: onBoardingPlace[index],
                      secondPlace: onBoardingSecondPlace[index],
                      title: onBoardingTextModel[index],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 66.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    3,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      height: activeIndex == index ? 7.h : 5.h,
                      width: activeIndex == index ? 7.w : 5.w,
                      decoration: BoxDecoration(
                        color: activeIndex == index
                            ? AppColors.white
                            : AppColors.white.withOpacity(
                                0.32,
                              ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  setState(
                    () {
                      activeIndex++;
                    },
                  );
                  if (activeIndex > 2) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationMethodScreen(),
                      ),
                    );
                  }
                  pageController.jumpToPage(activeIndex);
                },
                child: Text(
                  "Next",
                  style: AppTextStyle.interBold.copyWith(
                      color: AppColors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
