import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Image.asset(
                AppImages.profile,
                height: 50,
                width: 50,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),
      ),
    );
  }
}
