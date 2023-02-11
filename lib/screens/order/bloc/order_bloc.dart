import 'dart:convert';

import 'package:basic_project/core/order_core/order_core.dart';
import 'package:basic_project/screens/order/models/order_details_model.dart';
import 'package:basic_project/screens/order/models/order_log_model.dart';
import 'package:basic_project/screens/order/models/subscribe_details_model.dart';
import 'package:basic_project/screens/order/models/subscribe_log_model.dart';
import 'package:basic_project/services/web_services/api_engine/response_model.dart';
import 'package:equatable/equatable.dart';

import '../../../config/bloc_export.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetOrderLog>(_getOrderLog);
    on<GetSubscriptionLog>(_getSubscriptionLog);
    on<GetOrderDetails>(_getOrderDetails);
    on<GetSubscriptionDetails>(_getSubscriptionDetails);
    on<Subscribe>(_subscribe);
  }

  _getOrderLog(GetOrderLog event, Emitter<OrderState> emit) async {
    emit(const OrderState(wait: true));
    ResponseModel res =
        await OrderCore.getOrderLogs(event.skip, event.limit, false);
    if (res.success) {
      OrderLogModel model = OrderLogModel.fromJson(jsonDecode(res.res?.data));
      emit(OrderState(success: true, orderLogModel: model));
    } else {
      emit(OrderState(fail: true, errorCode: res.errorCode));
    }
  }

  _getSubscriptionLog(
      GetSubscriptionLog event, Emitter<OrderState> emit) async {
    emit(const OrderState(wait: true));
    ResponseModel res =
        await OrderCore.getOrderLogs(event.skip, event.limit, true);
    if (res.success) {
      SubscribeLogModel model =
          SubscribeLogModel.fromJson(jsonDecode(res.res?.data));
      emit(OrderState(success: true, subscribeLogModel: model));
    } else {
      emit(OrderState(fail: true, errorCode: res.errorCode));
    }
  }

  _getOrderDetails(GetOrderDetails event, Emitter<OrderState> emit) async {
    emit(const OrderState(wait: true));
    ResponseModel res = await OrderCore.getOrderDetails(event.id);
    if (res.success) {
      OrderDetailsModel model =
          OrderDetailsModel.fromJson(jsonDecode(res.res?.data));
      emit(OrderState(success: true, orderDetailsModel: model));
    } else {
      emit(OrderState(fail: true, errorCode: res.errorCode));
    }
  }

  _getSubscriptionDetails(
      GetSubscriptionDetails event, Emitter<OrderState> emit) async {
    emit(const OrderState(wait: true));
    ResponseModel res = await OrderCore.getOrderDetails(event.id);
    if (res.success) {
      SubscribeDetailsModel model =
          SubscribeDetailsModel.fromJson(jsonDecode(res.res?.data));
      emit(OrderState(success: true, subscriptionDetailsModel: model));
    } else {
      emit(OrderState(fail: true, errorCode: res.errorCode));
    }
  }

  _subscribe(Subscribe event, Emitter<OrderState> emit) async {
    emit(const OrderState(wait: true));
    ResponseModel res = await OrderCore.subscribe(event.id);
    if (res.success) {
      Map map = jsonDecode(res.res?.data);
      emit(OrderState(success: true, oId: map['data']['id']));
    } else {
      emit(OrderState(fail: true, errorCode: res.errorCode));
    }
  }
}
