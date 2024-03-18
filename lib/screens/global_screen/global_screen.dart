// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:najot_talim_nt/view_models/counter_view_model.dart';
import 'package:provider/provider.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {



  @override
  Widget build(BuildContext context) {
    debugPrint("UI DRAWN ONCE");

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        body: Consumer<CounterViewModel>(
          builder: (context, viewModel, child) {
            return Center(
              child: Text(
                viewModel.currentValue.toString(),
                style: AppTextStyle.interSemiBold.copyWith(
                  fontSize: 100.sp,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
