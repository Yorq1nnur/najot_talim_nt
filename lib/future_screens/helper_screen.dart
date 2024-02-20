import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/future_screens/second_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

import 'first_screen.dart';

class HelperScreen extends StatefulWidget {
  const HelperScreen({super.key});

  @override
  State<HelperScreen> createState() => _HelperScreenState();
}

class _HelperScreenState extends State<HelperScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
        ),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 4.h,
              ),
              Material(
                color: Colors.blueGrey,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FirstScreen()));
                    },
                    child: Center(
                      child: Text(
                        "First two screen",
                        style: AppTextStyle.interBold.copyWith(
                            color: AppColors.black,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w900),
                      ),
                    )),
              ),
              SizedBox(
                height: height / 4.h,
              ),
              Material(
                color: Colors.yellowAccent,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondScreen()));
                    },
                    child: Center(
                      child: Text(
                        "Second two screen",
                        style: AppTextStyle.interBold.copyWith(
                            color: AppColors.black,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w900),
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
