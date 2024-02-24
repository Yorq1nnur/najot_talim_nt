// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/global_widgets/global_text.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class TransActionsScreen extends StatefulWidget {
  const TransActionsScreen({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  State<TransActionsScreen> createState() => _TransActionsScreenState();
}

class _TransActionsScreenState extends State<TransActionsScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
            vertical: 46.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalText(title: "Transactions"),
              SizedBox(
                height: 45.h,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
