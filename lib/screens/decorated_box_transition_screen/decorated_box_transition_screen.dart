import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class DecoratedBoxTransitionScreen extends StatefulWidget {
  const DecoratedBoxTransitionScreen({super.key, required this.title});

  final String title;

  @override
  State<DecoratedBoxTransitionScreen> createState() =>
      _DecoratedBoxTransitionScreenState();
}

class _DecoratedBoxTransitionScreenState
    extends State<DecoratedBoxTransitionScreen> {
  Color borderColor = Colors.black;
  Color backgroundColor = Colors.white;
  double borderRadius = 0.0;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                begin: Colors.black,
                end: backgroundColor,
              ),
              duration: const Duration(seconds: 1),
              builder: (context, Color? color, Widget? child) {
                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                    border: Border.all(color: borderColor, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: borderRadius == 0.0
                            ? Colors.blueGrey
                            : Colors.white,
                        blurRadius: 40,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: const FlutterLogo(),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                setState(() {
                  borderRadius = borderRadius == 16.0 ? 0.0 : 16.0;
                  backgroundColor = backgroundColor == Colors.white
                      ? Colors.black
                      : Colors.white;
                  borderColor =
                      borderColor == Colors.black ? Colors.white : Colors.black;
                });
              },
              child: const Text(
                "Click me!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
