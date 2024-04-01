import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/cubits/currency/countries_state.dart';
import 'package:najot_talim_nt/data/models/country_model/country_model.dart';
import '../../data/models/forms_status.dart';
import '../../data/network/api_provider.dart';
import '../../data/network_response/network_response.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit()
      : super(
          CountriesState(
            formsStatus: FormsStatus.pure,
            statusText: "",
            country: [],
          ),
        ) {
    //fetchCurrencies();
  }

  fetchCountries() async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse response = await ApiProvider.getCountries();
    if (response.errorText.isEmpty) {
      emit(
        state.copyWith(
          country: response.data as List<CountryModel>,
          formsStatus: FormsStatus.success,
        ),
      );
    } else {
      emit(state.copyWith(
        statusText: response.errorText,
        formsStatus: FormsStatus.error,
      ));
    }
  }
}
