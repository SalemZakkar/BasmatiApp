import 'package:flutter/material.dart';

import '../screens/authentication/sign_in.dart';

Widget unAuth(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.perm_identity,
          color: Theme.of(context).primaryColor,
          size: 55,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "لم تتم عملية تسجيل الدخول",
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, SignInPage.routeName);
          },
          child: Container(
            width: 125,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(22)),
            child: const Text(
              "تسجيل الدخول",
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
          ),
        )
      ],
    ),
  );
}
