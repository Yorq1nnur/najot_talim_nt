import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/data/models/trans_actions_model.dart';
import '../../data/models/network_response.dart';
import '../../data/repositories/currency_repository.dart';
import 'trans_actions_state.dart';

class TransActionsCubit extends Cubit<TransActionsState> {
  TransActionsCubit({required this.currencyRepository})
      : super(TransActionsInitialState());

  final TimerModel currencyRepository;

  Future<void> fetchCurrencies() async {
    emit(TransActionsLoadingState());
    NetworkResponse response = await currencyRepository.getTransActions();
    if (response.errorText.isEmpty) {
      emit(TransActionsSuccessState(
          transActions: response.data as List<TransactionsModel>));
    } else {
      emit(TransActionsErrorState(errorText: response.errorText));
    }
  }
}
