// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/screens/registration_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import '../utils/images/app_images.dart';

bool isLogged = false;


class SecondTaskScreen extends StatefulWidget {
  const SecondTaskScreen({super.key});

  @override
  State<SecondTaskScreen> createState() => _SecondTaskScreenState();
}

class _SecondTaskScreenState extends State<SecondTaskScreen> {
  bool tap = false;


  final List<String> models = [
    AppImages.airpods,
    AppImages.iphone,
    AppImages.airpods,
    AppImages.iphone,
    AppImages.airpods,
    AppImages.iphone,
    AppImages.airpods,
    AppImages.iphone,
    AppImages.airpods,
    AppImages.iphone,
    AppImages.airpods,
    AppImages.iphone,
    AppImages.airpods,
    AppImages.iphone,
    AppImages.airpods,
    AppImages.iphone,
    AppImages.airpods,
    AppImages.iphone,
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.blueAccent,
      ),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          child: Column(
            children: [
              Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Center(
                  child: Text(
                    "Products",
                    style: AppTextStyle.interBold.copyWith(
                      color: AppColors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: GridView.count(
                    crossAxisCount: tap ? 1 : 2,
                    childAspectRatio: 0.5,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    physics: BouncingScrollPhysics(),
                    children: [
                      ...List.generate(
                          models.length,
                          (index) => TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero),
                                onPressed: () {
                                  setState(
                                    () {
                                      isLogged == false
                                          ? Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return RegistrationScreen();
                                                },
                                              ),
                                            )
                                          : null;
                                    },
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 5.h,
                                  ),
                                  decoration: BoxDecoration(color: Colors.blue),
                                  child: Image.asset(
                                    models[index],
                                    width: 500.w,
                                    height: 800.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ))
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    tap = !tap;
                  });
                },
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 115.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent.withOpacity(0.5),
                          spreadRadius: 10,
                        )
                      ]),
                  padding: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: 5.w,
                  ),
                  child: Center(
                    child: Text(
                      "SCROLL",
                      style: AppTextStyle.interBold.copyWith(
                        color: AppColors.white,
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
