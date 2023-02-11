part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  final NotificationModel? notificationModel;
  final bool? success, waiting, failure;
  final String? error;
  const NotificationState(
      {this.notificationModel,
      this.success,
      this.waiting,
      this.failure,
      this.error});
}

class NotificationInitial extends NotificationState {
  @override
  List<Object> get props => [];
}

class NotifyState extends NotificationState {
  const NotifyState(
      {super.error,
      super.failure,
      super.notificationModel,
      super.success,
      super.waiting});
  @override
  // TODO: implement props
  List<Object?> get props => [
        super.error,
        super.failure,
        super.notificationModel,
        super.success,
        super.waiting
      ];
}
