import 'package:basic_project/config/string_helpers.dart';
import 'package:basic_project/screens/settings/model/model_export.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SubscribeCard extends StatefulWidget {
  final SubscriptionSettings subscription;
  const SubscribeCard({Key? key, required this.subscription}) : super(key: key);

  @override
  State<SubscribeCard> createState() => _SubscribeCardState();
}

class _SubscribeCardState extends State<SubscribeCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.9,
        height: 135,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.topRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "أنت الآن تستخدم",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 22, fontWeight: FontWeight.w300),
              textScaleFactor: 0.7,
            ),
            Row(
              children: [
                Text(
                  "إشتراك مدفوع",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 25),
                  textScaleFactor: 0.7,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.subscription.name.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 14),
                  textScaleFactor: 0.7,
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "صالح حتى",
                  style: Theme.of(context).textTheme.bodyText1,
                  textScaleFactor: 0.7,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  getTime(DateFormat("yyyy-MM-dd", "en")
                      .parse(widget.subscription.expiresAt?.toString() ?? "")),
                  style: Theme.of(context).textTheme.bodyText1,
                  textScaleFactor: 0.7,
                )
              ],
            )
          ],
        ));
  }
}
