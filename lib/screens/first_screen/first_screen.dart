import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: AppTextStyle.interBold.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w900,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        elevation: 0,
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
              painter: FlagPainter(),
            ),
          )
        ],
      ),
    );
  }
}

class FlagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 40;
    var paintRed = Paint()
      ..color = Colors.red
      ..strokeWidth = 40;
    var paintWhite = Paint()
      ..color = Colors.white
      ..strokeWidth = 40;
    var paintGreen = Paint()
      ..color = Colors.green
      ..strokeWidth = 40;
    var paintPoint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    var paintMoon = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    Offset center = const Offset(30, 30);
    double radius = size.width / 15;
    Path path = Path()
      ..addArc(Rect.fromCircle(center: center, radius: radius), 7.7, pi / 0.2);

    canvas.drawRect(
      const Offset(
            0,
            0,
          ) &
          Size(
            size.width,
            60,
          ),
      paint,
    );
    canvas.drawRect(
      const Offset(
            0,
            60,
          ) &
          Size(
            size.width,
            10,
          ),
      paintRed,
    );
    canvas.drawRect(
      const Offset(
            0,
            68,
          ) &
          Size(
            size.width,
            60,
          ),
      paintWhite,
    );
    canvas.drawRect(
      const Offset(
            0,
            125,
          ) &
          Size(
            size.width,
            10,
          ),
      paintRed,
    );
    canvas.drawRect(
      const Offset(
            0,
            135,
          ) &
          Size(
            size.width,
            65,
          ),
      paintGreen,
    );
    canvas.drawPath(path, paintMoon);

    

    List<Offset> points = [
      const Offset(
        80,
        15,
      ),
      const Offset(
        70,
        15,
      ),
      const Offset(
        90,
        15,
      ),
      const Offset(
        90,
        25,
      ),
      const Offset(
        80,
        25,
      ),
      const Offset(
        70,
        25,
      ),
      const Offset(
        60,
        25,
      ),
      const Offset(
        80,
        35,
      ),
      const Offset(
        70,
        35,
      ),
      const Offset(
        60,
        35,
      ),
      const Offset(
        50,
        35,
      ),
      const Offset(
        90,
        35,
      ),
    ];
    for (var point in points) {
      canvas.drawPoints(
        PointMode.points,
        [point],
        paintPoint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
