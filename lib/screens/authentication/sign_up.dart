import 'package:basic_project/widgets/widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../generated/l10n.dart';
import '../../helper/helper_export.dart';
import '../../widgets/flush_message.dart';
import '../../widgets/text_field_holder.dart';
import '../screens_export.dart';
import 'authentication_export.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = "/signUp";

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController secondName = TextEditingController();
  TextEditingController thirdName = TextEditingController();
  late String phoneNumber;
  String password = "";
  late String validatedPassword;
  String countryKey = "+966";
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  bool myObscureText = true;
  bool myObscureText2 = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).create_account),
        toolbarHeight: 80,
      ),
      body: Container(
        // padding: const EdgeInsets.only(left: 20, right: 20),
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  title: Text(
                    "الاسم الأول",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  subtitle: TextFieldHolder(
                    width: size.width,
                    height: 80,
                    textFormField: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "${S.of(context).enter} الاسم الأول "),
                      obscureText: false,
                      controller: firstName,
                      validator: (value) {
                        if (!Validator.checkName(firstName.text)) {
                          return "الاسم الأول غير صحيح";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "الاسم الوسط",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  subtitle: TextFieldHolder(
                    width: size.width,
                    height: 80,
                    textFormField: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "${S.of(context).enter} الاسم الوسط "),
                      obscureText: false,
                      controller: secondName,
                      validator: (value) {
                        if (!Validator.checkName(secondName.text)) {
                          return "الاسم الوسط غير صحيح";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "اسم العائلة",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  subtitle: TextFieldHolder(
                    width: size.width,
                    height: 80,
                    textFormField: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "${S.of(context).enter} اسم العائلة "),
                      obscureText: false,
                      controller: thirdName,
                      validator: (value) {
                        if (!Validator.checkName(thirdName.text)) {
                          return "اسم العائلة غير صحيح";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    S.of(context).phone_number,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  subtitle: TextFieldHolder(
                    width: size.width,
                    height: 80,
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
                              "${S.of(context).enter} ${S.of(context).phone_number}"),
                      obscureText: false,
                      onSaved: (value) {
                        phoneNumber = value.toString();
                      },
                      validator: (value) {
                        if (value!.length != 9) {
                          return "الرقم غير صحيح";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    S.of(context).password,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  subtitle: TextFieldHolder(
                    width: size.width,
                    height: 80,
                    textFormField: TextFormField(
                      //initialValue: "",

                      controller: passwordController,
                      textDirection: TextDirection.ltr,
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
                      onSaved: (value) {
                        password = value.toString();
                      },
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      validator: (passCurrentValue) {
                        if (!Validator.checkPassword(passwordController.text)) {
                          showErrorMessageFlushNoCode(
                              context,
                              "كلمة المرور يجب أن تكون بين 8 احرف الى 24 حرف\n"
                              "يجب أن تحتوي احرف و أرقام و رموز");
                          return "كلمة المرور لا يمكن إستخدامها";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "${S.of(context).confirm} ${S.of(context).password}",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  subtitle: TextFieldHolder(
                    width: size.width,
                    height: 80,
                    textFormField: TextFormField(
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.start,
                      initialValue: "",
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
                      onSaved: (value) {
                        validatedPassword = value.toString();
                      },
                      validator: (value) {
                        if (password != value) {
                          return "كلمة السر غير متطابقة";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.stateStatusSingUp.inProgress == true) {
                      myCustomShowLoadingDialog(context);
                      printLog(
                          stateID: "593420",
                          data: "in Progress true",
                          isSuccess: true);
                    }
                    if (state.stateStatusSingUp.success == true) {
                      myCustomKillLoadingDialog(context);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        NavigationBarScreen.routeName,
                        (route) => false,
                      );
                      printLog(
                          stateID: "942032",
                          data: "success is ture",
                          isSuccess: true);
                    }
                    if (state.stateStatusSingUp.failure == true) {
                      myCustomKillLoadingDialog(context,
                          code: state.stateStatusSingUp.errorMessage);
                      // showErrorMessageFlush(
                      //     context, state.stateStatusSingUp.errorMessage ?? "");
                      printLog(
                          stateID: "842561",
                          data: "Failure is true",
                          isSuccess: true);
                    }
                  },
                  builder: (context, state) {
                    return MyCustom3DButtonWithText(
                        text: S.of(context).create_account,
                        height: 60,
                        width: 140,
                        color: Theme.of(context).primaryColor,
                        borderRadius: 15,
                        shadowColor: Colors.transparent,
                        function: () async {
                          FocusScope.of(context).unfocus();
                          FormState? formData = formState.currentState;
                          if (formData!.validate()) {
                            printLog(
                                stateID: '135903',
                                data: "Sing Up Valid",
                                isSuccess: true);
                            formData.save();
                            context.read<AuthBloc>().add(AuthSignUpEvent(
                                "${firstName.text} ${secondName.text} ${thirdName.text}",
                                phoneNumber,
                                password));
                            printLog(
                                stateID: "140504",
                                data: "Sign Up",
                                isSuccess: true);
                          } else {
                            printLog(
                                stateID: '512012',
                                data: "SingUp Not Valid",
                                isSuccess: false);
                          }
                        });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
