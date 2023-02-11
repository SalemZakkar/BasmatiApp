part of 'subscription_bloc.dart';

abstract class SubscriptionState extends Equatable {
  final bool? wait, success, fail;
  final String? error;
  final SubscriptionModel? data;
  final SubscriptionDetailsData? detailsData;
  const SubscriptionState(
      {this.success,
      this.wait,
      this.fail,
      this.data,
      this.error,
      this.detailsData});
}

class SubscriptionInitial extends SubscriptionState {
  @override
  List<Object> get props => [];
}

class SubState extends SubscriptionState {
  const SubState(
      {super.data,
      super.error,
      super.fail,
      super.success,
      super.wait,
      super.detailsData});
  @override
  List<Object?> get props => [
        super.data,
        super.error,
        super.fail,
        super.success,
        super.wait,
        super.detailsData
      ];
}
