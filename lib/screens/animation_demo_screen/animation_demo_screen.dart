// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class AnimatedDemoScreen extends StatefulWidget {
  const AnimatedDemoScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<AnimatedDemoScreen> createState() => _AnimatedDemoScreenState();
}

class _AnimatedDemoScreenState extends State<AnimatedDemoScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  late Animation borderSizeAnimation;
  bool isSquare = true;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    colorAnimation =
        ColorTween(begin: Colors.green, end: Colors.deepPurple).animate(controller);

    sizeAnimation =
    Tween<double>(begin: 50.0, end: 300.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.bounceIn,
      reverseCurve: Curves.bounceIn,
    ))
      ..addListener(() {
        setState(() {});
      });
    borderSizeAnimation =
        Tween<double>(begin: 5.0, end: 50.0).animate(controller);

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: true);
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
      body: GestureDetector(
        onTap: () {
          setState(() {
            isSquare = !isSquare;
          });
        },
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(seconds: 2),
            height: isSquare ? 50.0 : 300.0,
            width: isSquare ? 50.0 : 300.0,
            decoration: BoxDecoration(
              color: colorAnimation.value,
              borderRadius: isSquare ? null : BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}
