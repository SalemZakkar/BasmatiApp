// import 'package:firebase_messaging/firebase_messaging.dart';

import 'dart:async';

import 'package:basic_project/screens/notification/notification_screen.dart';
import 'package:basic_project/services/notification_service/notification_service.dart';
import 'package:basic_project/shared/shared_bloc/shared_bloc.dart';
import 'package:basic_project/widgets/flush_message.dart';
import 'package:flutter/material.dart';

import '../../helper/print_log.dart';
import '../screens_export.dart';
import 'navigation_bar_export.dart';

class NavigationBarScreen extends StatefulWidget {
  static const String routeName = '/mainScreen';

  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  static List mainScreen = [
    const CallUsScreen(),
    const HomeScreen(),
    const SettingsPage(),
    const NotificationScreen(),
  ];
  late StreamSubscription msgStream;

  ///Request Permission for Notifications
  Future requestPermission() async {
    // FirebaseMessaging messaging = FirebaseMessaging.instance;

    // await messaging.requestPermission(
    //   alert: true,
    //   announcement: false,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: false,
    //   sound: true,
    // );
  }
  int page = 0;
  @override
  void initState() {
    msgStream = NotificationService.msgStream().listen((event) {
      printLog(stateID: "GOT NEW MSG", data: event.toString(), isSuccess: true);
      if (page != 3) {
        showFlushNotify(context);
      } else {
        context.read<SharedBloc>().add(NotifyFetch());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    msgStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
      builder: (context, state) {
        page = state.indexScreen;
        requestPermission();
        return Scaffold(
          body: mainScreen[state.indexScreen],
          bottomNavigationBar: BottomAppBar(
            color: Theme.of(context).cardColor,
            child: SizedBox(
              height: 50.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      flex: 2,
                      child: _myCustomButtonNavBar(
                          context: context,
                          iconType: Icons.info_outline,
                          screenNumber: 0)),
                  Expanded(
                      flex: 2,
                      child: _myCustomButtonNavBar(
                          context: context,
                          iconType: Icons.shopping_cart_outlined,
                          screenNumber: 1)),
                  Expanded(
                      flex: 2,
                      child: _myCustomButtonNavBar(
                          context: context,
                          iconType: Icons.notifications,
                          screenNumber: 3)),
                  Expanded(
                      flex: 2,
                      child: _myCustomButtonNavBar(
                          context: context,
                          iconType: Icons.settings,
                          screenNumber: 2)),
                  // Expanded(
                  //     flex: 2,
                  //     child: _myCustomButtonNavBar(
                  //         context: context,
                  //         iconType: Icons.person,
                  //         screenNumber: 3)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _myCustomButtonNavBar({
    required BuildContext context,
    required iconType,
    required int screenNumber,
  }) {
    return GestureDetector(
      onTap: () {
        context
            .read<NavigationBarBloc>()
            .add(NavigationBarChangeEvent(screenNumber));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.maxFinite,
              color: Theme.of(context).cardColor,
              child: Icon(
                iconType,
                color: context.read<NavigationBarBloc>().state.indexScreen ==
                        screenNumber
                    ? Theme.of(context).primaryColor
                    : Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
