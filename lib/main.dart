import 'package:flutter/material.dart';
import 'package:najot_talim_nt/screens/first_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const FirstScreen(),
    ),
  );
}
