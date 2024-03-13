// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class WidgetsScreen extends StatefulWidget {
  const WidgetsScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<WidgetsScreen> createState() => _WidgetsScreenState();
}

class _WidgetsScreenState extends State<WidgetsScreen> {
  bool isTrue = true;

  void _toggleText() {
    setState(() {
      isTrue = !isTrue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              width: 200,
              height: 200,
              color: isTrue ? Colors.orange : Colors.green,
              child: Center(
                child: AnimatedCrossFade(
                  alignment: Alignment.center,
                  duration: const Duration(seconds: 2),
                  firstChild: const Text(
                    "This is first Widget",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  secondChild: const Text(
                    "This is second Widget",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  crossFadeState: isTrue
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: _toggleText,
              child: const Text(
                "Click here",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
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
