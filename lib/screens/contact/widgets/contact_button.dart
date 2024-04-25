import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/utils/app_colors.dart';
import 'package:najot_talim_nt/utils/size_utils.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({
    super.key,
    required this.iconsPath,
    required this.title,
    required this.onTab,
  });

  final String iconsPath;
  final String title;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
      onPressed: onTab,
      child: Row(
        children: [
          SvgPicture.asset(iconsPath, width: 30.w),
          10.getW(),
          Text(
            title,
            style: TextStyle(fontSize: 18.sp, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
