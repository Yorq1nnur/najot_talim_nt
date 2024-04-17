import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:najot_talim_nt/screens/global_screen/game_controller/game_controller.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import '../../utils/images/app_images.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({super.key});

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
                            children: controller.shuffledLetters
                                .map(
                                  (letter) => ElevatedButton(
                                    onPressed: () => controller.addQuiz(letter),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
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
                            visible: controller.errorMessage.value != '',
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                              child: Text(
                                controller.errorMessage.value,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          ElevatedButton(
                            onPressed: () => controller.removeLastQuiz(),
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
