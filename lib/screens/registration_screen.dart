// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/screens/second_task_screen.dart';

import '../utils/colors/app_colors.dart';
import '../utils/styles/app_text_style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();

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
              SizedBox(
                height: 30.h,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50.w,
                      ),
                      child: TextFormField(
                        controller: textEditingController1,
                        decoration: InputDecoration(
                            hintText: "Ismingiz",
                            hintStyle: AppTextStyle.interBold.copyWith(
                              color: AppColors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50.w,
                      ),
                      child: Center(
                        child: TextFormField(
                          controller: textEditingController2,
                          decoration: InputDecoration(
                            hintText: "Parolingiz",
                            hintStyle: AppTextStyle.interBold.copyWith(
                              color: AppColors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                  TextButton(onPressed: (){
                    setState(() {
                      isLogged = true;
                      Navigator.pop(context);
                    });
                  }, child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h,),
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h,),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text("Login", style: AppTextStyle.interBold.copyWith(
                        color: AppColors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w900
                      ),),
                    ),
                  ),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}