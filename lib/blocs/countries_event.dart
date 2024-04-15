part of 'countries_bloc.dart';

sealed class CountriesEvent {}

class FetchCountries extends CountriesEvent {
  String continentName;

  FetchCountries(this.continentName);

}

class FetchCountriesByName extends CountriesEvent {
  final String countryName;

  FetchCountriesByName(this.countryName);
}
