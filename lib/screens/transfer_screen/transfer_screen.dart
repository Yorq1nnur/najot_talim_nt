// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(),
    );
  }
}
