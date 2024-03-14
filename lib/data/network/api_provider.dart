import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:najot_talim_nt/data/models/first_model/first_model.dart';
import 'package:najot_talim_nt/data/response/my_response.dart';
import 'package:najot_talim_nt/utils/constants/app_constants.dart';

class ApiProvider {
  static Future<MyResponse> getAllData() async {
    Uri uri = Uri.https(AppConstants.firstBaseUrl,);
    try {
      http.Response response = await http.get(
        uri,
      );

      if (response.statusCode == 200) {
        return MyResponse(
          data: (jsonDecode(response.body)["items"] as List?)
              ?.map((e) => CyprusModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  }
