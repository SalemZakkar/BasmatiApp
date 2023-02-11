import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../helper/print_log.dart';
import 'services_export.dart';

class NotificationFireBaseCloudMessaging {
  /// SignUp Or SignIn
  Future<String?> getDeviceToken(bool autoSignIn) async {
    if (autoSignIn == true) {
      return null;
    } else {
      String? token;
      try {
        token = await FirebaseMessaging.instance.getToken() ?? "?";
      } catch (error) {
        printLog(stateID: '429813', data: error.toString(), isSuccess: false);
      }
      return token;
    }
  }

  /// Subscribe topic for all device
  void subscribeTopicAllDeviceToken() async {
    await FirebaseMessaging.instance
        .subscribeToTopic("alldevice")
        .then((value) {
      printLog(
        stateID: '541230',
        data: "done Subscribe To Topic allDevice",
        isSuccess: true,
      );
    }).catchError((error) {
      printLog(
        stateID: '502010',
        data: 'Error Subscribe To Topic allDevice',
        isSuccess: false,
      );
    });
  }

  /// Subscribe topic for Custom Token
  void subscribeTopicCustomToken(String topicName) async {
    await FirebaseMessaging.instance.subscribeToTopic(topicName).then((value) {
      printLog(
        stateID: '842049',
        data: "done Subscribe To Custom Topic $topicName",
        isSuccess: true,
      );
    }).catchError((error) {
      printLog(
        stateID: '920419',
        data: 'Error Subscribe To Custom Topic $topicName',
        isSuccess: false,
      );
    });
  }

  /// Unsubscribe topic for Custom Token
  void unsubscribeTopicCustomToken(String topicName) async {
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(topicName)
        .then((value) {
      printLog(
        stateID: '932061',
        data: "done Unsubscribe To Custom Topic $topicName",
        isSuccess: true,
      );
    }).catchError((error) {
      printLog(
        stateID: '104209',
        data: 'Error Unsubscribe To Custom Topic $topicName',
        isSuccess: false,
      );
    });
  }

  ///  Send Notification to other user
  Future<void> sendNotification(String token, String title, String body) async {
    // String token = await getOtherUserToken(uid);
    const String serverToken =
        'AAAAT6C7xpw:APA91bEY-wXBDR-kFGEdrmcUNIKcu-QU2M4xJjBpePyaTqb3dFHswd7muSWpBh2amON2J-OAcGNMcblBoK6JrcV9ysQV1Ln4qr9tONnJwR0635piseVi1rGBeynWiaC397zySwn7e2xD';
    final Uri customUri = Uri.parse("https://fcm.googleapis.com/fcm/send");
    await http.post(
      customUri,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': body,
            'title': title,
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': token,
        },
      ),
    );
  }

  /// if Open app is Run
  fireBaseOnMessageListen(BuildContext context) {
    FirebaseMessaging.onMessage.listen((event) async {
      printLog(
          stateID: '842943',
          data: '===== onMessage if Open app is Run =====',
          isSuccess: true);
      printLog(
          stateID: '521851',
          data: event.notification!.body.toString(),
          isSuccess: true);

      NotificationServices().showNotification(
          1,
          event.notification!.title.toString(),
          event.notification!.body.toString(),
          3);

      /// Write Code here
    });
  }

  /// if app in background
  fireBaseMessagingOnMessageOpenedApp(BuildContext context) {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      printLog(
          stateID: '420420',
          data: '===== onMessage if app in background =====',
          isSuccess: true);

      /// Write Code here
      // Navigator.of(context).pushNamed(UploadFileCloudStorage.routeName);
    });
  }

  /// if app is close
  Future<void> initMessage(BuildContext context) async {
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();

    if (message != null) {
      printLog(
          stateID: '020142',
          data: '===== onMessage if app is close =====',
          isSuccess: true);

      /// Write Code here
      // Navigator.of(context).pushNamed(StreamScreen.routeName);
    }
  }
}

// Replace with server token from firebase console settings.
// final String serverToken = '<Server-Token>';
// final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
//
// Future<Map<String, dynamic>> sendAndRetrieveMessage() async {
//   await firebaseMessaging.requestNotificationPermissions(
//     const IosNotificationSettings(sound: true, badge: true, alert: true, provisional: false),
//   );
//
//   await http.post(
//     'https://fcm.googleapis.com/fcm/send',
//     headers: <String, String>{
//       'Content-Type': 'application/json',
//       'Authorization': 'key=$serverToken',
//     },
//     body: jsonEncode(
//       <String, dynamic>{
//         'notification': <String, dynamic>{
//           'body': 'this is a body',
//           'title': 'this is a title'
//         },
//         'priority': 'high',
//         'data': <String, dynamic>{
//           'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//           'id': '1',
//           'status': 'done'
//         },
//         'to': await firebaseMessaging.getToken(),
//       },
//     ),
//   );
//
//   final Completer<Map<String, dynamic>> completer =
//   Completer<Map<String, dynamic>>();
//
//   firebaseMessaging.configure(
//     onMessage: (Map<String, dynamic> message) async {
//       completer.complete(message);
//     },
//   );
//
//   return completer.future;
// }
