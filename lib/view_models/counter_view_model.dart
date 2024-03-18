import 'dart:async';
import 'package:flutter/foundation.dart';

class CounterViewModel extends ChangeNotifier {
  int currentValue = 0;

  updateValue(){
    Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      (
        timer,
      ) {
        currentValue++;
        notifyListeners();
        if (kDebugMode) {
          print(currentValue);
        }
      },
    );
  }
}
