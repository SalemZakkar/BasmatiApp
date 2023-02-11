import 'package:basic_project/screens/order/bloc/order_bloc.dart';
import 'package:basic_project/screens/order/order_details_subscription.dart';
import 'package:basic_project/screens/shopping_cart/shopping_cart_export.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/global_widget.dart';

class PayButton extends StatefulWidget {
  final String id;
  const PayButton({Key? key, required this.id}) : super(key: key);

  @override
  State<PayButton> createState() => _PayButtonState();
}

class _PayButtonState extends State<PayButton> {
  OrderBloc bloc = OrderBloc();
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: BlocListener<OrderBloc, OrderState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.wait == true) {
              myCustomShowLoadingDialog(context);
            }
            if (state.success == true) {
              myCustomKillLoadingDialog(context);
              Navigator.pushReplacementNamed(
                  context, OrderDetailsSubscription.routeName,
                  arguments: state.oId);
            }
            if (state.fail == true) {
              myCustomKillLoadingDialog(context,
                  code: state.errorCode ?? "999");
            }
          },
          child: MyCustomButton(
            height: 40,
            width: 120,
            color: Theme.of(context).primaryColor,
            borderRadius: 22,
            customWidget: const Text(
              "شراء",
              style: TextStyle(color: Colors.white),
            ),
            function: () {
              bloc.add(Subscribe(id: widget.id));
            },
          ),
        ));
  }
}
