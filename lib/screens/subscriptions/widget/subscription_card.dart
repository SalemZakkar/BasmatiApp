import 'package:basic_project/screens/subscriptions/model/subsription_model.dart';
import 'package:basic_project/screens/subscriptions/subscription_details.dart';
import 'package:flutter/material.dart';

class SubscriptionCard extends StatefulWidget {
  final SubscriptionData data;
  const SubscriptionCard({Key? key, required this.data}) : super(key: key);

  @override
  State<SubscriptionCard> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () {
          Navigator.pushNamed(context, SubscriptionDetails.routeName,
              arguments: widget.data.id);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 80,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(22)),
          alignment: Alignment.center,
          child: ListTile(
            title: Text(widget.data.name.toString()),
            subtitle: getPrice(widget.data.price!.toDouble(),
                widget.data.discount?.toDouble(), context),
            trailing: const Icon(Icons.arrow_forward),
          ),
        ),
      ),
    );
  }
}

Widget getPrice(double price, double? discount, context) {
  if (discount == null || discount == 0) {
    return Row(
      children: [
        Text(
          price.toString(),
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(
          width: 5,
        ),
        Text("ر.س", style: Theme.of(context).textTheme.bodyText2)
      ],
    );
  }
  return Row(
    children: [
      Text(
        price.toString(),
        style: const TextStyle(
            color: Colors.red, decoration: TextDecoration.lineThrough),
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        discount.toString(),
        style: Theme.of(context).textTheme.bodyText2,
      ),
      const SizedBox(
        width: 5,
      ),
      Text("ر.س", style: Theme.of(context).textTheme.bodyText2)
    ],
  );
}
