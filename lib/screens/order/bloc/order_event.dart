part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}

class GetOrderLog extends OrderEvent {
  final int skip, limit;
  const GetOrderLog({required this.limit, required this.skip});
  @override
  List<Object?> get props => [skip, limit];
}

class GetSubscriptionLog extends OrderEvent {
  final int skip, limit;
  const GetSubscriptionLog({required this.limit, required this.skip});
  @override
  List<Object?> get props => [skip, limit];
}

class GetOrderDetails extends OrderEvent {
  final String id;
  const GetOrderDetails({required this.id});
  @override
  List<Object?> get props => [id];
}

class GetSubscriptionDetails extends OrderEvent {
  final String id;
  const GetSubscriptionDetails({required this.id});
  @override
  List<Object?> get props => [id];
}

class Subscribe extends OrderEvent {
  final String id;
  const Subscribe({required this.id});

  @override
  List<Object?> get props => [id];
}
