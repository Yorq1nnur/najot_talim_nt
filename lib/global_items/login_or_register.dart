import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister(
      {super.key,
      required this.onTap,
      required this.title,
      required this.subTitle});

  final VoidCallback onTap;
  final String title;
  final String subTitle;

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: RichText(
        text: TextSpan(
            text: widget.title,
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.cFBDF00,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
            children: [
              TextSpan(
                text: widget.subTitle,
                style: AppTextStyle.interBold.copyWith(
                  color: AppColors.cFBDF00,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ]),
      ),
    );
  }
}
