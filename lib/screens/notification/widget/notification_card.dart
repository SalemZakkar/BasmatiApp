import 'package:basic_project/screens/notification/model/notification_model.dart';
import 'package:basic_project/screens/notification/notification_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationCard extends StatefulWidget {
  final NotificationData notificationData;
  const NotificationCard({Key? key, required this.notificationData})
      : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    DateTime date = DateFormat("yyyy-MM-dd", "en")
        .parse(widget.notificationData.createdAt.toString());
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () {
          Navigator.pushNamed(context, NotificationDetailsScreen.routeName,
              arguments: widget.notificationData);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(22)),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.9,
          height: 100,
          child: ListTile(
            title: Text(
              widget.notificationData.title.toString(),
              style: Theme.of(context).textTheme.headline1,
            ),
            subtitle: Text(
              "${date.year} / ${date.month} / ${date.day}",
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.pushNamed(
                    context, NotificationDetailsScreen.routeName,
                    arguments: widget.notificationData);
              },
            ),
          ),
        ),
      ),
    );
  }
}

String restrictFractionalSeconds(String dateTime) => dateTime
    .replaceFirstMapped(RegExp("(\\.\\d{6})\\d+"), (m) => m[1].toString());
