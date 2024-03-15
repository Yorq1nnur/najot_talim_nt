// ignore_for_file: unused_import

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:najot_talim_nt/data/models/country_model/country_model.dart';
import 'package:najot_talim_nt/data/models/user_model/user_model.dart';
import 'package:najot_talim_nt/data/response/my_response.dart';
import 'package:najot_talim_nt/utils/constants/app_constants.dart';

class ApiProvider {
  static Future<List<CountryModel>> getAllCountryData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(AppConstants.firstBaseUrl),
      );
      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List?)
            ?.map((e) => CountryModel.fromJson(e))
            .toList() ??
            [];
      }
    } catch (error) {
      return [];
    }

    return [];
  }

  static Future<List<UserModel>> getAllUserData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(AppConstants.secondBaseUrl),
      );
      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List?)
            ?.map((e) => UserModel.fromJson(e))
            .toList() ??
            [];
      }
    } catch (error) {
      return [];
    }

    return [];
  }

}
