// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/check.dart';
import 'package:najot_talim_nt/data/local/storage_repository.dart';
import 'package:najot_talim_nt/global_items/global_text_button.dart';
import 'package:najot_talim_nt/global_items/login_or_register.dart';
import 'package:najot_talim_nt/global_items/skip_for_now.dart';
import 'package:najot_talim_nt/screens/login_screen/login_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final bool isRegistered = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        body: Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Center(
                  child: Text(
                    "Create an account",
                    style: AppTextStyle.interThin.copyWith(
                        color: AppColors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Full name",
                          style: AppTextStyle.interBold.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          height: 35.h,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Full name Xato";
                              } else {
                                return null;
                              }
                            },
                            controller: nameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              hintText: "Full name",
                              hintStyle: AppTextStyle.interBold.copyWith(
                                color: AppColors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: const BorderSide(
                                  color: Colors.white10,
                                  width: 1,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          "Email",
                          style: AppTextStyle.interBold.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          height: 35.h,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (String? value) {
                              RegExp emailRegExp =
                                  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                              if (value == null ||
                                  value.isEmpty ||
                                  !emailRegExp.hasMatch(value)) {
                                return "Email Xato";
                              } else {
                                return null;
                              }
                            },
                            controller: emailController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: AppTextStyle.interBold.copyWith(
                                color: AppColors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: const BorderSide(
                                  color: Colors.white10,
                                  width: 1,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          "Password",
                          style: AppTextStyle.interBold.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          height: 35.h,
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            validator: (String? value) {
                              final RegExp strongPasswordRegExp = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*]).{8,}$');
                              if (value == null ||
                                  value.isEmpty ||
                                  !strongPasswordRegExp.hasMatch(value)) {
                                return "Password Xato";
                              } else {
                                return null;
                              }
                            },
                            controller: passwordController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: AppTextStyle.interBold.copyWith(
                                color: AppColors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: const BorderSide(
                                  color: Colors.white10,
                                  width: 1,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                  ),
                  child: GlobalTextBotton(
                      onTap: () {
                        setState(
                          () {
                            StorageRepository.setString(
                                key: "email", value: emailController.text);
                            StorageRepository.setString(
                                key: "password",
                                value: passwordController.text);
                          },
                        );
                        if (formKey.currentState!.validate()) {
                          setState(
                            () {
                              CheckStatus.isRegistered = true;
                              StorageRepository.setBool(
                                  key: "isRegistered",
                                  value: CheckStatus.isRegistered);
                            },
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("SUCCESS"),
                            ),
                          );
                        }
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      title: "Validate"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                LoginOrRegister(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    title: "Already have an account ? ",
                    subTitle: "Login"),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 160.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        4,
                        (index) => Container(
                          height: index == 3 ? 7.h : 5.h,
                          width: index == 3 ? 7.w : 5.w,
                          decoration: BoxDecoration(
                              color: index == 3
                                  ? AppColors.white
                                  : AppColors.white.withOpacity(
                                      0.32,
                                    ),
                              shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SkipForNow(onTap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
