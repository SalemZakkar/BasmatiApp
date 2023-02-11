import 'dart:convert';

import 'package:basic_project/core/auth_core/auth_core.dart';
import 'package:basic_project/core/notification_core/notification_core.dart';
import 'package:basic_project/screens/authentication/authentication_export.dart';
import 'package:basic_project/screens/authentication/persistance/storage.dart';
import 'package:basic_project/screens/shopping_cart/db/sql_db.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helper/helper_export.dart';
import '../../../services/web_services/api_engine/response_model.dart';
import '../models/models_export.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(AuthInitial(
            customUserInfo: CustomUserInfo(),
            stateStatusSingIn: StateStatus(),
            singIn: SingInModel(),
            stateStatusSingUp: StateStatus())) {
    on<AuthEvent>((event, emit) {});
    on<AuthSignInEvent>(_authSingInEvent);
    on<AuthSignUpEvent>(_authSignUpEvent);
    on<AuthGetPrefUserInfoEvent>(_authGetPrefUserInfoEvent);
    on<AuthSignOutEvent>(_authSignOutEvent);
  }

  _authSignOutEvent(AuthSignOutEvent event, Emitter<AuthState> emit) async {
    try {
      await _clearPrefUserInfo();
      await CartDB.privateConstructor().clear();
      emit(AuthSignOutState(
          customUserInfo: CustomUserInfo(),
          stateStatusSingIn: StateStatus(),
          singIn: SingInModel(),
          stateStatusSingUp: StateStatus()));
    } catch (error) {
      printLog(stateID: "295323", data: error.toString(), isSuccess: false);
    }
  }

  _authSingInEvent(AuthSignInEvent event, Emitter<AuthState> emit) async {
    // try {
    emit(AuthSignInState(
      customUserInfo: state.customUserInfo,
      stateStatusSingIn: StateStatus()
          .copyWith(inProgress: true, success: false, failure: false),
      singIn: state.singIn,
      stateStatusSingUp: state.stateStatusSingUp,
    ));

    ResponseModel response =
        await AuthCore.signIn(event.phoneNumber, event.password);

    if (response.success) {
      SingInModel data = SingInModel.fromJson(jsonDecode(response.res?.data));
      AuthStore.setToken(data);
      AuthStore.setAuthInfo(event.phoneNumber, event.password);
      await NotificationCore.subNotify();
      emit(AuthSignInState(
        customUserInfo: state.customUserInfo
            .copyWith(phoneNumber: event.phoneNumber, password: event.password),
        stateStatusSingIn:
            StateStatus().copyWith(inProgress: false, success: true),
        singIn: data,
        stateStatusSingUp: state.stateStatusSingUp,
      ));
    } else {
      emit(AuthSignInState(
          customUserInfo: state.customUserInfo,
          stateStatusSingIn: StateStatus().copyWith(
              inProgress: false,
              failure: true,
              errorMessage: response.errorCode!),
          singIn: state.singIn,
          stateStatusSingUp: state.stateStatusSingUp));
    }
  }

  _authSignUpEvent(AuthSignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthSignUpState(
        customUserInfo: state.customUserInfo,
        stateStatusSingIn: state.stateStatusSingIn,
        singIn: state.singIn,
        stateStatusSingUp: StateStatus().copyWith(
          inProgress: true,
          success: false,
          failure: false,
        )));
    ResponseModel response = await AuthCore.signUp(
        event.fullName, event.phoneNumber, event.password);
    if (response.success) {
      SingInModel signIn = SingInModel.fromJson(jsonDecode(response.res!.data));
      AuthStore.setToken(signIn);
      AuthStore.setAuthInfo(event.phoneNumber, event.password);
      await NotificationCore.subNotify();
      emit(AuthSignUpState(
          customUserInfo: state.customUserInfo.copyWith(
              phoneNumber: event.phoneNumber, password: event.password),
          stateStatusSingIn: state.stateStatusSingIn,
          singIn: signIn,
          stateStatusSingUp: StateStatus().copyWith(
            inProgress: false,
            success: true,
          )));
      printLog(
          stateID: "402423",
          data: "Done is Auth _authSignUpEvent",
          isSuccess: true);
    } else {
      emit(AuthSignUpState(
          customUserInfo: state.customUserInfo,
          stateStatusSingIn: state.stateStatusSingIn,
          singIn: state.singIn,
          stateStatusSingUp: StateStatus().copyWith(
              inProgress: false,
              failure: true,
              errorMessage: response.errorCode!)));
    }
  }

  _clearPrefUserInfo() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (error) {
      printLog(
          stateID: "651540", data: "Clear Pref User Info", isSuccess: false);
    }
  }

  _authGetPrefUserInfoEvent(
      AuthGetPrefUserInfoEvent event, Emitter<AuthState> emit) async {
    DateTime startTime = DateTime.now();

    String? userPhoneNumber = await AuthStore.getPhone();
    String? userPassword = await AuthStore.getPass();

    try {
      emit(AuthGetPrefUserInfoState(
        customUserInfo: CustomUserInfo()
            .copyWith(phoneNumber: userPhoneNumber, password: userPassword),
        stateStatusSingIn: state.stateStatusSingIn,
        singIn: state.singIn,
        stateStatusSingUp: state.stateStatusSingUp,
      ));

      printLog(
          stateID: "435332",
          data: "Auth Get Pref User Info Event",
          isSuccess: true,
          startTime: startTime);
    } catch (error) {
      rethrow;
    }
  }
}
