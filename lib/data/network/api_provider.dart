import 'dart:io';

import '../network_response/network_response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:najot_talim_nt/data/models/country_model/country_model.dart';
import '../../utils/constants/app_constants.dart';

class ApiProviderr {
  static Future<List<Country>> getCountries() async {
    final response = await http.get(Uri.parse(AppConstants.baseUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<dynamic> countriesJson = jsonData['data']['countries'];
      List<Country> countries = countriesJson.map((json) => Country.fromJson(json)).toList();
      return countries;
    } else {
      throw Exception('Failed to load countries');
    }
  }
}



class ApiProvider {
  static Future<NetworkResponse> getCountries() async {
    try {
      http.Response response = await http
          .get(Uri.parse(AppConstants.baseUrl));

      if (response.statusCode == HttpStatus.ok) {
        final jsonData = json.decode(response.body);
        List<dynamic> countriesJson = jsonData['data']['countries'];
        List<Country> countries = countriesJson.map((json) => Country.fromJson(json)).toList();
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
