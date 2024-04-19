import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageItems extends StatelessWidget {
  const ImageItems({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        bottom: 10.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16.r,
        ),
        border: Border.all(
          width: 5.w,
          color: Colors.white,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          16.r,
        ),
        child: CachedNetworkImage(
          imageUrl: image,
          width: 140.w,
          height: 140.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
