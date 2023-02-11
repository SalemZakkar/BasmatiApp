import 'package:basic_project/screens/settings/confirm_code_phone.dart';
import 'package:basic_project/widgets/widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../generated/l10n.dart';
import '../../widgets/text_field_holder.dart';
import 'bloc_export.dart';

class ChangePhone extends StatefulWidget {
  static const String routeName = "/changePhone";

  const ChangePhone({Key? key}) : super(key: key);

  @override
  State<ChangePhone> createState() => _ChangePhoneState();
}

class _ChangePhoneState extends State<ChangePhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text("تعديل رقم الهاتف"),
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
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(9),
                      ],
                      decoration: InputDecoration(
                          suffix: const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text("966+"),
                          ),
                          hintText:
                              "${S.of(context).enter} ${S.of(context).phone_number} الجديد"),
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              BlocConsumer<SettingsBloc, SettingsState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is ChangePhoneNumberState &&
                      state.stateStatusChangePhoneNumber.inProgress == true) {
                    myCustomShowLoadingDialog(context);
                  }
                  if (state is ChangePhoneNumberState &&
                      state.stateStatusChangePhoneNumber.success == true) {
                    myCustomKillLoadingDialog(context);
                    context.read<SettingsBloc>().add(const GetUserInfoEvent());
                    Navigator.pop(context);
                  }
                  if (state is ChangePhoneNumberState &&
                      state.stateStatusChangePhoneNumber.failure == true) {
                    myCustomKillLoadingDialog(context,
                        code: state.stateStatusChangePhoneNumber.errorMessage);
                  }
                },
                builder: (context, state) {
                  return MyCustomButton(
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
                        Navigator.pushNamed(
                            context, ConfirmCodePhonePage.routeName);
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
