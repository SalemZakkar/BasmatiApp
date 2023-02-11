import 'package:basic_project/helper/helper_export.dart';
import 'package:basic_project/screens/settings/bloc_export.dart';
import 'package:basic_project/screens/shopping_cart/db/sql_db.dart';
import 'package:basic_project/shared/shared_bloc/shared_bloc.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/shadow_widget.dart';
import '../shopping_cart_screen.dart';

class CartButton extends StatefulWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  int n = 0;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SharedBloc, SharedState>(
      listener: (context, state) {
        if (state is AddToCartState) {
          setState(() {});
        }
        if (state is ResetCartState) {
          setState(() {});
        }
      },
      child: Stack(
        children: [
          MyCustomButton(
              customWidget: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              height: 40,
              width: 40,
              color: Theme.of(context).primaryColor,
              borderRadius: 15.0,
              function: () async {
                printLog(
                    stateID: "524309", data: "shop on tap", isSuccess: true);
                Navigator.of(context).pushNamed(ShoppingCartScreen.routeName);
              }),
          Positioned(
            right: 34.0,
            bottom: 34.0,
            child: myCustomShadowBall(
              widget: FutureBuilder<int>(
                future: CartDB.instance.getCount(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    );
                  } else {
                    return const Text(
                      "",
                      style:
                          TextStyle(fontSize: 8.0, fontWeight: FontWeight.bold),
                    );
                  }
                },
              ),
              color: Colors.white,
              sizeBall: 16,
            ),
          ),
        ],
      ),
    );
  }
}
