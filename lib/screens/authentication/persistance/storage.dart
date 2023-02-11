import 'package:shared_preferences/shared_preferences.dart';

import '../../../helper/print_log.dart';
import '../models/sing_in_model.dart';

class AuthStore {
  static Future<void> setToken(SingInModel tokenData) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (tokenData.data != null) {
      sharedPreferences.setString("token", tokenData.data!.accessToken!);
      sharedPreferences.setString(
          "refreshToken", tokenData.data!.refreshToken!);
      printLog(
          stateID: "AuthStorageSave",
          data: [tokenData.data?.accessToken, tokenData.data?.refreshToken],
          isSuccess: true);
    }
  }

  static Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    printLog(stateID: "AuthStorageGetToken", data: [token], isSuccess: true);
    return token;
  }

  static Future<String?> getRefresh() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("refreshToken");
    printLog(stateID: "AuthStorageGetRefresh", data: [token], isSuccess: true);
    return token;
  }

  static Future<void> setAuthInfo(String phone, String pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("phone", phone);
    sharedPreferences.setString("pass", pass);
    printLog(stateID: "AuthStorageSave", data: [phone, pass], isSuccess: true);
  }

  static Future<void> setAuthPassword(String pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("pass", pass);
    printLog(stateID: "AuthStorageSave", data: [pass], isSuccess: true);
  }

  static Future<void> setPhone(String phone) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("phone", phone);
    printLog(stateID: "AuthStorageSave", data: [phone], isSuccess: true);
  }

  static Future<String?> getPhone() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("phone");
    printLog(stateID: "AuthStorageGetPhone", data: [token], isSuccess: true);
    return token;
  }

  static Future<String?> getPass() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("pass");
    printLog(stateID: "AuthStorageGetPhone", data: [token], isSuccess: true);
    return token;
  }

  static Future<void> clear() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("phone");
    sharedPreferences.remove("pass");
    sharedPreferences.remove("refreshToken");
    sharedPreferences.remove("token");
    printLog(
        stateID: "AuthStorageClear", data: "Clear -- Logout", isSuccess: true);
  }
}
