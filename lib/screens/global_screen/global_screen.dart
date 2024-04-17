import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:najot_talim_nt/screens/global_screen/game_controller/game_controller.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import '../../utils/images/app_images.dart';

class MyGameScreen extends StatelessWidget {
  const MyGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GameController controller = Get.put(
      GameController(),
    );

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Obx(
          () {
            return Stack(
              children: [
                Image.asset(
                  AppImages.back,
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  fit: BoxFit.fill,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 16.h,
                              horizontal: 16.w,
                            ),
                            child: Text(
                              controller.currentQuestion,
                              style: AppTextStyle.interBold.copyWith(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w900,
                                color: AppColors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Wrap(
                            children: List.generate(
                              controller.currentAnswer.length,
                              (index) {
                                return Padding(
                                  padding: EdgeInsets.all(
                                    2.w,
                                  ),
                                  child: Container(
                                    width: 36.w,
                                    height: 48.h,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(
                                      2.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(
                                        0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        8.r,
                                      ),
                                    ),
                                    child: Text(
                                      controller.currentInputAnswer.value
                                                  .length >
                                              index
                                          ? controller
                                              .currentInputAnswer.value[index]
                                          : "",
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: controller.currentInputAnswer
                                                    .value.length >
                                                index
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Wrap(
                            spacing: 8,
                            children: controller.currentShuffledLetters
                                .map(
                                  (letter) => ElevatedButton(
                                    onPressed: () => controller.addQuiz(letter),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 8.h,
                                      ),
                                    ),
                                    child: Text(
                                      letter,
                                      style: AppTextStyle.interBold.copyWith(
                                        fontSize: 24.sp,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Visibility(
                            visible: controller.forUiErrorMessage.value != '',
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  20.r,
                                ),
                              ),
                              child: Text(
                                controller.forUiErrorMessage.value,
                                style: AppTextStyle.interBlack.copyWith(
                                  color: Colors.red,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ElevatedButton(
                            onPressed: () => controller.removeLastQuestion(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                            ),
                            child: Text(
                              "DELETE",
                              style: AppTextStyle.interMedium.copyWith(
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
