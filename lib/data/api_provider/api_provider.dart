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
        books = (response.data['items'] as List?)
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

  Future<MyResponse> deleteBook(String uuid) async {
    try {
      Response response = await dio.delete(
        AppConstants.endPoint,
        queryParameters: {},
        data: [
          {"_uuid": uuid}
        ],
      );
      return MyResponse(
        data: response.statusCode.toString(),
      );
    } catch (error) {
      debugPrint("ERROR:$error");
      return MyResponse(
        errorText: error.toString(),
      );
    }
  }

  Future<MyResponse> addNewBook(BookModel bookModel) async {
    try {
      Response response = await dio.post(
        AppConstants.endPoint,
        data: [
          bookModel.toJson(),
        ],
      );
      return MyResponse(
        data: response.statusCode.toString(),
      );
    } catch (error) {
      debugPrint("ERROR:$error");
      return MyResponse(
        errorText: error.toString(),
      );
    }
  }

  Future<MyResponse> updateBook(BookModel bookModel) async {
    try {
      Response response = await dio.put(
        AppConstants.endPoint,
        data: [
          bookModel.toJsonForUpdate(),
        ],
      );
      return MyResponse(
        data: response.statusCode.toString(),
      );
    } catch (error) {
      debugPrint("ERROR:$error");
      return MyResponse(
        errorText: error.toString(),
      );
    }
  }
}
