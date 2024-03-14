import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
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
                size: const Size(
                  double.infinity,
                  200,
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
    Paint paint = Paint();
    paint.color = Colors.deepOrangeAccent;
    paint.strokeWidth = 2.0;

    var path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.3, size.height * 0.4);
    path.quadraticBezierTo(
        size.width * 0.9, size.height * 0.8, size.width, size.height * 0.1);
    path.quadraticBezierTo(
        size.width * 0.2, size.height * 0.7, size.width, size.height * 0.1);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

