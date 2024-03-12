// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class OpacityDemoScreen extends StatefulWidget {
  const OpacityDemoScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<OpacityDemoScreen> createState() => _OpacityDemoScreenState();
}

class _OpacityDemoScreenState extends State<OpacityDemoScreen> with SingleTickerProviderStateMixin {
  late Animation<Color?> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation =
    ColorTween(begin: Colors.indigo, end: Colors.lime).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
  }

  bool buttonToggle = true;

  void animateColor() {
    if (buttonToggle) {
      controller.forward();
    } else {
      controller.reverse();
    }
    buttonToggle = !buttonToggle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Flutter - tutorialkart.com')),
      ),
      body: ListView(children: <Widget>[
        Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            height: 400,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: animation.value,
              ),
              onPressed: () => {animateColor()},
              child: Text(''),
            ))
      ]),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
