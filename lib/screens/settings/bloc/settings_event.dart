part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetUserInfoEvent extends SettingsEvent {
  const GetUserInfoEvent();
}

class UpdateFullNameEvent extends SettingsEvent {
  final String token;
  final String fullName;

  const UpdateFullNameEvent({required this.token, required this.fullName});
}

class ChangePasswordEvent extends SettingsEvent {
  final String token;
  final String oldPassword;
  final String newPassword;

  const ChangePasswordEvent(
      {required this.token,
      required this.oldPassword,
      required this.newPassword});
}

class ChangePhoneNumberEvent extends SettingsEvent {
  final String phoneNumber;

  const ChangePhoneNumberEvent(this.phoneNumber);
}
