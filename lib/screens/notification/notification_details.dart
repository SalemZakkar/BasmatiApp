import 'package:flutter/material.dart';

import 'model/notification_model.dart';

class NotificationDetailsScreen extends StatefulWidget {
  static const String routeName = "/notificationDetails";
  final NotificationData notificationData;
  const NotificationDetailsScreen({Key? key, required this.notificationData})
      : super(key: key);

  @override
  State<NotificationDetailsScreen> createState() =>
      _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text("إشعار"),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  widget.notificationData.title.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 25, overflow: TextOverflow.clip),
                ),
                subtitle: Text(widget.notificationData.body.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 20),
                    overflow: TextOverflow.clip),
              )
            ],
          ),
        ),
      ),
    );
  }
}
