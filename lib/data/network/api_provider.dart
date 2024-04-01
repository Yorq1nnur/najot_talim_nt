import 'dart:io';
import '../network_response/network_response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:najot_talim_nt/data/models/country_model/country_model.dart';
import '../../utils/constants/app_constants.dart';

class ApiProvider {
  static Future<NetworkResponse> getCountries() async {
    try {
      http.Response response = await http.get(Uri.parse(AppConstants.baseUrl));

      if (response.statusCode == HttpStatus.ok) {
        final jsonData = json.decode(response.body);
        List<dynamic> countriesJson = jsonData['data']['countries'];
        List<CountryModel> countries =
            countriesJson.map((json) => CountryModel.fromJson(json)).toList();
        return NetworkResponse(
          data: countries,
        );
      }
      return NetworkResponse(errorText: "Noma'lum xatolik");
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}
