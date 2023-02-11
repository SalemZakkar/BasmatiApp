import 'package:basic_project/screens/screens_export.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/text_field_holder.dart';

class ConfirmCodePage extends StatefulWidget {
  static const String routeName = "/confirmCode";
  const ConfirmCodePage({Key? key}) : super(key: key);

  @override
  State<ConfirmCodePage> createState() => _ConfirmCodePageState();
}

class _ConfirmCodePageState extends State<ConfirmCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(S.of(context).confirm_identity),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        //padding: const EdgeInsets.only(left: 20, right: 20),
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
                  "${S.of(context).we_send_code} 05012345678",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 24),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
              ),
              ListTile(
                title: Text(
                  S.of(context).confirm_code,
                  style: Theme.of(context).textTheme.headline1,
                ),
                subtitle: TextFieldHolder(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    textFormField: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText:
                              "${S.of(context).enter} ${S.of(context).confirm_code}"),
                    )),
              ),
              const SizedBox(height: 40),
              MyCustomButton(
                  customWidget: Text(
                    S.of(context).reset_password,
                    textScaleFactor: 0.9,
                    style: const TextStyle(color: Colors.white),
                  ),
                  height: 65,
                  width: 180,
                  color: Theme.of(context).primaryColor,
                  borderRadius: 22,
                  function: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        NavigationBarScreen.routeName, (route) => false);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
