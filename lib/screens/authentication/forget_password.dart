import 'package:basic_project/screens/authentication/confirm_code.dart';
import 'package:basic_project/widgets/text_field_holder.dart';
import 'package:basic_project/widgets/widgets_export.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class ForgetPasswordPage extends StatefulWidget {
  static const String routeName = "/forget_password";
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(S.of(context).reset_password),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.transparent,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  S.of(context).enter_data_to_send_confirm,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 23),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
              ),
              ListTile(
                title: Text(
                  S.of(context).phone_number,
                  style: Theme.of(context).textTheme.headline1,
                ),
                subtitle: TextFieldHolder(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    textFormField: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText:
                              "${S.of(context).enter} ${S.of(context).phone_number}"),
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              MyCustomButton(
                  customWidget: Text(
                    "${S.of(context).send} ${S.of(context).confirm_code}",
                    textScaleFactor: 1,
                    style: const TextStyle(color: Colors.white),
                  ),
                  height: 65,
                  width: 180,
                  color: Theme.of(context).primaryColor,
                  borderRadius: 22,
                  function: () {
                    Navigator.pushNamed(context, ConfirmCodePage.routeName);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
