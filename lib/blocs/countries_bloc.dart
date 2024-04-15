import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/api/api_client.dart';
import '../data/models/country_model.dart';
import '../data/models/network_response.dart';

part 'countries_event.dart';

part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc({required this.apiClient}) : super(CountriesInitial()) {
    on<FetchCountries>(_fetchCountries);
    on<FetchCountriesByName>(_fetchCountryByName);
  }

  final ApiClient apiClient;

  _fetchCountries(FetchCountries event, emit) async {
    emit(CountriesLoading());

    NetworkResponse networkResponse = event.continentName == ''
        ? await apiClient.getCountries()
        : await apiClient.getCountriesByContinents(
            event.continentName,
          );

    if (networkResponse.errorText.isEmpty) {
      emit(CountriesSuccess(networkResponse.data as List<CountryModel>));
    } else {
      emit(CountriesError(networkResponse.errorText));
    }
  }

  _fetchCountryByName(FetchCountriesByName event, emit) async {
    emit(CountriesLoading());

    NetworkResponse networkResponse =
        await apiClient.getCountriesByName(event.countryName);

    if (networkResponse.errorText.isEmpty) {
      emit(CountriesSuccess(networkResponse.data as List<CountryModel>));
    } else {
      emit(CountriesError(networkResponse.errorText));
    }
  }
}
