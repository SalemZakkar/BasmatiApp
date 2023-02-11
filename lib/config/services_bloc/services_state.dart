part of 'services_bloc.dart';

abstract class ServicesState extends Equatable {
  final bool isDark;
  final bool languageIsEnglish;

  const ServicesState({
    required this.isDark,
    required this.languageIsEnglish,
  });

  @override
  List<Object> get props => [isDark, languageIsEnglish];
}

class ServicesInitialState extends ServicesState {
  const ServicesInitialState({
    required super.isDark,
    required super.languageIsEnglish,
  });
}

class ChangeThemeModeState extends ServicesState {
  const ChangeThemeModeState({
    required super.isDark,
    required super.languageIsEnglish,
  });
}

class ChangeLanguageState extends ServicesState {
  const ChangeLanguageState({
    required super.isDark,
    required super.languageIsEnglish,
  });
}

class GetServicesState extends ServicesState {
  const GetServicesState({
    required super.isDark,
    required super.languageIsEnglish,
  });
}
