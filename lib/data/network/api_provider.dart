import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:najot_talim_nt/data/model/my_response/my_response.dart';
import '../model/currency_model/currency_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Future<MyResponse> getCurrencies() async {
    try {
      final Dio dio = Dio();
      Response response =
          await dio.get("https://nbu.uz/en/exchange-rates/json/");

      if (response.statusCode == 200) {
        debugPrint(
            "__________________________________status code${response.statusCode}");
        List<CurrencyModel> currencies = (response.data as List?)
                ?.map((e) => CurrencyModel.fromJson(e))
                .toList() ??
            [];
        debugPrint(
            "__________________________________data code${currencies.length}");
        return MyResponse(data: currencies);
      } else {
        return MyResponse(statusCode: response.statusCode!);
      }
    } on SocketException {
      return MyResponse(
          errorText: "INTERNETNI YO'QOTINGIZNI TEKSHIRING!", statusCode: 404);
    } catch (e) {
      return MyResponse(
        errorText:
            "SERVERGA MUROJAT QILISHDA XATOLIK YUZ BERDI: ${e.toString()}",
        statusCode: 404,
      );
    }
  }
}
