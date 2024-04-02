import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class HelperScreen extends StatelessWidget {
  const HelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            elevation: 0,
            title: Text(
              'HELPER SCREEN',
              style: AppTextStyle.interBold.copyWith(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ));
  }
}
