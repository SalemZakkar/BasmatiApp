import 'package:basic_project/helper/support_app.dart';
import 'package:basic_project/screens/order/models/order_details_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class MyCustomPurchaseWidget extends StatelessWidget {
  final OrderProducts products;
  const MyCustomPurchaseWidget({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 14.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        title: Text(
          products.name.toString(),
          style: Theme.of(context).textTheme.headline2,
          textScaleFactor: 0.8,
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                Text("العدد",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 15)),
                const SizedBox(
                  width: 8,
                ),
                Text(products.qty.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Text("حالة الضمان : ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 15)),
                const SizedBox(
                  width: 8,
                ),
                Text("فعال",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
              ],
            ),
            Row(
              children: [
                Text("تاريخ انتهاء الضمان : ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 15)),
                const SizedBox(
                  width: 8,
                ),
                Text(
                    products.warrantyExpiresAt == null
                        ? "-"
                        : getDate(intl.DateFormat("yyyy-MM-dd", "en")
                            .parse(products.warrantyExpiresAt!)),
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${products.price.toString()} ر.س",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
