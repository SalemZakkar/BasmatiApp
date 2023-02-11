part of 'order_bloc.dart';

class OrderState extends Equatable {
  final bool? wait;
  final bool? success;
  final bool? fail;
  final String? errorCode;
  final OrderLogModel? orderLogModel;
  final OrderDetailsModel? orderDetailsModel;
  final SubscribeLogModel? subscribeLogModel;
  final SubscribeDetailsModel? subscriptionDetailsModel;
  final String? oId;

  const OrderState(
      {this.subscribeLogModel,
      this.subscriptionDetailsModel,
      this.orderDetailsModel,
      this.orderLogModel,
      this.success,
      this.wait,
      this.fail,
      this.errorCode,
      this.oId});

  @override
  List<Object?> get props => [
        subscribeLogModel,
        subscriptionDetailsModel,
        orderDetailsModel,
        orderLogModel,
        success,
        wait,
        fail,
        errorCode,
        oId
      ];
}

class OrderInitial extends OrderState {
  @override
  List<Object> get props => [];
}
