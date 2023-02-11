part of 'call_us_bloc.dart';

abstract class CallUsEvent extends Equatable {
  const CallUsEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetAboutUsEvent extends CallUsEvent {}
