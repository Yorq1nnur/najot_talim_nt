import 'package:najot_talim_nt/data/models/country_model/country_model.dart';
import 'package:najot_talim_nt/data/network/api_provider.dart';

class CountryRepo {
  Future<List<CountryModel>> getAllData() => ApiProvider.getAllCountryData();
}
