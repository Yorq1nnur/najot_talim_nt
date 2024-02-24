import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';

class SecondSmallCircleContainer extends StatefulWidget {
  const SecondSmallCircleContainer({
    super.key,
    required this.imagePath,
  });

  final String imagePath;
  @override
  State<SecondSmallCircleContainer> createState() => _SecondSmallCircleContainerState();
}

class _SecondSmallCircleContainerState extends State<SecondSmallCircleContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.w,
      width: 52.w,
      decoration: const BoxDecoration(
        color: AppColors.cDBE3F8,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          widget.imagePath,
        ),
      ),
    );
  }
}
