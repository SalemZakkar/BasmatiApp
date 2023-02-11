import 'package:basic_project/config/themes/transitions.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: SlideUpTransitionBuilder(),
    TargetPlatform.iOS: SlideUpTransitionBuilder(),
  }),
  fontFamily: "Cairo",
  primaryColor: primaryColor,
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    titleTextStyle:
        TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'Cairo'),
    backgroundColor: Color(0xFF2C2D3D),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  errorColor: Colors.red,
  cardColor: card2,
  scaffoldBackgroundColor: const Color(0xFF2C2D3D),
  listTileTheme: const ListTileThemeData(iconColor: Colors.blueAccent),
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: Colors.blue,
    hintStyle: const TextStyle(color: Colors.grey),
    filled: true,
    fillColor: const Color(0xFF2C2D3D),

    contentPadding: const EdgeInsets.all(10),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white)),
    // UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF0566A5))),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white)),
    //     UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF0566A5))),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    ),
    //     UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF0566A5))),
  ),
  textSelectionTheme: TextSelectionThemeData(
      selectionColor: primaryColor.withOpacity(0.4),
      cursorColor: Colors.white,
      selectionHandleColor: primaryColor),
  dividerColor: Colors.white,
  radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all(Colors.blue)),
  textTheme: TextTheme(
    headline1:
        const TextStyle(color: Colors.blue, fontFamily: "Cairo", fontSize: 20),
    // headline2: TextStyle(color: Colors.black , fontFamily: "Cairo"),
    // headline3: TextStyle(color: Colors.grey , fontFamily: "Cairo"),
    headline2: const TextStyle(
        color: Colors.white,
        fontFamily: "Cairo",
        fontSize: 15,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w600),
    bodyText1: const TextStyle(
        color: Colors.white,
        fontFamily: "Cairo",
        overflow: TextOverflow.ellipsis),
    bodyText2: const TextStyle(
        color: Colors.white,
        fontFamily: "Cairo",
        overflow: TextOverflow.ellipsis),
    subtitle1: const TextStyle(
        color: Colors.white,
        fontFamily: "Cairo",
        overflow: TextOverflow.ellipsis),

    caption: TextStyle(color: card1, fontFamily: "Cairo"),
  ),
  iconTheme: const IconThemeData(color: Colors.blueAccent),
);
