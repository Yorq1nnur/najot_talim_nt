import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/book/book_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              AppImages.back,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.white,
                          size: 24.w,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Detail Book",
                          style: AppTextStyle.interMedium.copyWith(
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => UpdateScreen(
                              //       bookModel: bookModel,
                              //     ),
                              //   ),
                              // );
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: 24.w,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: AppColors.white,
                                    title: const Text("Ishonchingiz komilmi?"),
                                    titleTextStyle:
                                        AppTextStyle.interBold.copyWith(
                                      color: AppColors.black,
                                      fontSize: 20.sp,
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Yes',
                                          style:
                                              AppTextStyle.interBold.copyWith(
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'No',
                                          style: AppTextStyle.interBold
                                              .copyWith(color: AppColors.black),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 24.w,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 360.h,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: SvgPicture.asset(
                                  AppImages.shelf,
                                ),
                              ),
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6.r),
                                  child: CachedNetworkImage(
                                    imageUrl: bookModel.imageUrl,
                                    height: 300.h,
                                    width: 200.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          "Kitob nomi:",
                          style: AppTextStyle.interSemiBold.copyWith(
                            color: AppColors.black,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          bookModel.bookName,
                          style: AppTextStyle.interSemiBold.copyWith(
                            color: AppColors.black.withOpacity(
                              0.5,
                            ),
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "Kitob muallifi:",
                          style: AppTextStyle.interSemiBold.copyWith(
                            color: AppColors.black,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          bookModel.author,
                          style: AppTextStyle.interMedium.copyWith(
                            color: AppColors.black,
                            fontSize: 13.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Izoh:",
                          style: AppTextStyle.interSemiBold.copyWith(
                            color: AppColors.black,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          bookModel.description,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.interMedium.copyWith(
                            color: AppColors.black,
                            fontSize: 13.sp,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 50.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Kitob reytingi:",
                                style: AppTextStyle.interSemiBold.copyWith(
                                  color: AppColors.black,
                                  fontSize: 16.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    bookModel.rate.toString(),
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.interMedium.copyWith(
                                      color: AppColors.black,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20.w,
                                    color: Colors.yellowAccent,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 50.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Kitob narxi:",
                                style: AppTextStyle.interSemiBold.copyWith(
                                  color: AppColors.black,
                                  fontSize: 16.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${bookModel.price} so'm",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.interMedium.copyWith(
                                  color: AppColors.black,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
