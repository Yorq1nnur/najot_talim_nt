import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/screens/global_screen/widgets/action_item.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:pinput/pinput.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  final List<String> _images = [
    AppImages.lamp,
    AppImages.silver,
  ];
  List<String> giveAnswer = [];
  final String _trueAnswer = "TASHKENT";
  final List<String> _answers = [
    "T",
    "O",
    "A",
    "U",
    "S",
    "H",
    "I",
    "K",
    "E",
    "P",
    "N",
    "T"
  ];

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 50.w,
      textStyle: TextStyle(
        fontSize: 20.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: AppColors.transparent,
        border: Border.all(
          color: AppColors.c3E87FF,
          width: 3.w,
        ),
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.c3E87FF),
      borderRadius: BorderRadius.circular(
        10.r,
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColors.c3E87FF,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
    );
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              AppImages.background,
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 33.h),
                child: SizedBox(
                  width: 100.w,
                  height: 75.h,
                  child: Stack(
                    children: [
                      Image.asset(
                        AppImages.cub,
                        width: 100.w,
                        height: 75.h,
                        fit: BoxFit.fill,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "1",
                          style: AppTextStyle.interBold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            50.r,
                          ),
                          border: Border.all(
                            color: AppColors.c3E87FF,
                            width: 2.w,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            SvgPicture.asset(
                              AppImages.star,
                              height: 26.h,
                              width: 25.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "0",
                              style: AppTextStyle.interBold,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 40.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            50.r,
                          ),
                          border: Border.all(
                            color: AppColors.c3E87FF,
                            width: 2.w,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "0",
                              style: AppTextStyle.interBold,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            SvgPicture.asset(
                              AppImages.silver,
                              height: 28.h,
                              width: 25.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        _images.length,
                        (index) => ActionItems(
                          imagePath: _images[index],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 190.h,
                  ),
                  Center(
                    child: Text(
                      "O'ZBEKISTONNING POYTAXTI QAYER?",
                      style: AppTextStyle.interBold,
                    ),
                  ),
                  SizedBox(
                    height: 136.h,
                  ),
                  Center(
                    child: Pinput(
                      controller: textEditingController,
                      enabled: false,
                      length: _trueAnswer.length,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      validator: (s) {
                        return s == _trueAnswer ? null : 'Pin is incorrect';
                      },
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      // onSubmitted: (pin) {
                      //   if (pin != _trueAnswer) {
                      //     textEditingController.text = '';
                      //     setState(() {});
                      //   }
                      // },
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Expanded(
                      child: GridView.count(
                    mainAxisSpacing: 5.w,
                    crossAxisSpacing: 5.h,
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      _answers.length,
                      (index) => InkWell(
                        borderRadius: BorderRadius.circular(
                          16.r,
                        ),
                        onTap: () {
                          textEditingController.text += giveAnswer[index];
                          setState(() {});
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.c3E87FF,
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                _answers[index],
                                style: AppTextStyle.interBold.copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            )),
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 30.h,
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
