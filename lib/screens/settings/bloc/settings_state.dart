part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  final StateStatus stateStatusUserInfo;
  final MyCustomUserInfo myCustomUserInfo;
  final StateStatus stateStatusChangePassword;

  const SettingsState({
    required this.stateStatusUserInfo,
    required this.myCustomUserInfo,
    required this.stateStatusChangePassword,
  });

  @override
  List<Object> get props => [
        stateStatusUserInfo,
        myCustomUserInfo,
        stateStatusChangePassword,
      ];
}

class SettingsInitial extends SettingsState {
  const SettingsInitial(
      {required super.stateStatusUserInfo,
      required super.myCustomUserInfo,
      required super.stateStatusChangePassword});
}

class GetUserInfoState extends SettingsState {
  const GetUserInfoState(
      {required super.stateStatusUserInfo,
      required super.myCustomUserInfo,
      required super.stateStatusChangePassword});
}

class UpdateFullNameState extends SettingsState {
  final StateStatus stateStatusUpdateFullName;

  @override
  List<Object> get props => [stateStatusUpdateFullName];

  const UpdateFullNameState(
      {required super.stateStatusUserInfo,
      required super.myCustomUserInfo,
      required super.stateStatusChangePassword,
      required this.stateStatusUpdateFullName});
}

class ChangePasswordState extends SettingsState {
  const ChangePasswordState(
      {required super.stateStatusUserInfo,
      required super.myCustomUserInfo,
      required super.stateStatusChangePassword});
}

class ChangePhoneNumberState extends SettingsState {
  final StateStatus stateStatusChangePhoneNumber;

  @override
  List<Object> get props => [stateStatusChangePhoneNumber];

  const ChangePhoneNumberState(
      {required this.stateStatusChangePhoneNumber,
      required super.stateStatusUserInfo,
      required super.myCustomUserInfo,
      required super.stateStatusChangePassword});
}
