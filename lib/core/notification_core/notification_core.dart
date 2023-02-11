import 'dart:io';

import 'package:basic_project/screens/authentication/persistance/storage.dart';
import 'package:basic_project/services/notification_service/notification_service.dart';
import 'package:basic_project/services/web_services/api_engine/api_engine.dart';
import 'package:basic_project/services/web_services/api_engine/enum.dart';
import 'package:basic_project/services/web_services/api_engine/response_model.dart';
import 'package:basic_project/services/web_services/endpoint.dart';
import 'package:dio/dio.dart';

class NotificationCore {
  static Future<ResponseModel> subNotify() async {
    String? token = await NotificationService.getDeviceToken();
    if (token != null) {
      ResponseModel res = await ApiEngine.request(
          requestMethod: RequestMethod.post,
          path: EndPoints.notificationSubscribe,
          data: {"token": token},
          options: Options(headers: {
            HttpHeaders.authorizationHeader:
                "Bearer ${await AuthStore.getToken()}"
          }));
      return res;
    }
    return ResponseModel(success: false, errorCode: "N_ERROR");
  }

  static Future<ResponseModel> getByCriteria(int skip, int limit) async {
    ResponseModel res = await ApiEngine.request(
        requestMethod: RequestMethod.get,
        path: EndPoints.notification,
        queryParameters: {"skip": skip, "limit": limit, "total": true},
        options: Options(headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${await AuthStore.getToken()}"
        }));
    return res;
  }

  static Future<ResponseModel> markAsRead(String id) async {
    ResponseModel res = await ApiEngine.request(
        requestMethod: RequestMethod.patch,
        path: "${EndPoints.notification}/$id",
        options: Options(headers: {
          HttpHeaders.authorizationHeader:
              "Bearer ${await AuthStore.getToken()}"
        }));
    return res;
  }
}
