import 'package:basic_project/helper/support_app.dart';
import 'package:basic_project/screens/order/models/subscribe_log_model.dart';
import 'package:basic_project/screens/order/order_details_subscription.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class SubscribeLogCard extends StatelessWidget {
  final SubscribeLogData data;
  const SubscribeLogCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, OrderDetailsSubscription.routeName,
              arguments: data.id);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          width: size.width * 0.9,
          height: 70,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12)),
          alignment: Alignment.center,
          child: Row(
            children: [
              Text(
                data.subscription!.name.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 19),
              ),
              const Expanded(
                  child: SizedBox(
                width: 2,
              )),
              Text(
                  getDate(intl.DateFormat("yyyy-MM-dd", "en")
                      .parse(data.createdAt!)),
                  textDirection: TextDirection.ltr,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}
