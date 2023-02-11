import 'dart:convert';

import 'package:basic_project/core/subscription/subscription_core.dart';
import 'package:basic_project/screens/subscriptions/model/subscription_details_model.dart';
import 'package:basic_project/screens/subscriptions/model/subsription_model.dart';
import 'package:basic_project/services/web_services/api_engine/response_model.dart';
import 'package:equatable/equatable.dart';

import '../../../config/bloc_export.dart';

part 'subscription_event.dart';
part 'subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  SubscriptionBloc() : super(SubscriptionInitial()) {
    on<SubscriptionEvent>((event, emit) {});
    on<GetSubscription>(_getSubscription);
    on<GetSubDetails>(_getSubDetails);
  }
  _getSubscription(
      GetSubscription event, Emitter<SubscriptionState> emit) async {
    emit(const SubState(wait: true));
    ResponseModel res =
        await SubscriptionCore.getSubscriptions(event.skip, event.limit);
    if (res.success) {
      SubscriptionModel data =
          SubscriptionModel.fromJson(jsonDecode(res.res?.data));
      emit(SubState(data: data, success: true));
    } else {
      emit(SubState(fail: true, error: res.errorCode));
    }
  }

  _getSubDetails(GetSubDetails event, Emitter<SubscriptionState> emit) async {
    emit(const SubState(wait: true));
    ResponseModel res = await SubscriptionCore.getSubscriptionDetails(event.id);
    if (res.success) {
      SubscriptionDetailsModel model =
          SubscriptionDetailsModel.fromJson(jsonDecode(res.res?.data));
      emit(SubState(success: true, detailsData: model.data));
    } else {
      emit(SubState(error: res.errorCode, fail: true));
    }
  }
}
