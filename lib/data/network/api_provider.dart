import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:najot_talim_nt/data/models/first_model/first_model.dart';
import 'package:najot_talim_nt/data/models/second_model/second_model.dart';
import 'package:najot_talim_nt/data/response/my_response.dart';
import 'package:najot_talim_nt/utils/constants/app_constants.dart';

class ApiProvider {
  static Future<MyResponse> getAllData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          AppConstants.firstBaseUrl,
        ),
      );

      if (response.statusCode == 200) {
        return MyResponse(
          data: (jsonDecode(response.body) as List?)
                  ?.map(
                    (e) => FirstModel.fromJson(e),
                  )
                  .toList() ??
              [],
        );
      }
      return MyResponse(
        errorText: response.statusCode.toString(),
      );
    } catch (error) {
      return MyResponse(
        errorText: error.toString(),
      );
    }
  }
  static Future<MyResponse> getAllUserData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          AppConstants.secondBaseUrl,
        ),
      );

      if (response.statusCode == 200) {
        return MyResponse(
          data: (jsonDecode(response.body) as List?)
                  ?.map(
                    (e) => SecondModel.fromJson(e),
                  )
                  .toList() ??
              [],
        );
      }
      return MyResponse(
        errorText: response.statusCode.toString(),
      );
    } catch (error) {
      return MyResponse(
        errorText: error.toString(),
      );
    }
  }
}
