import 'package:basic_project/screens/settings/bloc_export.dart';
import 'package:basic_project/services/notification_service/notification_service.dart';
import 'package:basic_project/shared/shared_bloc/shared_bloc.dart';
import 'package:basic_project/shared/web_services_export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/bloc_export.dart';
import 'config/config_export.dart';
import 'generated/l10n.dart';
import 'screens/authentication/authentication_export.dart';
import 'screens/navigation_bar/navigation_bar_export.dart';
import 'screens/splash_screen.dart';

/// run in background for notification

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// Start Other Bloc Provider
        BlocProvider<ServicesBloc>(
            create: (BuildContext context) => ServicesBloc()),
        BlocProvider<NavigationBarBloc>(
            create: (BuildContext context) => NavigationBarBloc()),
        BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc()),
        BlocProvider<SettingsBloc>(
            create: (BuildContext context) => SettingsBloc()),
        BlocProvider<SharedBloc>(
          create: (context) => SharedBloc(),
        ),
      ],
      child: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          if (state is ServicesInitialState) {
            context.read<ServicesBloc>().add(GetServicesPrefEvent());
            return const Center();
          }
          return MaterialApp(
            builder: (context, child) {
              final MediaQueryData data = MediaQuery.of(context);
              return MediaQuery(
                  data: data.copyWith(textScaleFactor: 0.8), child: child!);
            },
            locale: const Locale.fromSubtags(languageCode: "ar"),
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            title: 'Basmati App',
            debugShowCheckedModeBanner: false,
            theme: state.isDark ? darkTheme : lightTheme,
            onGenerateRoute: AppRouter.onGenerateRoute,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}

Future<void> init() async {
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBR14Iu3Szsb41ODOSLWvZKCdwypjLui6c",
          appId: "1:728388486380:android:32c37905640e839d8291c9",
          messagingSenderId: "728388486380",
          projectId: "basmati-ee95b"));
  MyHttpOverrides();
  NotificationService.initMessages();
}
