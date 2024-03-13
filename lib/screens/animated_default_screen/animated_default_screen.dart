// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class AnimatedDefaultScreen extends StatefulWidget {
  const AnimatedDefaultScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<AnimatedDefaultScreen> createState() => _AnimatedDefaultScreenState();
}

class _AnimatedDefaultScreenState extends State<AnimatedDefaultScreen> {
  bool isTrue = true;
  double fontSize = 20;
  Color color = Colors.blue;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(seconds: 1),
              curve: Curves.linear,
              style: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
              child: const Text(
                "Hello Flutter World!",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isTrue = true;
                    fontSize = isTrue ? 70 : 20;
                    color = isTrue ? Colors.red : Colors.blue;
                  });
                },
                child: const Icon(Icons.play_arrow),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isTrue = false;
                    fontSize = isTrue ? 70 : 20;
                    color = isTrue ? Colors.red : Colors.blue;
                  });
                },
                child: const Icon(Icons.replay_30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
