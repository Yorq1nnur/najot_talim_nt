import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/check.dart';
import 'package:najot_talim_nt/data/local/storage_repository.dart';
import 'package:najot_talim_nt/global_items/global_text_button.dart';
import 'package:najot_talim_nt/global_items/skip_for_now.dart';
import 'package:najot_talim_nt/screens/free_screen/free_screen.dart';
import 'package:najot_talim_nt/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:najot_talim_nt/screens/registration_method_screen/registration_method_screen.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import '../../utils/colors/app_colors.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 160.h,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "LATECH",
                        style: AppTextStyle.interBold.copyWith(
                            color: AppColors.white,
                            fontSize: 42.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "TECH MARKET",
                        style: AppTextStyle.interBold.copyWith(
                          color: AppColors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  AppImages.first,
                  height: 216.h,
                  width: 216.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 70.h,
              ),
              Material(
                color: AppColors.transparent,
                child: GlobalTextBotton(
                    onTap: () {
                      setState(
                        () {
                          CheckStatus.isFirstly = false;
                          StorageRepository.setBool(
                              key: "isFirstly", value: CheckStatus.isFirstly);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => (StorageRepository.getBool(
                                      key: "isRegistered"))
                                  ? const FreeScreen()
                                  : StorageRepository.getBool(key: "isFirstly")
                                      ? const RegistrationMethodScreen()
                                      : const OnBoardingScreen(),
                            ),
                          );
                        },
                      );
                    },
                    title: "Let's start"),
              ),
              SizedBox(
                height: 70.h,
              ),
              Center(
                child: SkipForNow(
                  onTap: () {
                    setState(
                      () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (StorageRepository.getBool(
                                    key: "isRegistered"))
                                ? const FreeScreen()
                                : StorageRepository.getBool(key: "isFirstly")
                                    ? const RegistrationMethodScreen()
                                    : const OnBoardingScreen(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
