import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/helper_export.dart';
import '../bloc_export.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  ServicesBloc()
      : super(const ServicesInitialState(
            isDark: false, languageIsEnglish: true)) {
    on<GetServicesPrefEvent>(_getServicesPrefEvent);
    on<ChangeModeThemeEvent>(_changeModeThemeEvent);
    on<ChangeLanguageEvent>(_changeLanguageEvent);
    on<ServicesEvent>(_servicesEvent);
  }

  void _setServicesPref({
    required bool isDark,
    required bool languageIsEnglish,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime startTime = DateTime.now();
    try {
      await prefs.setBool("isDark", isDark);
      await prefs.setBool("languageIsEnglish", languageIsEnglish);
      printLog(
          stateID: '926582',
          data: "Set Services isDark and languageIsEnglish",
          isSuccess: true,
          startTime: startTime);
    } catch (error) {
      printLog(
          stateID: '529016',
          data: error.toString(),
          isSuccess: false,
          startTime: startTime);
      rethrow;
    }
  }

  _getServicesPrefEvent(
      GetServicesPrefEvent event, Emitter<ServicesState> emit) async {
    DateTime startTime = DateTime.now();
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? isDark = prefs.getBool("isDark");
    bool? languageIsEnglish = prefs.getBool("languageIsEnglish");

    isDark ??= false;
    languageIsEnglish ??= true;

    printLog(
        stateID: '386105',
        data: "get Services isDark and languageIsEnglish",
        isSuccess: true,
        startTime: startTime);

    emit(GetServicesState(
      isDark: isDark,
      languageIsEnglish: languageIsEnglish,
    ));
  }

  _changeModeThemeEvent(
      ChangeModeThemeEvent event, Emitter<ServicesState> emit) {
    bool isDark = state.isDark == true ? false : true;

    _setServicesPref(
        isDark: isDark, languageIsEnglish: state.languageIsEnglish);
    emit(ChangeThemeModeState(
      isDark: isDark,
      languageIsEnglish: state.languageIsEnglish,
    ));
  }

  _changeLanguageEvent(ChangeLanguageEvent event, Emitter<ServicesState> emit) {
    bool language = state.languageIsEnglish == true ? false : true;
    _setServicesPref(isDark: state.isDark, languageIsEnglish: language);
    emit(ChangeLanguageState(
      isDark: state.isDark,
      languageIsEnglish: language,
    ));
  }

  _servicesEvent(ServicesEvent event, Emitter<ServicesState> emit) async {}
}
