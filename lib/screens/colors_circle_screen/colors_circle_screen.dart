// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class ColorsCircleScreen extends StatefulWidget {
  const ColorsCircleScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<ColorsCircleScreen> createState() => _ColorsCircleScreenState();
}

class _ColorsCircleScreenState extends State<ColorsCircleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation colorAnimation;
  late Animation containerAnimation;
  late Animation borderAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    colorAnimation = ColorTween(begin: Colors.orange, end: Colors.deepOrange)
        .animate(animationController);

    containerAnimation = ColorTween(begin: Colors.yellow, end: Colors.pink)
        .animate(animationController);

    borderAnimation =
        Tween<double>(begin: 5.0, end: 50.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
      reverseCurve: Curves.bounceIn,
    ))
          ..addListener(() {});

    animationController.addListener(() {
      setState(() {});
    });

    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: AppTextStyle.interBold.copyWith(
            color: AppColors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: containerAnimation.value,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: colorAnimation.value,
              width: borderAnimation.value,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade700,
                blurRadius: 40,
                spreadRadius: 5,
                offset: Offset(20, 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
