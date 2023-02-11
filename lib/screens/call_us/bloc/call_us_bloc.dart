import 'dart:convert';

import 'package:basic_project/core/about_us/about_us_core.dart';
import 'package:basic_project/services/web_services/api_engine/response_model.dart';
import 'package:equatable/equatable.dart';

import '../../../config/bloc_export.dart';
import '../model/model_export.dart';

part 'call_us_event.dart';
part 'call_us_state.dart';

class CallUsBloc extends Bloc<CallUsEvent, CallUsState> {
  CallUsBloc()
      : super(CallUsInitial(
            stateStatusGetAboutUs: StateStatus(), aboutUs: AboutUs())) {
    on<CallUsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetAboutUsEvent>(_getAboutUsEvent);
  }

  _getAboutUsEvent(GetAboutUsEvent event, Emitter<CallUsState> emit) async {
    emit(GetAboutUsState(
        stateStatusGetAboutUs: StateStatus()
            .copyWith(inProgress: true, success: false, failure: false),
        aboutUs: state.aboutUs));

    ResponseModel responseModel = await AboutUsCore.getAboutUs();

    if (responseModel.success) {
      AboutUs aboutUs = AboutUs.fromJson(jsonDecode(responseModel.res!.data));

      emit(GetAboutUsState(
          stateStatusGetAboutUs:
              StateStatus().copyWith(inProgress: false, success: true),
          aboutUs: aboutUs));
    } else {
      emit(GetAboutUsState(
          stateStatusGetAboutUs: StateStatus().copyWith(
              inProgress: false,
              failure: true,
              errorMessage: responseModel.errorCode),
          aboutUs: state.aboutUs));
    }
  }
}
