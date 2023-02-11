import 'dart:convert';
import 'dart:io';

import 'package:basic_project/screens/authentication/persistance/storage.dart';
import 'package:basic_project/screens/shopping_cart/db/sql_db.dart';
import 'package:basic_project/screens/shopping_cart/models/cart_item_model.dart';
import 'package:basic_project/screens/shopping_cart/models/shopping_error.dart';
import 'package:basic_project/services/web_services/api_engine/api_engine.dart';
import 'package:basic_project/services/web_services/api_engine/error_model.dart';
import 'package:basic_project/services/web_services/api_engine/response_model.dart';
import 'package:basic_project/shared/web_services_export.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../helper/print_log.dart';
import '../../services/web_services/api_engine/enum.dart';

class ShoppingCartCore {
  static Future<dynamic> getData() async {
    String token = await AuthStore.getToken() ?? "";
    try {
      List<Map<String, dynamic>> ids = [];
      List<Products> cart = await CartDB.privateConstructor().getAllItems();
      for (var c in cart) {
        ids.add({"id": c.id, "qty": c.qty});
      }
      Response res = await myDio.post(EndPoints.calc,
          data: {"products": ids},
          options: Options(
              headers: {HttpHeaders.authorizationHeader: "Bearer $token"}));
      if (res.statusCode == 200 ||
          res.statusCode == 201 ||
          res.statusCode == 204) {
        CartItemModel cartItemModel =
            CartItemModel.fromJson(jsonDecode(res.data));
        List<Products> items = cartItemModel.data?.products ?? [];
        for (var data in items) {
          await CartDB.privateConstructor().insert(data);
        }
        return ResponseModel(success: true, res: res);
      } else {
        ShoppingError error = ShoppingError.fromJson(jsonDecode(res.data));
        if (error.code == "1420") {
          return error;
        } else {
          return ResponseModel(success: false, errorCode: error.code);
        }
      }
    } on DioError catch (e) {
      debugPrint(
          "------------------------------------------------------------------------");
      debugPrint("DioError");
      debugPrint(e.toString());
      debugPrint(
          "------------------------------------------------------------------------");
      if (e.type == DioErrorType.response && e.response != null) {
        try {
          ErrorData errorData =
              ErrorData.fromJson(jsonDecode(e.response?.data));
          return ResponseModel(success: false, errorCode: errorData.code ?? "");
        } catch (e) {
          return ResponseModel(success: false, errorCode: "7787");
        }
      } else if (e.message == "XMLHttpRequest error." ||
          e.type == DioErrorType.connectTimeout ||
          e.error is SocketException ||
          e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        return ResponseModel(success: false, errorCode: "7");
      } else {
        return ResponseModel(success: false, errorCode: "8872");
      }
    } on FormatException catch (e) {
      debugPrint(
          "------------------------------------------------------------------------");
      debugPrint("FormatError     $e");
      debugPrint(
          "------------------------------------------------------------------------");
      return ResponseModel(success: false, errorCode: "02210");
    } catch (e) {
      debugPrint(
          "------------------------------------------------------------------------");
      debugPrint("Other");
      debugPrint(e.toString());
      debugPrint(
          "------------------------------------------------------------------------");
      return ResponseModel(success: false, errorCode: "9976");
    }
  }

  static Future<ResponseModel> save(String id, int count) async {
    String token = await AuthStore.getToken() ?? "";
    ResponseModel res = await ApiEngine.request(
        requestMethod: RequestMethod.post,
        path: EndPoints.calc,
        data: {
          "products": [
            {"id": id, "qty": count}
          ]
        },
        options: Options(
            headers: {HttpHeaders.authorizationHeader: "Bearer $token"}));
    return res;
  }

  static Future<List<Products>> getAllCartData() async {
    try {
      return await CartDB.privateConstructor().getAllItems();
    } catch (error) {
      printLog(stateID: "353593", data: error.toString(), isSuccess: false);
      return [];
    }
  }

  static Future<ResponseModel> saveOrder(List<Products> listProducts) async {
    List<Map<String, String>> listData = [];

    for (var element in listProducts) {
      listData.add({
        "id": element.id.toString(),
        "qty": element.qty.toString(),
      });
    }

    ResponseModel response = await ApiEngine.request(
        requestMethod: RequestMethod.post,
        path: EndPoints.order,
        options: Options(
          headers: <String, String>{
            "Authorization": "Bearer ${await AuthStore.getToken()}",
          },
        ),
        data: {
          // "paymentType": "Cash",
          "products": listData,
        });
    return response;
  }
}
