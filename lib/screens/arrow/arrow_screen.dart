import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot_talim_nt/utils/app_colors.dart';
import '../../utils/app_images.dart';

class ArrowScreen extends StatefulWidget {
  const ArrowScreen({super.key});

  @override
  State<ArrowScreen> createState() => _ArrowScreenState();
}

class _ArrowScreenState extends State<ArrowScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppImages.menu,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppImages.pdf),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 36.h,
              ),
              Text(
                "Summary",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ...List.generate(
                        GlobalRepo.icons.length,
                        (index) => Container(
                          margin: EdgeInsets.only(bottom: 36.h),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                GlobalRepo.icons[index],
                                width: 48.w,
                                height: 48.w,
                                fit: BoxFit.cover,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Text(
                                GlobalRepo.bigText[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                GlobalRepo.littleText[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GlobalRepo {
  static List<String> icons = [
    AppImages.closet,
    AppImages.bag,
    AppImages.messageIcon,
    AppImages.smileIcon
  ];
  static const List<String> bigText = [
    "Polivalent",
    "Experience",
    "Open-minded",
    "Empathic & humble"
  ];
  static const List<String> littleText = [
    "Plenty of skills around communication, media, web and advertising.",
    "More than 10 years working in design fields, with Adobe Creative Suite, Figma and collaborative tools.",
    "Always looking for the continuous improvement and ready to learn about the newest.",
    "The user is in the center."
  ];
}
