import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class MayCardsWidget extends StatelessWidget {
  const MayCardsWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.interMedium.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.cEEEEEE.withOpacity(
              0.8,
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: onTap,
          child: Text(
            "View All",
            style: AppTextStyle.interMedium.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.cEEEEEE.withOpacity(
                0.8,
              ),
            ),
          ),
        )
      ],
    );
  }
}
