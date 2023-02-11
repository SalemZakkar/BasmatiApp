part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthSignInEvent extends AuthEvent {
  final String phoneNumber;
  final String password;

  const AuthSignInEvent(this.phoneNumber, this.password);
}

class AuthSignUpEvent extends AuthEvent {
  final String fullName;
  final String phoneNumber;
  final String password;

  const AuthSignUpEvent(this.fullName, this.phoneNumber, this.password);
}

class AuthGetPrefUserInfoEvent extends AuthEvent {}

class AuthSignOutEvent extends AuthEvent {}
