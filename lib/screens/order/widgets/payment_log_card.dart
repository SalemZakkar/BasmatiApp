import 'package:basic_project/helper/support_app.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../models/order_log_model.dart';
import '../purchase_history_screen.dart';

class PaymentLogCard extends StatefulWidget {
  final OrderLogData data;
  const PaymentLogCard({Key? key, required this.data}) : super(key: key);

  @override
  State<PaymentLogCard> createState() => _PaymentLogCardState();
}

class _PaymentLogCardState extends State<PaymentLogCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        Navigator.pushNamed(context, PurchaseHistoryScreen.routeName,
            arguments: widget.data.id);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        child: Container(
          width: size.width * 0.9,
          height: 100,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12)),
          alignment: Alignment.center,
          child: ListTile(
            title: Text(
              getDateWithHrs(intl.DateFormat("yyyy-MM-ddTHH:mm", "en")
                  .parse(widget.data.createdAt!)),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.data.totalPrice?.toString()}  ر.س  ",
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 19),
                ),
                Text(
                  "${widget.data.productsCount?.toInt().toString()} مشتريات",
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
