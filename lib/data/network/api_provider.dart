import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:najot_talim_nt/data/models/country/categories_model.dart';
import 'package:najot_talim_nt/data/models/network_response.dart';
import 'package:najot_talim_nt/data/models/user/user_model.dart';
class ApiProvider {
  static Future<NetworkResponse> fetchSingleUserData(int id) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      http.Response response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/$id"));

      if (response.statusCode == 200) {
        networkResponse.data = UserModel.fromJson(jsonDecode(response.body));
      } else {
        networkResponse.errorText = "Internal error";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  static Future<NetworkResponse> fetchUsers() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      http.Response response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));

      if (response.statusCode == 200) {
        networkResponse.data = (jsonDecode(response.body) as List?)
                ?.map((e) => UserModel.fromJson(e))
                .toList() ??
            [];
      } else {
        networkResponse.errorText = "Internal error";
      }
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  static Future<NetworkResponse> fetchCountries() async {
    try {
      http.Response response = await http
          .get(Uri.parse("https://imtixon.free.mockoapp.net/categories"));
      if (response.statusCode == 200) {
        List<CategoriesModel> countries =
            (jsonDecode(response.body)["data"] as List?)
                    ?.map((e) => CategoriesModel.fromJson(e))
                    .toList() ??
                [];
        return NetworkResponse(data: countries);
      } else {
        return NetworkResponse(errorText: "ERROR");
      }
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}
