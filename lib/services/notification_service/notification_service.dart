import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../helper/print_log.dart';

class NotificationService {
  static void initMessages() async {
    initBgMsg();
  }

  static Future<String?> getDeviceToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    printLog(data: token, isSuccess: true, stateID: "GET DEVICE TOKEN");
    return token;
  }

  static Future<void> backgroundHandler(RemoteMessage msg) async {
    await Firebase.initializeApp();
    debugPrint('Got MSG ${msg.data}');
  }

  static void initBgMsg() {
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  }

  static Stream msgStream() {
    return FirebaseMessaging.onMessage;
  }
}
