import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';

class ButtonModel {
  final String image;
  final double height;
  final double width;

  ButtonModel({
    required this.height,
    required this.width,
    required this.image,
  });
}

List<ButtonModel> buttonModels = [
  ButtonModel(
    height: 20.h,
    width: 20.w,
    image: AppImages.clear,
  ),
  ButtonModel(
    height: 30.h,
    width: 20.w,
    image: AppImages.precent,
  ),
  ButtonModel(
    height: 30.h,
    width: 30.w,
    image: AppImages.delete,
  ),
  ButtonModel(
    height: 30.h,
    width: 20.w,
    image: AppImages.divide,
  ),
];
