import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/data/models/trans_actions_model.dart';
import '../../data/models/network_response.dart';
import '../../data/repositories/currency_repository.dart';
import 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit({required this.currencyRepository})
      : super(CurrencyInitialState());

  final CurrencyRepository currencyRepository;

  Future<void> fetchCurrencies() async {
    emit(CurrencyLoadingState());
    NetworkResponse response = await currencyRepository.getCurrencies();
    if (response.errorText.isEmpty) {
      emit(CurrencySuccessState(
          currencies: response.data as List<TransactionsModel>));
    } else {
      emit(CurrencyErrorState(errorText: response.errorText));
    }
  }
}
