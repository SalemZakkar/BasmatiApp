import 'package:basic_project/services/web_services/api_engine/api_engine.dart';
import 'package:basic_project/shared/web_services_export.dart';

import '../../services/web_services/api_engine/enum.dart';
import '../../services/web_services/api_engine/response_model.dart';

class ItemCore {
  static Future<ResponseModel> getItemDetails(String id) async {
    ResponseModel res = await ApiEngine.request(
        requestMethod: RequestMethod.get, path: "${EndPoints.product}/$id");
    return res;
  }
}
