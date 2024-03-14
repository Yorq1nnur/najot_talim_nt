import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'dart:math';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
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
          child: CustomPaint(
            size: Size(
              200.w,
              200.h,
            ),
            painter: BadSmilesPainter(),
          ),
        ),
      ),
    );
  }
}

class BadSmilesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var mouse = Paint()..color = Colors.amber;
    var eye = Paint()
      ..color = Colors.amber
      ..strokeWidth = 5;
    var had = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawCircle(const Offset(200, 70), 50, had);
    canvas.drawArc(
      Rect.fromCenter(center: const Offset(200, 105), width: 30, height: 30),
      0,
      pi / -1,
      false,
      mouse,
    );
    canvas.drawArc(
      Rect.fromCenter(center: const Offset(170, 50), width: 30, height: 30),
      0,
      pi / 2,
      false,
      eye,
    );
    canvas.drawArc(
      Rect.fromCenter(center: const Offset(210, 65), width: 30, height: 30),
      0,
      pi / -2,
      false,
      eye,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
