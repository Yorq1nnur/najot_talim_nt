// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';

class TransActionsScreen extends StatefulWidget {
  const TransActionsScreen({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  State<TransActionsScreen> createState() => _TransActionsScreenState();
}

class _TransActionsScreenState extends State<TransActionsScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(),
    );
  }
}
