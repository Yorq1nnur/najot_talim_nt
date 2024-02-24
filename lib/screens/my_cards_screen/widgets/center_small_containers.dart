import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CenterSmallContainers extends StatelessWidget {
  const CenterSmallContainers({
    super.key,
    required this.containerColor,
  });

  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14.h,
      width: 14.h,
      margin: EdgeInsets.only(bottom: 33.h, left: 5.w, right: 5.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: containerColor,
      ),
    );
  }
}
