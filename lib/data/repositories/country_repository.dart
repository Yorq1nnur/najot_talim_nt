
import 'package:najot_talim_nt/data/models/network_response.dart';
import 'package:najot_talim_nt/data/network/api_provider.dart';

class CategoriesRepository {
  Future<NetworkResponse> getCountries() async =>
      await ApiProvider.fetchCountries();
}
