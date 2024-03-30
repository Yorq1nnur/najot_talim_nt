import 'dart:convert';
import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:najot_talim_nt/data/models/place_model.dart';
import '../../utils/constants/app_constants.dart';
import '../my_response.dart';

class ApiProvider {
  static Future<String> getPlaceNameByLocation(LatLng latLng) async {
    String place = "Hudud noma'lum";

    Uri uri = Uri.https("geocode-maps.yandex.ru", "/1.x/", {
      "apikey": "5f31bfed-b0d6-428c-9835-d6d0ac9d1e65",
      "geocode": "${latLng.longitude}, ${latLng.latitude}",
      "lang": "uz",
      "format": "json",
      "kind": "house",
      "rspn": "1",
      "results": "5"
    });

    http.Response response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      var data = jsonDecode(response.body);
      var list =
          data["response"]["GeoObjectCollection"]["featureMember"] as List?;
      if (list != null && list.isNotEmpty) {
        String? placeName = list[0]["GeoObject"]["metaDataProperty"]
            ["GeocoderMetaData"]["text"];
        place = placeName ?? "Hudud noma'lum";
      }
    }
    return place;
  }

  static Future<MyResponse> getAllAddresses() async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/map");
    try {
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.crudToken}",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        return MyResponse(
          data: (jsonDecode(response.body)["items"] as List?)
              ?.map((e) => PlaceModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<PlaceModel> addNewAddress(PlaceModel placeModel) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/library");
    try {
      http.Response response = await http.post(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.crudToken}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([placeModel.toJson()]),
      );
      if (response.statusCode == 201) {
        return placeModel;
      }
      return placeModel;
    } catch (error) {
      return placeModel;
    }
  }

  static Future<MyResponse> deleteAddress(String id) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/library");
    try {
      http.Response response = await http.delete(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.crudToken}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([
          {"id": id}
        ]),
      );
      if (response.statusCode == 200) {
        return MyResponse(data: "Product deleted successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> updateAddress(PlaceModel placeModel) async {
    Uri uri = Uri.https(AppConstants.baseUrl, "/api/v1/library");
    try {
      http.Response response = await http.put(
        uri,
        headers: {
          "Authorization": "Bearer ${AppConstants.crudToken}",
          "Content-Type": "application/json",
        },
        body: jsonEncode([placeModel.toJsonForUpdate()]),
      );
      if (response.statusCode == 200) {
        return MyResponse(data: "Product updated successfully!");
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }
}
