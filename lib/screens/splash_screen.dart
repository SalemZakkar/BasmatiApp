import 'dart:async';

import 'package:basic_project/helper/helper_export.dart';
import 'package:basic_project/screens/authentication/sign_in.dart';
import 'package:basic_project/shared/web_services_export.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import 'authentication/authentication_export.dart';
import 'screens_export.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showLogIn = false;

  Future<void> startTime() async {
    Timer(const Duration(seconds: 3), (() async {
      await Navigator.pushReplacementNamed(
          context, AuthenticationScreen.routeName);
    }));
  }

  startApp() async {
    WebConnection();
    // tz.initializeTimeZones();
    // await NotificationServices().initNotification();
  }

  @override
  initState() {
    startApp();
    super.initState();
  }

  bool pressed = false;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.stateStatusSingIn.inProgress == true) {
          setState(() {
            loading = true;
          });
        } else {
          setState(() {
            loading = false;
          });
        }
        if (state is AuthGetPrefUserInfoState) {
          if (state.customUserInfo.phoneNumber != null) {
            context.read<AuthBloc>().add(AuthSignInEvent(
                state.customUserInfo.phoneNumber.toString(),
                state.customUserInfo.password.toString()));
          } else {
            showLogIn = true;
            setState(() {});
          }
        }
        if (state is AuthSignInState &&
            state.stateStatusSingIn.success == true) {
          Navigator.of(context)
              .pushReplacementNamed(NavigationBarScreen.routeName);
        }
        if (state is AuthSignInState &&
            state.stateStatusSingIn.failure == true) {
          showLogIn = true;
          setState(() {});
        }
      },
      builder: (context, state) {
        if (state is AuthInitial) {
          context.read<AuthBloc>().add(AuthGetPrefUserInfoEvent());
        }
        if (state is AuthSignOutState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showLogIn = true;
            setState(() {});
          });
        }
        return Scaffold(
          key: _scaffoldKey,
          body: Container(
            constraints: const BoxConstraints.expand(),
            color: Theme.of(context).primaryColor,
            child: Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Image.asset(
                    AppAssets.backgroundImage,
                    fit: BoxFit.cover,
                  ),
                ),
                AnimatedPositioned(
                  top: size.height * (pressed ? 0.1 : 0.45),
                  right: size.width * 0.2,
                  duration: const Duration(milliseconds: 400),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).welcome,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                        textScaleFactor: 1,
                      ),
                      Text(S.of(context).app_name,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 40),
                          textScaleFactor: 1)
                    ],
                  ),
                ),
                Positioned(
                  bottom: size.height / 7,
                  right: size.width / 2 - 75,
                  left: size.width / 2 - 75,
                  child: loading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, NavigationBarScreen.routeName);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                height: 60,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: pressed
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(22)),
                                alignment: Alignment.center,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: AnimatedDefaultTextStyle(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!,
                                      child: Text(
                                        S.of(context).start_shopping,
                                        style: const TextStyle(
                                            fontFamily: "Cairo"),
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              child: const Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline),
                              ),
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    SignInPage.routeName, (route) => false);
                              },
                            )
                          ],
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
