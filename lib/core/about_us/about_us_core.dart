import 'package:dio/dio.dart';

import '../../screens/authentication/persistance/storage.dart';
import '../../services/web_services/api_engine/api_engine.dart';
import '../../services/web_services/api_engine/enum.dart';
import '../../services/web_services/api_engine/response_model.dart';
import '../../shared/web_services_export.dart';

class AboutUsCore {
  static Future<ResponseModel> getAboutUs() async {
    ResponseModel response = await ApiEngine.request(
      requestMethod: RequestMethod.get,
      path: EndPoints.aboutUs,
      options: Options(
        headers: <String, String>{
          "Authorization": "Bearer ${await AuthStore.getToken()}",
        },
      ),
      data: {},
    );
    return response;
  }
}
