import 'package:basic_project/helper/helper_export.dart';
import 'package:basic_project/widgets/widgets_export.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../widgets/flush_message.dart';
import '../../widgets/text_field_holder.dart';
import '../authentication/bloc/auth_bloc.dart';
import 'bloc_export.dart';

class NewPasswordPage extends StatefulWidget {
  static const String routeName = "/newPassword";

  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPasswordValidation = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool myObscureText = true;
  bool myObscureText2 = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("تغيير كلمة المرور"),
      ),
      body: Form(
        key: globalKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).scaffoldBackgroundColor,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "تعديل كلمة المرور",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 29),
                ),
                const SizedBox(
                  height: 100,
                ),
                ListTile(
                  title: Text(
                    "كلمة المرور الجديدة",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  subtitle: TextFieldHolder(
                    width: size.width,
                    height: 75,
                    textFormField: TextFormField(
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.start,
                      controller: controllerPassword,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                myObscureText = !myObscureText;
                              });
                            },
                            child: Icon(myObscureText == true
                                ? Icons.visibility_outlined
                                : Icons.visibility),
                          ),
                          hintText:
                              "${S.of(context).enter} ${S.of(context).password}"),
                      obscureText: myObscureText,
                      validator: (value) {
                        if (!Validator.checkPassword(controllerPassword.text)) {
                          showErrorMessageFlushNoCode(
                              context,
                              "كلمة المرور يجب أن تكون بين 8 احرف الى 24 حرف\n"
                              "يجب أن تحتوي احرف و أرقام و رموز");
                          return "كلمة المرور لايمكن استخدامها";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "تأكيد كلمة المرور الجديدة",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  subtitle: TextFieldHolder(
                    width: size.width,
                    height: 75,
                    textFormField: TextFormField(
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.start,
                      controller: controllerPasswordValidation,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                myObscureText2 = !myObscureText2;
                              });
                            },
                            child: Icon(myObscureText2 == true
                                ? Icons.visibility_outlined
                                : Icons.visibility),
                          ),
                          hintText:
                              "${S.of(context).enter} ${S.of(context).password}"),
                      obscureText: myObscureText2,
                      validator: (value) {
                        if (value != controllerPassword.text) {
                          return "كلمة المرور مختلفة";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {},
                        child: Text("هل نسيت كلمة المرور؟",
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    decoration: TextDecoration.underline)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocConsumer<SettingsBloc, SettingsState>(
                  listener: (context, state) {
                    if (state.stateStatusChangePassword.inProgress == true) {
                      myCustomShowLoadingDialog(context);
                    }
                    if (state.stateStatusChangePassword.success == true) {
                      myCustomKillLoadingDialog(context);
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        showSuccessMessageFlush(
                            context, "تم تغيير كلمة السر بنجاح");
                      });
                      Navigator.pop(context);
                    }
                    if (state.stateStatusChangePassword.failure == true) {
                      myCustomKillLoadingDialog(context,
                          code: state.stateStatusChangePassword.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    return MyCustom3DButtonWithText(
                      text: "تعديل كلمة المرور",
                      height: 60,
                      width: 160,
                      color: Theme.of(context).primaryColor,
                      borderRadius: 15,
                      shadowColor: Colors.transparent,
                      function: () {
                        if (globalKey.currentState!.validate()) {
                          context.read<SettingsBloc>().add(ChangePasswordEvent(
                              token: context
                                  .read<AuthBloc>()
                                  .state
                                  .singIn
                                  .data!
                                  .accessToken
                                  .toString(),
                              oldPassword: context
                                  .read<AuthBloc>()
                                  .state
                                  .customUserInfo
                                  .password
                                  .toString(),
                              newPassword: controllerPassword.text.toString()));
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
