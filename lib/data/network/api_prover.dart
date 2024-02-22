import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:najot_talim_nt/data/models/category_model.dart';
import 'package:najot_talim_nt/data/models/network_response.dart';
import 'package:najot_talim_nt/data/models/product_model.dart';

class ApiProvider{
  static Future<NetworkResponse> fetchSingleProductData(int id) async{
    NetworkResponse networkResponse=NetworkResponse();
    try{
      http.Response response = await http.get(Uri.parse("https://imtixon.free.mockoapp.net/categories/$id"));
      if(response.statusCode==200){
        networkResponse.data=(jsonDecode(response.body) as List?)
            ?.map((e) => ProductModel.fromJson(e))
            .toList() ??
            [];
      }
      else{
        networkResponse.errorText="Error";
      }
    }catch(error){
      networkResponse.errorText=error.toString();
    }
    return networkResponse;
  }
  
  static Future<NetworkResponse> fetchProducts() async {
    NetworkResponse networkResponse1=NetworkResponse();
    try{
      http.Response response = await http.
                      get(Uri.parse("https://imtixon.free.mockoapp.net/products"));
      if(response.statusCode==200){
        networkResponse1.data=(jsonDecode(response.body)["data"] as List?)
            ?.map((e) => ProductModel.fromJson(e))
            .toList() ??
            [];
      }
      
    }catch(error){
      networkResponse1.errorText=error.toString();
    }
    return networkResponse1;
  }

  static Future<NetworkResponse> fetchCategories() async {
    NetworkResponse networkResponse1=NetworkResponse();
    try{
      http.Response response = await http.get(Uri.parse("https://imtixon.free.mockoapp.net/categories"));
      if(response.statusCode==200){
        networkResponse1.data=(jsonDecode(response.body) as List?)
            ?.map((e) => CategoryModel.fromJson(e))
            .toList() ??
                   [];
      }

    }catch(error){
      networkResponse1.errorText=error.toString();
    }
    return networkResponse1;
  }
  
}