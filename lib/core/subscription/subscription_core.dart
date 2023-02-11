import 'dart:io';

import 'package:basic_project/screens/authentication/persistance/storage.dart';
import 'package:basic_project/services/web_services/api_engine/api_engine.dart';
import 'package:basic_project/services/web_services/api_engine/enum.dart';
import 'package:basic_project/services/web_services/endpoint.dart';
import 'package:dio/dio.dart';

import '../../services/web_services/api_engine/response_model.dart';

class SubscriptionCore {
  static Future<ResponseModel> getSubscriptions(int skip, int limit) async {
    ResponseModel res = await ApiEngine.request(
        requestMethod: RequestMethod.get,
        path: EndPoints.subscription,
        queryParameters: {"total": true, "skip": skip, "limit": limit});
    return res;
  }

  static Future<ResponseModel> getSubscriptionDetails(String id) async {
    ResponseModel res = await ApiEngine.request(
        requestMethod: RequestMethod.get,
        path: "${EndPoints.subscription}/$id",
        options: Options(headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${await AuthStore.getToken()}"
        }));
    return res;
  }
}
