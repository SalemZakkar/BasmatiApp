part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class NotificationGetEvent extends NotificationEvent {
  final int skip, limit;
  const NotificationGetEvent({required this.skip, required this.limit});

  @override
  // TODO: implement props
  List<Object?> get props => [skip, limit];
}

class NotificationMarkAsRead extends NotificationEvent {
  final String id;
  const NotificationMarkAsRead({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
