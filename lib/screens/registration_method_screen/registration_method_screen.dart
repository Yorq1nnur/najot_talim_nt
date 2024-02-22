import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot_talim_nt/global_items/global_text_button.dart';
import 'package:najot_talim_nt/global_items/login_or_register.dart';
import 'package:najot_talim_nt/global_items/skip_for_now.dart';
import 'package:najot_talim_nt/screens/login_screen/login_screen.dart';
import 'package:najot_talim_nt/screens/registration_screen/registration_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class RegistrationMethodScreen extends StatefulWidget {
  const RegistrationMethodScreen({super.key});

  @override
  State<RegistrationMethodScreen> createState() =>
      _RegistrationMethodScreenState();
}

class _RegistrationMethodScreenState extends State<RegistrationMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 67.h,
                  bottom: 145.h,
                ),
                child: Text(
                  "Connexion",
                  style: AppTextStyle.interBold.copyWith(
                    color: AppColors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32.w,
              ),
              child: GlobalTextBotton(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationScreen(),
                      ),
                    );
                  },
                  title: "Create an account"),
            ),
            SizedBox(
              height: 32.h,
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(
                  top: 14.h,
                  bottom: 14.h,
                  left: 33.w,
                ),
                margin: EdgeInsets.symmetric(horizontal: 32.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    4.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.c0001FC.withOpacity(
                        0.08,
                      ),
                      blurRadius: 40.r,
                      offset: Offset(
                        0,
                        16.r,
                      ),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppImages.google,
                      height: 20.h,
                      width: 20.w,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    Text(
                      "Connect with Google",
                      style: AppTextStyle.interBold.copyWith(
                          color: AppColors.c555555,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(
                  top: 14.h,
                  bottom: 14.h,
                  left: 33.w,
                ),
                margin: EdgeInsets.symmetric(horizontal: 32.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.c415A93,
                  borderRadius: BorderRadius.circular(
                    4.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.c0001FC.withOpacity(
                        0.08,
                      ),
                      blurRadius: 40.r,
                      offset: Offset(
                        0,
                        16.r,
                      ),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppImages.facebook,
                      height: 20.h,
                      width: 20.w,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    Text(
                      "Connect with Google",
                      style: AppTextStyle.interBold.copyWith(
                          color: AppColors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.w,
              ),
              child: LoginOrRegister(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  title: "Already have an account ? ",
                  subTitle: "Login"),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 160.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    4,
                    (index) => Container(
                      height: index == 3 ? 7.h : 5.h,
                      width: index == 3 ? 7.w : 5.w,
                      decoration: BoxDecoration(
                          color: index == 3
                              ? AppColors.white
                              : AppColors.white.withOpacity(
                                  0.32,
                                ),
                          shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Center(
              child: SkipForNow(onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}
