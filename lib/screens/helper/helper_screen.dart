import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najot_talim_nt/screens/currencies/payments_screen.dart';
import 'package:najot_talim_nt/screens/timer/timer_screen.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class HelperScreen extends StatelessWidget {
  const HelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ButtonModel> buttonModel = [
      ButtonModel(
        color: Colors.tealAccent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PaymentsScreen(),
            ),
          );
        },
        title: "FIRST SCREEN",
        textColor: Colors.indigoAccent,
      ),
      ButtonModel(
        color: Colors.indigoAccent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TimerScreen(),
            ),
          );
        },
        title: "SECOND SCREEN",
        textColor: Colors.tealAccent,
      ),
    ];
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              buttonModel.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: buttonModel[index].color,
                  ),
                  width: double.infinity,
                  height: 50,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: buttonModel[index].onTap,
                    child: Center(
                      child: Text(
                        buttonModel[index].title,
                        style: AppTextStyle.interBold.copyWith(
                          color: buttonModel[index].textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonModel {
  final String title;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;

  ButtonModel({
    required this.color,
    required this.textColor,
    required this.onTap,
    required this.title,
  });
}
