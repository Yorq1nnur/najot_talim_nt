import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';

class SmallCircleContainer extends StatefulWidget {
  const SmallCircleContainer({
    super.key,
    required this.imagePath,
    required this.imageHeight,
    required this.imageWidth,
  });

  final String imagePath;
  final double imageHeight;
  final double imageWidth;

  @override
  State<SmallCircleContainer> createState() => _SmallCircleContainerState();
}

class _SmallCircleContainerState extends State<SmallCircleContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.w,
      width: 76.w,
      decoration: const BoxDecoration(
        color: AppColors.cDBE3F8,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          widget.imagePath,
          height: widget.imageHeight.h,
          width: widget.imageWidth.w,
        ),
      ),
    );
  }
}
