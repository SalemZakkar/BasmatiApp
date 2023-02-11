import 'package:basic_project/screens/home/models/product_by_criteria.dart';
import 'package:basic_project/widgets/image_holder.dart';
import 'package:flutter/material.dart';

import '../../items/item_screen.dart';

class MyCustomOverCategoryWidget extends StatelessWidget {
  final ProductMainInfo data;
  const MyCustomOverCategoryWidget({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ItemScreen.routeName,
            arguments: ItemScreen(id: data.id ?? "0"));
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(left: 15.0),
        height: 150.0,
        width: 160.0,
        decoration: BoxDecoration(
          color: Theme.of(context).textTheme.caption!.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Container(
                height: 116.0,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: imageHolder(data.image)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  data.name.toString(),
                  style: Theme.of(context).textTheme.headline2,
                  textScaleFactor: 0.8,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  (data.fullPrice).toString(),
                  style: data.price == null || data.price == 0
                      ? TextStyle(
                          color: Theme.of(context).textTheme.headline2!.color,
                        )
                      : const TextStyle(
                          color: Colors.red,
                          // fontSize: 20,
                          decoration: TextDecoration.lineThrough),
                ),
                const SizedBox(
                  width: 4,
                ),
                data.price == null || data.price == 0
                    ? const SizedBox()
                    : Text(
                        data.price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline2!.color,
                        ),
                      ),
                const SizedBox(
                  width: 4,
                ),
                Text(' ر.س ',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 15,
                        color: Theme.of(context).textTheme.headline2!.color)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
