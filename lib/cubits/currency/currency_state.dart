import 'package:najot_talim_nt/data/models/trans_actions_model.dart';

abstract class CurrencyState {}

class CurrencyInitialState extends CurrencyState {}

class CurrencyLoadingState extends CurrencyState {}

class CurrencySuccessState extends CurrencyState {
  CurrencySuccessState({required this.currencies});

  final List<TransactionsModel> currencies;
}

class CurrencyErrorState extends CurrencyState {
  CurrencyErrorState({required this.errorText});

  final String errorText;
}
