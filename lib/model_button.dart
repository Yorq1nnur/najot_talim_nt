import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModelButton {
  final String title;
  final VoidCallback onTap;

  ModelButton({
    required this.onTap,
    required this.title,
  });
}