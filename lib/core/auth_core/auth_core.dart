import '../../services/web_services/api_engine/api_engine.dart';
import '../../services/web_services/api_engine/enum.dart';
import '../../services/web_services/api_engine/response_model.dart';
import '../../services/web_services/endpoint.dart';

class AuthCore {
  static Future<ResponseModel> signIn(String phone, String password) async {
    ResponseModel response = await ApiEngine.request(
        requestMethod: RequestMethod.post,
        path: EndPoints.authSignIn,
        data: {"phone": "+966$phone", "password": password});
    return response;
  }

  static Future<ResponseModel> signUp(
      String fullName, String phoneNumber, String password) async {
    ResponseModel response = await ApiEngine.request(
        requestMethod: RequestMethod.post,
        path: EndPoints.authSignUp,
        data: {
          "fullName": fullName,
          "phone": "+966$phoneNumber",
          "password": password
        });
    return response;
  }
}
