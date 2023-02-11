import 'package:basic_project/services/web_services/api_engine/api_engine.dart';
import 'package:basic_project/services/web_services/api_engine/response_model.dart';
import 'package:basic_project/shared/web_services_export.dart';

import '../../services/web_services/api_engine/enum.dart';

class HomeCore {
  static Future<ResponseModel> getData(String? search, int skip, int limit,
      {bool? isSpecial}) async {
    Map<String, dynamic> query = {
      "total": true,
      "skip": skip.toString(),
      "limit": limit.toString()
    };
    if (search != null) {
      query["name"] = search;
    }
    if (isSpecial != null && isSpecial) {
      query["isSpecial"] = isSpecial;
    }
    ResponseModel res = await ApiEngine.request(
        requestMethod: RequestMethod.get,
        path: EndPoints.product,
        queryParameters: query);
    return res;
  }
}
