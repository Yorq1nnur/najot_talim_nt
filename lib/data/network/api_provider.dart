// ignore_for_file: unused_import

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:najot_talim_nt/data/models/country_model/country_model.dart';
import 'package:najot_talim_nt/data/response/my_response.dart';
import '../../utils/constants/app_constants.dart';

class ApiProvider {
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
