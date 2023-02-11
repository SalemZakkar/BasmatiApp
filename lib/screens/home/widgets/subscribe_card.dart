import 'package:flutter/material.dart';

import '../../subscriptions/subscription_screen.dart';

class SubscribeCardHome extends StatefulWidget {
  const SubscribeCardHome({Key? key}) : super(key: key);

  @override
  State<SubscribeCardHome> createState() => _SubscribeCardHomeState();
}

class _SubscribeCardHomeState extends State<SubscribeCardHome> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SubscriptionScreen.routeName);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 100,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(22),
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "تخفيضات بنسبة %80",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  "بالإضافة الى سحب نهاية الشهر",
                  style: Theme.of(context).textTheme.headline1!,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(50)),
                  alignment: Alignment.center,
                  child: const Text(
                    "اشترك الآن",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Text(
                  "اشتراك شهري",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
