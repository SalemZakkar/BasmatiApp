import 'dart:convert';

import 'package:basic_project/core/notification_core/notification_core.dart';
import 'package:basic_project/screens/notification/model/notification_model.dart';
import 'package:basic_project/services/web_services/api_engine/response_model.dart';
import 'package:equatable/equatable.dart';

import '../../../config/bloc_export.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NotificationMarkAsRead>(_markAsRead);
    on<NotificationGetEvent>(_notificationGet);
  }
  _notificationGet(
      NotificationGetEvent event, Emitter<NotificationState> emit) async {
    emit(const NotifyState(waiting: true));
    ResponseModel responseModel =
        await NotificationCore.getByCriteria(event.skip, event.limit);
    if (responseModel.success) {
      emit(NotifyState(
          success: true,
          notificationModel:
              NotificationModel.fromJson(jsonDecode(responseModel.res?.data))));
    } else {
      emit(NotifyState(failure: true, error: responseModel.errorCode));
    }
  }

  _markAsRead(
      NotificationMarkAsRead event, Emitter<NotificationState> emit) async {
    emit(const NotifyState(waiting: true));
    ResponseModel responseModel = await NotificationCore.markAsRead(event.id);
    if (responseModel.success) {
      emit(const NotifyState(
        success: true,
      ));
    } else {
      emit(NotifyState(failure: true, error: responseModel.errorCode));
    }
  }
}
