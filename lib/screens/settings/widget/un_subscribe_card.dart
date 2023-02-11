import 'package:basic_project/screens/subscriptions/subscription_screen.dart';
import 'package:flutter/material.dart';

class UnSubscribeCard extends StatefulWidget {
  const UnSubscribeCard({Key? key}) : super(key: key);

  @override
  State<UnSubscribeCard> createState() => _UnSubscribeCardState();
}

class _UnSubscribeCardState extends State<UnSubscribeCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SubscriptionScreen.routeName);
      },
      child: Container(
          width: size.width * 0.9,
          height: 135,
          decoration: BoxDecoration(
            color: Colors.red.shade900,
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
                "أنت الآن",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 22, fontWeight: FontWeight.w300),
                textScaleFactor: 0.7,
              ),
              Row(
                children: [
                  Text(
                    "غير مشترك",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 25),
                    textScaleFactor: 0.7,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // Text("100 ريال كل شهر" , style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14),textScaleFactor: 0.8,),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "اضعط للمزيد من المعلومات والإشتراك",
                    style: Theme.of(context).textTheme.bodyText1,
                    textScaleFactor: 0.7,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  //  Text("2222/22/22" , style: Theme.of(context).textTheme.bodyText1,textScaleFactor: 0.8,)
                ],
              )
            ],
          )),
    );
  }
}
