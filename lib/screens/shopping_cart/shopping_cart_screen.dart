import 'package:basic_project/screens/shopping_cart/db/sql_db.dart';
import 'package:basic_project/screens/shopping_cart/models/cart_item_model.dart';
import 'package:basic_project/screens/shopping_cart/models/shopping_error.dart';
import 'package:basic_project/screens/shopping_cart/widgets/add_to_cart.dart';
import 'package:basic_project/shared/shared_bloc/shared_bloc.dart';
import 'package:basic_project/widgets/error_notification.dart';
import 'package:basic_project/widgets/flush_message.dart';
import 'package:basic_project/widgets/no_data.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import 'shopping_cart_export.dart';

class ShoppingCartScreen extends StatefulWidget {
  static const String routeName = "/shopping_cart_screen";

  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  void initState() {
    shoppingBloc.add(ShoppingCartGetData());
    super.initState();
  }

  GlobalKey key = GlobalKey();
  List<Products> products = [];
  bool started = false;
  double total = 0.0;
  bool error = false;
  ShoppingCartBloc createOrder = ShoppingCartBloc();
  ShoppingCartBloc shoppingBloc = ShoppingCartBloc();
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocListener<SharedBloc, SharedState>(
        listener: (context, state) {
          if (state is AddToCartState) {
            setState(() {});
            shoppingBloc.add(ShoppingCartGetData());
          }
          if (state is ResetCartState) {
            setState(() {});
            shoppingBloc.add(ShoppingCartGetData());
          }
        },
        child: FutureBuilder<List<Products>>(
          future: CartDB.privateConstructor().getAllItems(),
          key: key,
          builder: (context, snapshot) {
            if (snapshot.data?.isEmpty ?? true) {
              return noData(Theme.of(context).textTheme.bodyText2!.color!);
            } else {
              return BlocListener<SharedBloc, SharedState>(
                listener: (context, state) {
                  if (state is CartAddState) {
                    setState(() {
                      total += state.price;
                    });
                  }
                  if (state is CartSubState) {
                    setState(() {
                      total -= state.price;
                    });
                  }
                },
                child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
                  bloc: shoppingBloc,
                  builder: (context, state) {
                    if (state.status.errorMessage == "1420") {
                      started = false;
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        if (!error) {
                          showErrorMessageFlushNoCode(context,
                              "المنتجات التي تمت الإشارة اليها ليست متوفرة حاليا يرجى حذفها حتى تستطيع اكمال العملية");
                          error = true;
                        }
                      });
                    }
                    if (state.status.inProgress == true) {
                      started = false;
                      error = false;
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.status.failure == true &&
                        state.status.errorMessage != "1420") {
                      started = false;
                      return Center(
                        child: Container(
                          child: errorNotification(
                              context, state.status.errorMessage ?? "", () {
                            setState(() {});
                            context
                                .read<ShoppingCartBloc>()
                                .add(ShoppingCartGetData());
                          }),
                        ),
                      );
                    } else if (state.status.success == true ||
                        state.status.errorMessage == "1420") {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        if (!started) {
                          setState(() {
                            total = state.cartItemModel.data?.totalPrice
                                    ?.toDouble() ??
                                0.0;
                          });
                          started = true;
                        }
                      });
                      return Scaffold(
                        appBar: AppBar(
                          toolbarHeight: 70,
                          title: Text(
                            S.of(context).cart,
                          ),
                        ),
                        body: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: snapshot.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    List<String> ids = [];
                                    List<Args> args =
                                        state.shoppingError?.args ?? [];
                                    for (var a in args) {
                                      ids.add(a.value ?? "");
                                    }
                                    return ShoppingCartWidget(
                                        products:
                                            snapshot.data?[index] ?? Products(),
                                        available: state.shoppingError == null
                                            ? true
                                            : !ids.contains(snapshot
                                                .data![index].id
                                                .toString()));
                                  }),
                            ),
                          ],
                        ),
                        bottomNavigationBar: state.status.errorMessage == "1420"
                            ? const SizedBox()
                            : Container(
                                height: 110.0,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 14.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          S.of(context).total,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                        const SizedBox(width: 10.0),
                                        Text(
                                          total.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                        Text(
                                          ' ر.س',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10.0),
                                    const AddToCartButton()
                                  ],
                                ),
                              ),
                      );
                    } else {
                      started = false;
                      return const SizedBox();
                    }
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
