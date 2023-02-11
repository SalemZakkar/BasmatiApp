import 'dart:convert';

import 'package:basic_project/screens/settings/bloc_export.dart';
import 'package:equatable/equatable.dart';

import '../../../core/setting_core/setting_core.dart';
import '../../../services/web_services/api_engine/response_model.dart';
import '../../authentication/persistance/storage.dart';
import '../model/model_export.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(SettingsInitial(
          stateStatusUserInfo: StateStatus(),
          myCustomUserInfo: MyCustomUserInfo(),
          stateStatusChangePassword: StateStatus(),
        )) {
    on<SettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetUserInfoEvent>(_getUserInfoEvent);
    on<UpdateFullNameEvent>(_updateFullNameEvent);
    on<ChangePasswordEvent>(_changePasswordEvent);
    on<ChangePhoneNumberEvent>(_changePhoneNumberEvent);
  }

  _changePhoneNumberEvent(
      ChangePhoneNumberEvent event, Emitter<SettingsState> emit) async {
    emit(ChangePhoneNumberState(
        stateStatusChangePhoneNumber: StateStatus()
            .copyWith(inProgress: true, success: false, failure: false),
        stateStatusUserInfo: state.stateStatusUserInfo,
        myCustomUserInfo: state.myCustomUserInfo,
        stateStatusChangePassword: state.stateStatusChangePassword));

    ResponseModel response =
        await SettingCore.changePhoneNumber(event.phoneNumber);
    if (response.success) {
      // MyCustomUserInfo myCustomUserInfo =
      // MyCustomUserInfo.fromJson(jsonDecode(response.res!.data));
      emit(ChangePhoneNumberState(
        stateStatusChangePhoneNumber:
            StateStatus().copyWith(inProgress: false, success: true),
        stateStatusUserInfo: state.stateStatusUserInfo,
        myCustomUserInfo: state.myCustomUserInfo,
        stateStatusChangePassword: state.stateStatusChangePassword,
      ));
    } else {
      emit(ChangePhoneNumberState(
        stateStatusChangePhoneNumber: StateStatus().copyWith(
            inProgress: false, failure: true, errorMessage: response.errorCode),
        stateStatusUserInfo: state.stateStatusUserInfo,
        myCustomUserInfo: state.myCustomUserInfo,
        stateStatusChangePassword: state.stateStatusChangePassword,
      ));
    }
  }

  _getUserInfoEvent(GetUserInfoEvent event, Emitter<SettingsState> emit) async {
    emit(GetUserInfoState(
        stateStatusUserInfo: StateStatus()
            .copyWith(inProgress: true, success: false, failure: false),
        myCustomUserInfo: state.myCustomUserInfo,
        stateStatusChangePassword: state.stateStatusChangePassword));

    ResponseModel response = await SettingCore.getUserInfo();
    if (response.success) {
      MyCustomUserInfo myCustomUserInfo =
          MyCustomUserInfo.fromJson(jsonDecode(response.res!.data));

      emit(GetUserInfoState(
          stateStatusUserInfo:
              StateStatus().copyWith(inProgress: false, success: true),
          myCustomUserInfo: myCustomUserInfo,
          stateStatusChangePassword: state.stateStatusChangePassword));
    } else {
      emit(GetUserInfoState(
          stateStatusUserInfo: StateStatus().copyWith(
            inProgress: false,
            failure: true,
            errorMessage: response.errorCode,
          ),
          myCustomUserInfo: state.myCustomUserInfo,
          stateStatusChangePassword: state.stateStatusChangePassword));
    }
  }

  _updateFullNameEvent(
      UpdateFullNameEvent event, Emitter<SettingsState> emit) async {
    emit(UpdateFullNameState(
      stateStatusUserInfo: state.stateStatusUserInfo,
      myCustomUserInfo: state.myCustomUserInfo,
      stateStatusChangePassword: state.stateStatusChangePassword,
      stateStatusUpdateFullName: StateStatus()
          .copyWith(inProgress: true, success: false, failure: false),
    ));

    ResponseModel response = await SettingCore.updateFullName(event.fullName);
    if (response.success) {
      emit(
        UpdateFullNameState(
          stateStatusUserInfo: state.stateStatusUserInfo,
          myCustomUserInfo: state.myCustomUserInfo,
          stateStatusChangePassword: state.stateStatusChangePassword,
          stateStatusUpdateFullName:
              StateStatus().copyWith(inProgress: false, success: true),
        ),
      );
    } else {
      emit(UpdateFullNameState(
        stateStatusUserInfo: state.stateStatusUserInfo,
        myCustomUserInfo: state.myCustomUserInfo,
        stateStatusChangePassword: state.stateStatusChangePassword,
        stateStatusUpdateFullName: StateStatus().copyWith(
            inProgress: false, failure: true, errorMessage: response.errorCode),
      ));
    }
  }

  _changePasswordEvent(
      ChangePasswordEvent event, Emitter<SettingsState> emit) async {
    emit(ChangePasswordState(
        stateStatusUserInfo: state.stateStatusUserInfo,
        myCustomUserInfo: state.myCustomUserInfo,
        stateStatusChangePassword: StateStatus()
            .copyWith(inProgress: true, success: false, failure: false)));

    ResponseModel response =
        await SettingCore.changePassword(event.newPassword);
    if (response.success) {
      await AuthStore.setAuthPassword(event.newPassword);
      emit(ChangePasswordState(
          stateStatusUserInfo: state.stateStatusUserInfo,
          myCustomUserInfo: state.myCustomUserInfo,
          stateStatusChangePassword:
              StateStatus().copyWith(inProgress: false, success: true)));
    } else {
      emit(ChangePasswordState(
          stateStatusUserInfo: state.stateStatusUserInfo,
          myCustomUserInfo: state.myCustomUserInfo,
          stateStatusChangePassword: StateStatus().copyWith(
              inProgress: false,
              failure: true,
              errorMessage: response.errorCode)));
    }
  }
}
