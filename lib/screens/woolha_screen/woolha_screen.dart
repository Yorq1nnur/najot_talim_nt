// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';

import '../../utils/styles/app_text_style.dart';

class WoolhaScreen extends StatefulWidget {
  const WoolhaScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<WoolhaScreen> createState() => _WoolhaScreenState();
}

class _WoolhaScreenState extends State<WoolhaScreen> {
  AlignmentGeometry _alignment = Alignment.topLeft;

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
          children: [
            SizedBox(
              height: 100.h,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.grey,
              child: AnimatedAlign(
                alignment: _alignment,
                duration: Duration(
                  seconds: 3,
                ),
                child: Container(
                  color: Colors.teal,
                  child: const Text(
                    'Woolha.com',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              child: const Text(
                'Change Alignment',
              ),
              onPressed: () {
                setState(
                  () {
                    _alignment = _alignment == Alignment.topLeft
                        ? Alignment.bottomRight
                        : _alignment = Alignment.topLeft;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
