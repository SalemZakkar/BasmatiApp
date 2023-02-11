import 'package:basic_project/helper/helper_export.dart';
import 'package:basic_project/screens/shopping_cart/db/sql_db.dart';
import 'package:basic_project/screens/shopping_cart/models/cart_item_model.dart';
import 'package:basic_project/screens/shopping_cart/shopping_cart_export.dart';
import 'package:basic_project/shared/shared_bloc/shared_bloc.dart';
import 'package:flutter/material.dart';

class ShoppingCartWidget extends StatefulWidget {
  final Products products;
  final bool available;
  const ShoppingCartWidget(
      {Key? key, required this.products, required this.available})
      : super(key: key);
  @override
  State<ShoppingCartWidget> createState() => _ShoppingCartWidgetState();
}

class _ShoppingCartWidgetState extends State<ShoppingCartWidget> {
  late int qty;
  @override
  void initState() {
    qty = widget.products.qty?.toInt() ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // qty = widget.products.qty?.toInt() ?? 0;
    return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
        height: 120.0,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          leading: InkWell(
            child: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onTap: () {
              CartDB.privateConstructor().delete(widget.products.id.toString());
              context.read<SharedBloc>().add(AddToCart());
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.products.name.toString(),
                style: const TextStyle(fontSize: 23),
              ),
              (widget.available == false
                  ? const Icon(
                      Icons.close,
                      color: Colors.red,
                    )
                  : const SizedBox()),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    printLog(stateID: "795393", data: "+", isSuccess: true);
                    context.read<SharedBloc>().add(CartAdd(
                        price: widget.products.price?.toDouble() ?? 0.0));
                    setState(() {
                      qty++;
                    });
                    CartDB.privateConstructor()
                        .updateQty(widget.products.id ?? "", qty);
                  },
                  child: const Icon(Icons.add_circle_outline)),
              const SizedBox(width: 5.0),
              Text(
                qty.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 23),
              ),
              const SizedBox(width: 5.0),
              GestureDetector(
                  onTap: () {
                    printLog(stateID: "080923", data: "-", isSuccess: true);
                    if (qty > 1) {
                      context.read<SharedBloc>().add(CartSub(
                          price: widget.products.price?.toDouble() ?? 0.0));
                      setState(() {
                        qty--;
                      });
                    }
                    CartDB.privateConstructor()
                        .updateQty(widget.products.id ?? "", qty);
                  },
                  child: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red,
                  )),
            ],
          ),
          subtitle: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.products.price} ر.س",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "الضمان: ${calcWarranty(widget.products.warranty)}",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(),
              const Spacer(),
            ],
          ),
        ));
  }
}

String calcWarranty(WarrantyShopping? warranty) {
  if (warranty == null || warranty.value == 0) {
    return "لا يوجد";
  }
  String war = "";
  if (warranty.value! >= 12) {
    int years = (warranty.value! / 12).floor();
    war += "$years سنة ";
  }
  if (warranty.value! % 12 != 0) {
    int month = (warranty.value! % 12).floor();
    war += "$month أشهر ";
  }
  return war;
}
