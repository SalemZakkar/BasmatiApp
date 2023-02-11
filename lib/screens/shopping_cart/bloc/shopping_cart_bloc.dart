import 'dart:convert';

import 'package:basic_project/core/shopping_cart_core/shopping_cart_core.dart';
import 'package:basic_project/screens/call_us/model/model_export.dart';
import 'package:basic_project/screens/shopping_cart/models/cart_item_model.dart';
import 'package:basic_project/screens/shopping_cart/models/shopping_error.dart';
import 'package:basic_project/screens/shopping_cart/shopping_cart_export.dart';
import 'package:basic_project/services/web_services/api_engine/response_model.dart';
import 'package:equatable/equatable.dart';

import '../../../config/bloc_export.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc()
      : super(ShoppingCartInitial(
            cartItemModel: CartItemModel(), status: StateStatus())) {
    on<ShoppingCartEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ShoppingCartGetData>(_getData);
    on<ShoppingCartSave>(_saveData);
    on<ShoppingCartAddQty>(_addEvent);
    on<ShoppingCartSubQty>(_removeEvent);
    on<SaveOrderEvent>(_saveOrderEvent);
  }

  _saveOrderEvent(SaveOrderEvent event, Emitter<ShoppingCartState> emit) async {
    emit(SaveOrderState(
        cartItemModel: state.cartItemModel,
        status: state.status,
        saveOrderStateStatus: StateStatus()
            .copyWith(inProgress: true, success: false, failure: false),
        idOrder: ""));

    var res = await ShoppingCartCore.saveOrder(
        await ShoppingCartCore.getAllCartData());

    if (res.success) {
      final data = jsonDecode(res.res!.data);
      // print(data["data"]["id"]);
      emit(SaveOrderState(
          cartItemModel: state.cartItemModel,
          status: state.status,
          saveOrderStateStatus:
              StateStatus().copyWith(inProgress: false, success: true),
          idOrder: data["data"]["id"]));
    } else {
      emit(SaveOrderState(
          cartItemModel: state.cartItemModel,
          status: state.status,
          saveOrderStateStatus: StateStatus().copyWith(
              inProgress: false, failure: true, errorMessage: res.errorCode),
          idOrder: ""));
    }
  }

  _getData(ShoppingCartEvent event, Emitter<ShoppingCartState> emit) async {
    emit(ShoppingState(
        status: StateStatus().copyWith(inProgress: true),
        cartItemModel: CartItemModel()));
    var res = await ShoppingCartCore.getData();
    if (res is ResponseModel) {
      if (res.success) {
        CartItemModel data = CartItemModel.fromJson(jsonDecode(res.res?.data));
        emit(ShoppingState(
            status: StateStatus().copyWith(success: true),
            cartItemModel: data));
      } else {
        emit(ShoppingState(
            status: StateStatus()
                .copyWith(failure: true, errorMessage: res.errorCode),
            cartItemModel: CartItemModel()));
      }
    } else {
      ShoppingError error = res;
      if (error.code == "1420") {
        emit(ShoppingState(
          status:
              StateStatus().copyWith(failure: true, errorMessage: error.code),
          cartItemModel: CartItemModel(),
          shoppingError: error,
        ));
      } else {
        emit(ShoppingState(
          status:
              StateStatus().copyWith(failure: true, errorMessage: error.code),
          cartItemModel: CartItemModel(),
        ));
      }
    }
  }

  _saveData(ShoppingCartSave event, Emitter<ShoppingCartState> emit) async {
    emit(ShoppingState(
        cartItemModel: CartItemModel(),
        status: StateStatus().copyWith(inProgress: true)));
    ResponseModel res = await ShoppingCartCore.save(event.id, event.count);
    if (res.success) {
      CartItemModel cartItemModel =
          CartItemModel.fromJson(jsonDecode(res.res?.data));
      emit(ShoppingState(
          status: StateStatus().copyWith(success: true),
          cartItemModel: cartItemModel));
    } else {
      emit(ShoppingState(
          status: StateStatus()
              .copyWith(failure: true, errorMessage: res.errorCode ?? ""),
          cartItemModel: CartItemModel()));
    }
  }

  _addEvent(ShoppingCartAddQty event, Emitter<ShoppingCartState> emit) {
    emit(ShoppingState(
        status: StateStatus(),
        cartItemModel: CartItemModel(),
        shoppingCartAddQty: event.price));
  }

  _removeEvent(ShoppingCartSubQty event, Emitter<ShoppingCartState> emit) {
    emit(ShoppingState(
        status: StateStatus(),
        cartItemModel: CartItemModel(),
        shoppingCartSubQty: event.price));
  }
}
