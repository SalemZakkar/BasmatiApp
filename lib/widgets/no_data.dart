import 'package:flutter/material.dart';

Widget noData(Color color) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.not_interested_sharp,
          color: color,
          size: 45,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "لا يوجد بيانات",
          style: TextStyle(
              color: color,
              fontSize: 22,
              decoration: TextDecoration.none,
              fontFamily: 'Cairo'),
        )
      ],
    ),
  );
}
