import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:najot_talim_nt/data/client/api_client.dart';
import 'package:najot_talim_nt/data/models/book/book_model.dart';
import '../../utils/app_constants/app_constants.dart';
import '../response/my_response.dart';

class ApiProvider extends ApiClient {
  Future<MyResponse> getBooks() async {
    List<BookModel> books = [];

    try {
      Response response = await dio.get(AppConstants.endPoint);
      if (response.statusCode == HttpStatus.ok) {
        books = (response.data as List?)
                ?.map(
                  (e) => BookModel.fromJson(
                    e,
                  ),
                )
                .toList() ??
            [];
        return MyResponse(
          data: books,
        );
      }
    } catch (error) {
      MyResponse(
        errorText: error.toString(),
      );
      debugPrint("ERROR:$error");
    }
    return MyResponse(
      errorText: "NO'MALUM XATOLIK!!!",
    );
  }
}
