// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/check.dart';
import 'package:najot_talim_nt/data/local/storage_repository.dart';
import 'package:najot_talim_nt/global_items/global_text_button.dart';
import 'package:najot_talim_nt/global_items/login_or_register.dart';
import 'package:najot_talim_nt/global_items/skip_for_now.dart';
import 'package:najot_talim_nt/screens/free_screen/free_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final registeredEmail = StorageRepository.getString(key: "email");
  final registeredPassword = StorageRepository.getString(key: "password");

  var formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  height: 67.h,
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
                  height: 127.h,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              if (value == null || value.isEmpty) {
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
                              if (value == null || value.isEmpty) {
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
                        if (formKey.currentState!.validate() &&
                            (emailController.text == registeredEmail &&
                                passwordController.text ==
                                    registeredPassword)) {
                          setState(
                            () {
                              CheckStatus.isFirstly = false;
                              StorageRepository.setBool(
                                  key: "isFirstly", value: CheckStatus.isFirstly);
                              CheckStatus.isLogged = true;
                              CheckStatus.isRegistered = true;
                              StorageRepository.setBool(
                                  key: "isLogged", value: CheckStatus.isLogged);
                              StorageRepository.setBool(
                                  key: "isRegistered", value: CheckStatus.isLogged);
                            },
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("SUCCESS"),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FreeScreen(),
                            ),
                          );
                        }
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
                    title: "Don’t have an account? ",
                    subTitle: "Sign-up"),
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
                SkipForNow(onTap: () {
                  setState(() {
                    print(
                        "Is firstly: ${StorageRepository.getBool(key: "isFirstly")}\nIs registered: ${StorageRepository.getBool(key: "isRegistered")}\nIs logged: ${StorageRepository.getBool(key: "isLogged")}");
                  });
                })
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
