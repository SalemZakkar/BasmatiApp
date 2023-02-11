import 'package:basic_project/config/bloc_export.dart';
import 'package:basic_project/screens/shopping_cart/db/sql_db.dart';
import 'package:basic_project/shared/shared_bloc/shared_bloc.dart';
import 'package:basic_project/widgets/widgets_export.dart';
import 'package:flutter/material.dart';

import '../../order/purchase_history_screen.dart';
import '../bloc/shopping_cart_bloc.dart';

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({Key? key}) : super(key: key);

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  ShoppingCartBloc bloc = ShoppingCartBloc();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ShoppingCartBloc, ShoppingCartState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is SaveOrderState &&
            state.saveOrderStateStatus.inProgress == true) {
          myCustomShowLoadingDialog(context);
        }
        if (state is SaveOrderState &&
            state.saveOrderStateStatus.success == true) {
          myCustomKillLoadingDialog(context);
          CartDB.privateConstructor().clear();
          context.read<SharedBloc>().add(ResetCart());
          Navigator.pushReplacementNamed(
              context, PurchaseHistoryScreen.routeName,
              arguments: state.idOrder);
        }
        if (state is SaveOrderState &&
            state.saveOrderStateStatus.failure == true) {
          if (state.saveOrderStateStatus.errorMessage == "1420") {
            myCustomKillLoadingDialog(context);
            context.read<SharedBloc>().add(ResetCart());
          } else {
            myCustomKillLoadingDialog(context,
                code: state.saveOrderStateStatus.errorMessage ?? "999");
          }
        }
      },
      child: MyCustomButton(
          customWidget: const Text(
            "إنشاء طلب",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          height: 50.0,
          width: 200.0,
          color: Theme.of(context).primaryColor,
          borderRadius: 13.0,
          function: () {
            bloc.add(const SaveOrderEvent());
          }),
    );
  }
}
