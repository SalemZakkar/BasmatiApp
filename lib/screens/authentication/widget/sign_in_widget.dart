import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../helper/helper_export.dart';
import '../../screens_export.dart';
import '../authentication_export.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool obscurePassword = true;
  String phoneNumber = "";
  String password = "";
  bool resetPassword = false;
  String countryKey = "+963";

  @override
  void initState() {
    // setTopicToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        printLog(stateID: '693275', data: state, isSuccess: true);
      },
      builder: (context, state) {
        printLog(stateID: '829518', data: state, isSuccess: true);
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            children: [
              ///Entry Phone Number
              Form(
                key: formState,
                child: Column(
                  children: [
                    ///Entry email
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: S.of(context).email,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  Theme.of(context).textTheme.caption?.color ??
                                      const Color(0xFFFFFFFF)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  Theme.of(context).textTheme.caption?.color ??
                                      const Color(0xFFFFFFFF)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  Theme.of(context).textTheme.caption?.color ??
                                      const Color(0xFFFFFFFF)),
                        ),
                      ),
                      onSaved: (value) {},
                      validator: (value) {
                        if (!Validator.checkEmail(value ?? " ")) {
                          return "${S.of(context).email} ${S.of(context).is_wrong}";
                        }
                        return null;
                      },
                    ),

                    /// Phone Number
                    TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 9,
                      decoration: InputDecoration(
                        suffix: Text(countryKey),
                        prefixIcon: const Icon(Icons.phone),
                        hintText: S.of(context).phone_number,
                      ),
                      onSaved: (value) {
                        phoneNumber = value.toString();
                      },
                      validator: (value) {
                        var val = value!.trim();
                        if (val.length < 9) {
                          return "${S.of(context).phone_number} ${S.of(context).is_wrong}";
                        }
                        return null;
                      },
                    ),

                    /// Password
                    TextFormField(
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                        suffix: GestureDetector(
                            onTap: () {
                              obscurePassword = !obscurePassword;
                              setState(() {});
                            },
                            child: obscurePassword == true
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                        prefixIcon: const Icon(Icons.password),
                        hintText: S.of(context).password,
                        // enabledBorder: const UnderlineInputBorder(
                        //   borderSide: BorderSide(color: blueColor),
                        // ),
                        // border: const UnderlineInputBorder(
                        //   borderSide: BorderSide(color: blueColor),
                        // ),
                        // focusedBorder: const UnderlineInputBorder(
                        //   borderSide: BorderSide(color: blueColor),
                        // ),
                      ),
                      onSaved: (value) {
                        password = value.toString();
                      },
                      validator: (value) {
                        if (resetPassword == true) {
                          return null;
                        }
                        if (value!.length < 5) {
                          return "${S.of(context).password} ${S.of(context).is_less_than}";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12.0),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        resetPassword = true;
                        FocusScope.of(context).unfocus();
                        setState(() {});
                        FormState? formData = formState.currentState;
                        if (formData!.validate()) {
                          printLog(
                              stateID: '728408',
                              data: "Reset Password Valid",
                              isSuccess: true);
                          formData.save();
                        } else {
                          printLog(
                              stateID: '913836',
                              data: "Reset Password Not Valid",
                              isSuccess: false);
                        }
                        resetPassword = false;
                        setState(() {});
                      },
                      child: Text(S.of(context).forget_password)),
                ],
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () async {
                  Navigator.pushReplacementNamed(
                      context, NavigationBarScreen.routeName);
                  // FocusScope.of(context).unfocus();
                  // FormState? formData = formState.currentState;
                  // if (formData!.validate()) {
                  //   printLog(
                  //       stateID: '286106',
                  //       data: "SingIn Valid",
                  //       isSuccess: true);
                  //   formData.save();
                  //   Navigator.pushReplacementNamed(
                  //       context, NavigationBarScreen.routeName);
                  // } else {
                  //   printLog(
                  //       stateID: '710924',
                  //       data: "SingIn Not Valid",
                  //       isSuccess: false);
                  // }
                },
                child: Container(
                  height: 32.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).textTheme.caption?.color,
                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                  ),
                  child: Text(S.of(context).sign_in,
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
