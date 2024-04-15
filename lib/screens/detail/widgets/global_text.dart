import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class GlobalText extends StatelessWidget {
  const GlobalText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        vertical: 5.h,
      ),
      child: Text(
        "$title:",
        style: AppTextStyle.interBold,
      ),
    );
  }
}
