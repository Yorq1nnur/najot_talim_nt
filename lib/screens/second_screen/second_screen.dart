import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
        body: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Container(
              color: Colors.black,
              child: CustomPaint(
                size: Size(
                  double.infinity,
                  350.h,
                ),
                //300, 300
                painter: MyPainter(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 5;
    const center = Offset(200, 90);
    Offset center2 = const Offset(200, 90);
    var paint = Paint()..color = Colors.white;
    var paint2 = Paint()..color = Colors.white;
    var eye = Paint()..color = Colors.black;
    var eye1 = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    final Paint nose = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    var hand = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 4.0;
    Path mouthPath = Path();
    mouthPath.moveTo(center2.dx - radius / 2, center2.dy + radius / 2);
    mouthPath.quadraticBezierTo(center2.dx, center2.dy + radius,
        center2.dx + radius / 2, center2.dy + radius / 2);
    canvas.drawPath(mouthPath, paint);

    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(const Offset(200, 240), 100, paint2);
    canvas.drawCircle(const Offset(160, 60), 10, eye);
    canvas.drawCircle(const Offset(230, 60), 10, eye);
    canvas.drawCircle(const Offset(200, 250), 10, eye);
    canvas.drawCircle(const Offset(200, 220), 10, eye);
    canvas.drawCircle(const Offset(200, 280), 10, eye);
    canvas.drawCircle(const Offset(200, 280), 10, eye);
    canvas.drawArc(
      Rect.fromCenter(center: const Offset(200, 110), width: 60, height: 50),
      0,
      pi,
      false,
      eye1,
    );
    canvas.drawOval(
        Rect.fromCircle(center: const Offset(195, 80), radius: 20), nose);
    canvas.drawLine(const Offset(20, 130), const Offset(108.5, 210), hand);
    canvas.drawLine(const Offset(390, 130), const Offset(296, 210), hand);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
