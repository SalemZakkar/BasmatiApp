import 'dart:io';

import 'package:basic_project/screens/authentication/persistance/storage.dart';
import 'package:basic_project/services/web_services/api_engine/api_engine.dart';
import 'package:basic_project/services/web_services/api_engine/enum.dart';
import 'package:basic_project/services/web_services/api_engine/response_model.dart';
import 'package:basic_project/services/web_services/endpoint.dart';
import 'package:dio/dio.dart';

class OrderCore {
  static Future<ResponseModel> getOrderLogs(
      int skip, int limit, bool subscribe) async {
    ResponseModel res = await ApiEngine.request(
      requestMethod: RequestMethod.get,
      path: EndPoints.order,
      queryParameters: {
        "skip": skip,
        "limit": limit,
        "total": true,
        "isSubscription": subscribe
      },
      options: Options(headers: {
        HttpHeaders.authorizationHeader: "Bearer ${await AuthStore.getToken()}"
      }),
    );
    return res;
  }

  static Future<ResponseModel> getOrderDetails(String id) async {
    ResponseModel res = await ApiEngine.request(
      requestMethod: RequestMethod.get,
      path: "${EndPoints.order}/$id",
      options: Options(headers: {
        HttpHeaders.authorizationHeader: "Bearer ${await AuthStore.getToken()}"
      }),
    );
    return res;
  }

  static Future<ResponseModel> subscribe(String id) async {
    ResponseModel res = await ApiEngine.request(
      requestMethod: RequestMethod.post,
      path: EndPoints.order,
      data: {"subscription": id},
      options: Options(headers: {
        HttpHeaders.authorizationHeader: "Bearer ${await AuthStore.getToken()}"
      }),
    );
    return res;
  }
}
