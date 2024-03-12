// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class FlutterTutorialKartScreen extends StatefulWidget {
  const FlutterTutorialKartScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<FlutterTutorialKartScreen> createState() =>
      _FlutterTutorialKartScreenState();
}

class _FlutterTutorialKartScreenState extends State<FlutterTutorialKartScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 12.0, end: 50.0).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
  }

  void reverseFontSize() {
    controller.repeat(
      reverse: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              'Hello! Welcome to TutorialKart. This is a basic demonstration of animation in Flutter.',
              style: TextStyle(fontSize: animation.value),
            ),
          ),
          TextButton(
            onPressed: () => {
              reverseFontSize(),
            },
            child: Text(
              'Bigger Font',
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
