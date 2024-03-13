// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AnimatedDemoScreen extends StatefulWidget {
  const AnimatedDemoScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<AnimatedDemoScreen> createState() => _AnimatedDemoScreenState();
}

class _AnimatedDemoScreenState extends State<AnimatedDemoScreen> {
  bool _isLeft = true;

  void _togglePosition() {
    setState(() {
      _isLeft = !_isLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedPositioned Example'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            // AnimatedPositioned widget to create the animated transition
            AnimatedPositioned(
              duration: Duration(seconds: 1), // Animation duration
              left: _isLeft
                  ? 50
                  : 150, // Change the left position based on the _isLeft state
              top: 50, // Fixed top position
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      // Floating action button to trigger the position toggle
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePosition, // Call _togglePosition when pressed
        child: Icon(Icons.swap_horiz), // Icon to display on the button
      ),
    );
  }
}