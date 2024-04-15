part of 'countries_bloc.dart';

sealed class CountriesEvent {}

class FetchCountries extends CountriesEvent {
  String continentName;

  FetchCountries(this.continentName);
}
