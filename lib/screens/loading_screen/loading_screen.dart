// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late bool _loadingInProgress;
  late Animation<double> _angleAnimation;
  late Animation<double> _scaleAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _loadingInProgress = true;
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _angleAnimation = Tween(begin: 0.0, end: 360.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _scaleAnimation = Tween(begin: 1.0, end: 6.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _angleAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (_loadingInProgress) {
          _controller.reverse();
        }
      } else if (status == AnimationStatus.dismissed) {
        if (_loadingInProgress) {
          _controller.forward();
        }
      }
    });

    _controller.forward();
    _loadData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future _loadData() async {
    await Future.delayed(const Duration(seconds: 5));
    _dataLoaded();
  }

  void _dataLoaded() {
    setState(() {
      _loadingInProgress = false;
    });
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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loadingInProgress) {
      return Center(
        child: _buildAnimation(),
      );
    } else {
      return Center(
        child: Text(
          'READY!!!',
          style: AppTextStyle.interBold.copyWith(
            color: AppColors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    }
  }

  Widget _buildAnimation() {
    double circleWidth = 10.0 * _scaleAnimation.value;
    Widget circles = SizedBox(
      width: circleWidth * 2.0,
      height: circleWidth * 2.0,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildCircle(circleWidth, Colors.blue),
              _buildCircle(circleWidth, Colors.red),
            ],
          ),
          Row(
            children: <Widget>[
              _buildCircle(circleWidth, Colors.yellow),
              _buildCircle(circleWidth, Colors.green),
            ],
          ),
        ],
      ),
    );
    double angleInDegrees = _angleAnimation.value;
    return Transform.rotate(
      angle: angleInDegrees / 360 * 2 * 3.1415926535897932,
      child: Container(
        child: circles,
      ),
    );
  }

  Widget _buildCircle(double circleWidth, Color color) {
    return Container(
      width: circleWidth,
      height: circleWidth,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
