part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final CustomUserInfo customUserInfo;
  final StateStatus stateStatusSingIn;
  final SingInModel singIn;
  final StateStatus stateStatusSingUp;

  const AuthState(
      {required this.customUserInfo,
      required this.stateStatusSingIn,
      required this.singIn,
      required this.stateStatusSingUp});

  @override
  List<Object> get props =>
      [customUserInfo, stateStatusSingIn, singIn, stateStatusSingUp];
}

class AuthInitial extends AuthState {
  const AuthInitial(
      {required super.customUserInfo,
      required super.stateStatusSingIn,
      required super.singIn,
      required super.stateStatusSingUp});
}

class AuthSignInState extends AuthState {
  const AuthSignInState(
      {required super.customUserInfo,
      required super.stateStatusSingIn,
      required super.singIn,
      required super.stateStatusSingUp});
}

class AuthSignUpState extends AuthState {
  const AuthSignUpState(
      {required super.customUserInfo,
      required super.stateStatusSingIn,
      required super.singIn,
      required super.stateStatusSingUp});
}

class AuthGetPrefUserInfoState extends AuthState {
  const AuthGetPrefUserInfoState(
      {required super.customUserInfo,
      required super.stateStatusSingIn,
      required super.singIn,
      required super.stateStatusSingUp});
}

class AuthSignOutState extends AuthState {
  const AuthSignOutState(
      {required super.customUserInfo,
      required super.stateStatusSingIn,
      required super.singIn,
      required super.stateStatusSingUp});
}
