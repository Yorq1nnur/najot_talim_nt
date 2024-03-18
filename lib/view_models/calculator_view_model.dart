import 'package:flutter/cupertino.dart';

class CalculatorViewModel with ChangeNotifier {
  String _displayValue = '0';
  double _result = 0;
  String _operator = '';
  bool _shouldClearDisplay = false;

  String get displayValue => _displayValue;

  void appendDigit(String digit) {
    if (_shouldClearDisplay) {
      _displayValue = digit;
      _shouldClearDisplay = false;
    } else {
      if (_displayValue == '0') {
        _displayValue = digit;
      } else {
        _displayValue += digit;
      }
    }
    notifyListeners();
  }

  void appendOperator(String operator) {
    if (_operator.isNotEmpty) {
      calculateResult();
    }
    _operator = operator;
    _result = double.parse(_displayValue);
    _shouldClearDisplay = true;
    notifyListeners();
  }

  void calculateResult() {
    final currentValue = double.parse(_displayValue);
    switch (_operator) {
      case '+':
        _result += currentValue;
        break;
      case '-':
        _result -= currentValue;
        break;
      case '*':
        _result *= currentValue;
        break;
      case '/':
        _result /= currentValue;
        break;
    }
    _displayValue = _result.toString();
    _operator = '';
    _shouldClearDisplay = true;
    notifyListeners();
  }

  void clear() {
    _displayValue = '0';
    _result = 0;
    _operator = '';
    _shouldClearDisplay = false;
    notifyListeners();
  }
}
