import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/screens/study/widgets/study_items.dart';
import 'package:najot_talim_nt/utils/size_utils.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
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
              36.getH(),
              Text(
                "NAJOT TA'LIM",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              36.getH(),
              const StudyItems(
                text1: "FOUNDATION",
                text2: 'C/PYTHON',
                text3: "Najot Ta'lim(Chimboy)",
                text4: "Year: 2023",
              ),
              36.getH(),
              const StudyItems(
                text1: "FLUTTER",
                text2: 'UX/UI Design',
                text3: "Najot ta'lim(Chilonzor)",
                text4: "Year: 2024",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
