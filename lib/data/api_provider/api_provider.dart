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

  static Future<MyResponse> addStaticBook(BookModel bookModel) async {
    Dio dio = Dio();
    Options options = Options(
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
      headers: {
        "Authorization": "Bearer ${AppConstants.apiKey}",
        "Content-Type": "application/json",
      },
    );
    try {
      Response response = await dio.post(
        AppConstants.base,
        options: options,
        onReceiveProgress: (current, total) {},
        queryParameters: {},
        data: [
          bookModel.toJson(),
        ],
      );
      debugPrint('ADDED SUCCESSFULLY');
      return MyResponse(
        data: response.statusCode.toString(),
      );
    } catch (error) {
      debugPrint(error.toString());
      debugPrint("ERROR:$error");
      return MyResponse(
        errorText: error.toString(),
      );
    }
  }

  static Future<MyResponse> deleteStaticBook(String uuid) async {
    Dio dio = Dio();
    Options options = Options(
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
      headers: {
        "Authorization": "Bearer ${AppConstants.apiKey}",
        "Content-Type": "application/json",
      },
    );
    try {
      Response response = await dio.delete(
        AppConstants.base,
        options: options,
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
        AppConstants.base,
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
}
