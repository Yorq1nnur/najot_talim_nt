import 'package:flutter/foundation.dart';

bool platformCheck(bool Function() block) {
  try {
    return block();
  } catch (e) {
    debugPrint(e.toString());
  }
  return false;
}
