import 'package:basic_project/screens/authentication/models/models_export.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../helper/helper_export.dart';
import '../authentication_export.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late CustomUserInfo _customUserInfo;
  bool obscurePassword = true;
  String countryKey = "+971";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            children: [
              Form(
                key: formState,
                child: Column(
                  children: [
                    ///Entry FirstName
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: S.of(context).first_name,
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
                      onSaved: (value) {
                        _customUserInfo.copyWith(fullName: value!.trim());
                      },
                      validator: (value) {
                        if (value!.length > 40) {
                          return "${S.of(context).first_name} ${S.of(context).is_more_than}";
                        }
                        if (value.length < 2) {
                          return "${S.of(context).first_name} ${S.of(context).is_less_than_2_digits}";
                        }
                        return null;
                      },
                    ),

                    ///Entry lastName
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: S.of(context).last_name,
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
                      onSaved: (value) {
                        _customUserInfo.copyWith(lastName: value!.trim());
                      },
                      validator: (value) {
                        if (value!.length > 40) {
                          return "${S.of(context).last_name} ${S.of(context).is_more_than}";
                        }
                        if (value.length < 2) {
                          return "${S.of(context).last_name} ${S.of(context).is_less_than_2_digits}";
                        }
                        return null;
                      },
                    ),

                    ///Entry fullName
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: S.of(context).full_name,
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
                      onSaved: (value) {
                        _customUserInfo.copyWith(fullName: value!.trim());
                      },
                      validator: (value) {
                        if (value!.length > 40) {
                          return "${S.of(context).full_name} ${S.of(context).is_more_than}";
                        }
                        if (value.length < 2) {
                          return "${S.of(context).full_name} ${S.of(context).is_less_than_2_digits}";
                        }
                        return null;
                      },
                    ),

                    ///Entry UserName
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: S.of(context).user_name,
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
                      onSaved: (value) {
                        _customUserInfo.copyWith(userName: value!.trim());
                      },
                      validator: (value) {
                        if (value!.length > 40) {
                          return "${S.of(context).user_name} ${S.of(context).is_more_than}";
                        }
                        if (value.length < 6) {
                          return "${S.of(context).user_name} ${S.of(context).is_less_than}";
                        }
                        return null;
                      },
                    ),

                    /// Phone Number
                    TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 9,
                      // textInputAction: ,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone_iphone),
                        hintText: S.of(context).phone_number,
                        suffix: Text(countryKey.toString()),
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
                      onSaved: (value) {
                        _customUserInfo.copyWith(phoneNumber: value.toString());
                      },
                      validator: (value) {
                        var val = value!.trim();
                        if (val.length < 9) {
                          return "${S.of(context).phone_number} ${S.of(context).is_wrong}";
                        }
                        return null;
                      },
                    ),

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

                    ///Entry City
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.location_city),
                        hintText: S.of(context).city,
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
                      onSaved: (value) {
                        _customUserInfo.copyWith(city: value!.trim());
                      },
                      validator: (value) {
                        if (value!.length < 2) {
                          return "${S.of(context).city} ${S.of(context).is_wrong}";
                        }
                        return null;
                      },
                    ),

                    ///Entry password
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
                      onSaved: (value) {
                        _customUserInfo.copyWith(password: value!.trim());
                      },
                      validator: (value) {
                        if (value!.length > 25) {
                          return "${S.of(context).password} ${S.of(context).is_more_than}";
                        }
                        if (value.length < 5) {
                          return "${S.of(context).password} ${S.of(context).is_less_than}";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  FormState? formData = formState.currentState;
                  if (formData!.validate()) {
                    printLog(
                      stateID: '561904',
                      data: "SingUp Valid",
                      isSuccess: true,
                    );
                    formData.save();
                    setState(() {});

                    // Navigator.pushReplacementNamed(
                    //     context, NavigationBarScreen.routeName);
                  } else {
                    printLog(
                        stateID: '712083',
                        data: "SingUp Not Valid",
                        isSuccess: false);
                  }
                },
                child: Container(
                    height: 32.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).textTheme.caption?.color,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(6.0)),
                    ),
                    child: Text(
                      S.of(context).create_account,
                      style: const TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
