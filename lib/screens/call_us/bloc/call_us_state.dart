part of 'call_us_bloc.dart';

abstract class CallUsState extends Equatable {
  final StateStatus stateStatusGetAboutUs;
  final AboutUs aboutUs;

  const CallUsState(
      {required this.stateStatusGetAboutUs, required this.aboutUs});

  @override
  List<Object> get props => [stateStatusGetAboutUs, aboutUs];
}

class CallUsInitial extends CallUsState {
  const CallUsInitial(
      {required super.stateStatusGetAboutUs, required super.aboutUs});
}

class GetAboutUsState extends CallUsState {
  const GetAboutUsState(
      {required super.stateStatusGetAboutUs, required super.aboutUs});
}
