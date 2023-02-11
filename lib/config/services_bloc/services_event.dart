part of 'services_bloc.dart';

abstract class ServicesEvent extends Equatable {
  const ServicesEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeModeThemeEvent extends ServicesEvent {
  const ChangeModeThemeEvent();
}

class ChangeLanguageEvent extends ServicesEvent {
  const ChangeLanguageEvent();
}

class GetServicesPrefEvent extends ServicesEvent {}
