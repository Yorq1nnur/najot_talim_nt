import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/storage_repository/storage_repository.dart';
import 'package:najot_talim_nt/screens/global_screen/global_screen.dart';
import 'package:najot_talim_nt/screens/login_screen/login_screen.dart';
import 'package:najot_talim_nt/utils/constants/app_constants.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String pinCode = '';
  String secondPinCode = '';
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController secondTextEditingController =
      TextEditingController();

  // @override
  // void initState() {
  //   if (StorageRepository.getBool(key: AppConstants.isRegistered)) {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const LoginScreen(),
  //       ),
  //     );
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 3.2,
                    ),
                    PinCodeTextField(
                      keyboardType: TextInputType.number,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(
                          5.r,
                        ),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      controller: textEditingController,
                      onCompleted: (v) {
                        pinCode = v;
                        debugPrint(
                            "===============================Completed: $pinCode==================================");
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                      appContext: context,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    PinCodeTextField(
                      keyboardType: TextInputType.number,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(
                          5.r,
                        ),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      controller: secondTextEditingController,
                      onCompleted: (v) {
                        secondPinCode = v;
                        debugPrint(
                            "===============================Completed: $pinCode==================================");
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                      appContext: context,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: ZoomTapAnimation(
                onTap: () {
                  if (pinCode != '' &&
                      pinCode.length == 6 &&
                      pinCode == secondPinCode) {
                    StorageRepository.setBool(
                      key: AppConstants.isRegistered,
                      value: true,
                    );
                    StorageRepository.setString(
                        key: AppConstants.pinCode, value: pinCode);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.amber,
                        content: Text(
                          "PIN CODE SET SUCCESSFULLY!!!",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.interBold.copyWith(
                            color: Colors.white,
                            backgroundColor: Colors.amber,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GlobalScreen(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          textAlign: TextAlign.center,
                          "BOTH PIN CODE MUST BE THE SAME!!!",
                          style: AppTextStyle.interBold.copyWith(
                            color: Colors.black,
                            backgroundColor: Colors.red,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 30.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(
                      16.r,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'SAVE PIN CODE',
                      style: AppTextStyle.interBold.copyWith(
                        color: Colors.yellowAccent,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}