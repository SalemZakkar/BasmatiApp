part of 'subscription_bloc.dart';

abstract class SubscriptionEvent extends Equatable {
  const SubscriptionEvent();
}

class GetSubscription extends SubscriptionEvent {
  final int skip, limit;
  const GetSubscription({required this.skip, required this.limit});

  @override
  List<Object?> get props => [skip, limit];
}

class GetSubDetails extends SubscriptionEvent {
  final String id;
  const GetSubDetails({required this.id});

  @override
  List<Object?> get props => [id];
}
