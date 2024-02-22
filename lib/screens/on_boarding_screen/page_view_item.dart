import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class PageViewItem extends StatefulWidget {
  const PageViewItem(
      {super.key,
      required this.imagePath,
      required this.place,
      required this.secondPlace,
      required this.title});

  final String imagePath;
  final String title;
  final int place;
  final int secondPlace;

  @override
  State<PageViewItem> createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.place.h,
        ),
        SizedBox(
          width: double.infinity,
          child: Center(
            child: Image.asset(
              widget.imagePath,
            ),
          ),
        ),
        SizedBox(
          height: widget.secondPlace.h,
        ),
        Center(
          child: Text(
            widget.title,
            style: AppTextStyle.interThin.copyWith(
                color: AppColors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
