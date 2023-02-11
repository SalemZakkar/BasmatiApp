import 'package:dio/dio.dart';

import '../../screens/authentication/persistance/storage.dart';
import '../../services/web_services/api_engine/api_engine.dart';
import '../../services/web_services/api_engine/enum.dart';
import '../../services/web_services/api_engine/response_model.dart';
import '../../services/web_services/endpoint.dart';

class SettingCore {
  static Future<ResponseModel> getUserInfo() async {
    ResponseModel response = await ApiEngine.request(
        requestMethod: RequestMethod.get,
        path: EndPoints.userMine,
        options: Options(
          headers: <String, String>{
            "Authorization": "Bearer ${await AuthStore.getToken()}",
            'Content-Type': '*/*',
          },
        ));
    return response;
  }

  static Future<ResponseModel> updateFullName(String fullName) async {
    ResponseModel response = await ApiEngine.request(
      requestMethod: RequestMethod.patch,
      path: EndPoints.userMine,
      options: Options(
        headers: <String, String>{
          "Authorization": "Bearer ${await AuthStore.getToken()}",
          'Content-Type': '*/*',
        },
      ),
      data: FormData.fromMap(
        {
          "fullName": fullName,
        },
      ),
    );
    return response;
  }

  static Future<ResponseModel> changePassword(String newPassword) async {
    ResponseModel response = await ApiEngine.request(
      requestMethod: RequestMethod.patch,
      path: EndPoints.changePassword,
      options: Options(
        headers: <String, String>{
          "Authorization": "Bearer ${await AuthStore.getToken()}",
        },
      ),
      data: {"old": await AuthStore.getPass(), "new": newPassword},
    );

    return response;
  }

  static Future<ResponseModel> changePhoneNumber(String phoneNumber) async {
    ResponseModel response = await ApiEngine.request(
      requestMethod: RequestMethod.patch,
      path: EndPoints.userMine,
      options: Options(
        headers: <String, String>{
          "Authorization": "Bearer ${await AuthStore.getToken()}",
        },
      ),
      data: FormData.fromMap(
        {
          "phone": phoneNumber,
        },
      ),
    );

    return response;
  }
}
