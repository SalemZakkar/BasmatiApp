import 'package:another_flushbar/flushbar.dart';
import 'package:basic_project/helper/error_message.dart';
import 'package:basic_project/screens/navigation_bar/navigation_bar_export.dart';
import 'package:basic_project/screens/screens_export.dart';
import 'package:flutter/material.dart';

void showErrorMessageFlush(BuildContext context, String code) {
  Flushbar(
    title: "حدث خطأ  " "($code)",
    backgroundColor: Theme.of(context).errorColor,
    flushbarPosition: FlushbarPosition.BOTTOM,
    borderRadius: BorderRadius.circular(25),
    message: errorParse(code),
    messageSize: 20,
    duration: const Duration(seconds: 3),
    flushbarStyle: FlushbarStyle.FLOATING,
    maxWidth: 300,
    margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width - 330, bottom: 5),
  ).show(context);
}

void showErrorMessageFlushNoCode(BuildContext context, String msg) {
  Flushbar(
    title: "حدث خطأ",
    backgroundColor: Theme.of(context).errorColor,
    flushbarPosition: FlushbarPosition.BOTTOM,
    borderRadius: BorderRadius.circular(25),
    messageText: Text(
      msg,
      overflow: TextOverflow.clip,
      style: const TextStyle(color: Colors.white),
    ),
    messageSize: 20,
    duration: const Duration(seconds: 7),
    flushbarStyle: FlushbarStyle.FLOATING,
    maxWidth: 300,
    margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width - 330, bottom: 5),
  ).show(context);
}

void showSuccessMessageFlush(BuildContext context, String msg) {
  Flushbar(
    title: "تم",
    backgroundColor: Colors.green,
    flushbarPosition: FlushbarPosition.BOTTOM,
    borderRadius: BorderRadius.circular(25),
    message: msg,
    messageSize: 20,
    duration: const Duration(seconds: 3),
    flushbarStyle: FlushbarStyle.FLOATING,
    maxWidth: 300,
    margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width - 330, bottom: 5),
  ).show(context);
}

void showFlushNotify(BuildContext context) {
  Flushbar(
    //  title: "لديك إشعار جديد",
    backgroundColor: Colors.green,
    flushbarPosition: FlushbarPosition.TOP,
    borderRadius: BorderRadius.circular(25),
    onTap: (v) {
      context.read<NavigationBarBloc>().add(NavigationBarChangeEvent(3));
      Navigator.pushNamedAndRemoveUntil(
          context, NavigationBarScreen.routeName, (route) => false);
    },
    flushbarStyle: FlushbarStyle.FLOATING,
    message: "لديك إشعار جديد",
    maxWidth: 300,
    margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width - 330, bottom: 5),
  ).show(context);
}
