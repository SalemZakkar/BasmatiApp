import 'package:basic_project/screens/items/bloc/item_bloc.dart';
import 'package:basic_project/screens/items/models/item_details.dart';
import 'package:basic_project/screens/items/widget/images.dart';
import 'package:basic_project/screens/shopping_cart/db/sql_db.dart';
import 'package:basic_project/screens/shopping_cart/models/cart_item_model.dart';
import 'package:basic_project/screens/shopping_cart/shopping_cart_export.dart';
import 'package:basic_project/shared/shared_bloc/shared_bloc.dart';
import 'package:basic_project/widgets/error_notification.dart';
import 'package:basic_project/widgets/flush_message.dart';
import 'package:basic_project/widgets/widgets_export.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../helper/helper_export.dart';

class ItemScreen extends StatefulWidget {
  static const String routeName = "/itemScreen";
  final String id;
  const ItemScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  bool loaded = false;
  ItemBloc itemBloc = ItemBloc();
  ShoppingCartBloc shoppingCartBloc = ShoppingCartBloc();
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: MultiBlocListener(
        listeners: [
          BlocListener<ShoppingCartBloc, ShoppingCartState>(
            bloc: shoppingCartBloc,
            listener: (context, state) {
              if (state.status.success == true) {
                myCustomKillLoadingDialog(context);
                CartDB.privateConstructor().insert(
                    state.cartItemModel.data?.products?[0] ?? Products());
                showSuccessMessageFlush(context, "تم إضافة عنصر للسلة");
                context.read<SharedBloc>().add(AddToCart());
              }
              if (state.status.failure == true) {
                myCustomKillLoadingDialog(context,
                    code: state.status.errorMessage);
              }
              if (state.status.inProgress == true) {
                myCustomShowLoadingDialog(context);
              }
            },
          )
        ],
        child: BlocBuilder<ItemBloc, ItemState>(
          bloc: itemBloc,
          builder: (context, state) {
            if (!loaded) {
              itemBloc.add(GetItemDetails(id: widget.id));
              loaded = true;
            }
            if (state.status.inProgress == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetItemDetailsState &&
                state.status.failure == true) {
              return errorNotification(context, state.status.errorMessage ?? "",
                  () {
                itemBloc.add(GetItemDetails(id: widget.id));
              });
            } else if (state.status.success == true &&
                state is GetItemDetailsState) {
              return Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(
                      color: Theme.of(context)
                          .primaryColor //change your color here
                      ),
                ),
                body: Container(
                  constraints: const BoxConstraints.expand(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        itemImages(state.itemDetailsData.images ?? []),
                        const SizedBox(height: 10.0),
                        Text(
                          state.itemDetailsData.name.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 19),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          state.itemDetailsData.description.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.clip,
                        ),
                        const SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: (loaded
                    ? Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: 135,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  (state.itemDetailsData.fullPrice).toString(),
                                  style: state.itemDetailsData.price == null ||
                                          state.itemDetailsData.price == 0
                                      ? TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .color,
                                          fontSize: 20)
                                      : const TextStyle(
                                          color: Colors.red,
                                          fontSize: 20,
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                state.itemDetailsData.price == null ||
                                        state.itemDetailsData.price == 0
                                    ? const SizedBox()
                                    : Text(
                                        state.itemDetailsData.price.toString(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .color,
                                            fontSize: 20),
                                      ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text('ر.س ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 20,
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .color)),
                                const Expanded(child: SizedBox()),
                                GestureDetector(
                                  onTap: () {
                                    printLog(
                                        stateID: "795393",
                                        data: "+",
                                        isSuccess: true);
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20.0),
                                Text(quantity.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                const SizedBox(width: 20.0),
                                GestureDetector(
                                  onTap: () {
                                    printLog(
                                        stateID: "080923",
                                        data: "-",
                                        isSuccess: true);
                                    if (quantity > 1) {
                                      setState(() {
                                        quantity--;
                                      });
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .color),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "الضمان",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  calcWarranty(state.itemDetailsData.warranty),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            MyCustom3DButtonWithText(
                              text: S.of(context).add_to_cart,
                              height: 55,
                              width: 180,
                              color: Theme.of(context).primaryColor,
                              borderRadius: 15,
                              function: () async {
                                shoppingCartBloc.add(ShoppingCartSave(
                                    id: widget.id, count: quantity));
                                //await CartDB.privateConstructor().clear();
                              },
                              shadowColor: Colors.transparent,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox()),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

String calcWarranty(Warranty? warranty) {
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
