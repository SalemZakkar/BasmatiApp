import 'package:basic_project/widgets/flush_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../generated/l10n.dart';
import '../../helper/helper_export.dart';
import '../../widgets/image_background_widget.dart';
import '../../widgets/text_field_holder.dart';
import '../../widgets/widgets_export.dart';
import '../screens_export.dart';
import 'authentication_export.dart';
import 'forget_password.dart';
import 'sign_up.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = "/signIn";

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late String phoneNumber;
  late String password;
  TextEditingController passwordController = TextEditingController();
  String countryKey = "+966";
  bool myObscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundImageWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: const Center(),
          centerTitle: false,
          toolbarHeight: 180,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).welcome,
                style: const TextStyle(color: Colors.white, fontSize: 15),
                textScaleFactor: 1,
              ),
              Text(S.of(context).app_name,
                  style: const TextStyle(color: Colors.white, fontSize: 40),
                  textScaleFactor: 1)
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          //  padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(22), topLeft: Radius.circular(22))),
          child: Form(
            key: formState,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
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
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(9),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            suffix: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text("966+"),
                            ),
                            hintText:
                                "${S.of(context).enter} ${S.of(context).phone_number}"),
                        // obscureText: true,
                        onSaved: (value) {
                          phoneNumber = value.toString();
                        },
                        validator: (value) {
                          var val = value!.trim();
                          if (val.length != 9) {
                            return "${S.of(context).phone_number} ${S.of(context).is_wrong}";
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
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start,
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
                        controller: passwordController,
                        onSaved: (value) {
                          password = value.toString();
                        },
                        validator: (value) {
                          if (!Validator.checkPassword(
                              passwordController.text)) {
                            showErrorMessageFlushNoCode(
                                context,
                                "كلمة المرور يجب أن تكون بين 8 احرف الى 24 حرف\n"
                                "يجب أن تحتوي احرف و أرقام و رموز");
                            return "كلمة المرور لا يمكن استخدامها";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Navigator.pushNamed(
                        context, ForgetPasswordPage.routeName),
                    title: Text(
                      S.of(context).did_u_forget_password,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          decoration: TextDecoration.underline, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state.stateStatusSingIn.inProgress == true) {
                        myCustomShowLoadingDialog(context);
                        printLog(
                            stateID: "531043",
                            data: "in Progress true",
                            isSuccess: true);
                      }
                      if (state.stateStatusSingIn.success == true) {
                        myCustomKillLoadingDialog(context);
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          NavigationBarScreen.routeName,
                          (route) => false,
                        );
                        printLog(
                            stateID: "451234",
                            data: "success is ture",
                            isSuccess: true);
                      }
                      if (state.stateStatusSingIn.failure == true) {
                        myCustomKillLoadingDialog(context);
                        showErrorMessageFlush(context,
                            state.stateStatusSingIn.errorMessage ?? "");
                        printLog(
                            stateID: "123534",
                            data: "Failure is true",
                            isSuccess: true);
                      }
                    },
                    builder: (context, state) {
                      return MyCustom3DButtonWithText(
                        text: S.of(context).sign_in,
                        height: 60,
                        width: 150,
                        color: Theme.of(context).primaryColor,
                        borderRadius: 15,
                        shadowColor: Colors.transparent,
                        function: () async {
                          FocusScope.of(context).unfocus();
                          FormState? formData = formState.currentState;
                          if (formData!.validate()) {
                            printLog(
                                stateID: '286106',
                                data: "Sing In Valid",
                                isSuccess: true);
                            formData.save();

                            printLog(
                                stateID: "590129",
                                data: "Sign In",
                                isSuccess: true);
                            context
                                .read<AuthBloc>()
                                .add(AuthSignInEvent(phoneNumber, password));
                          } else {
                            printLog(
                                stateID: '710924',
                                data: "SingIn Not Valid",
                                isSuccess: false);
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SignUpPage.routeName);
                        },
                        child: Text(
                          S.of(context).don_not_have_account,
                          textScaleFactor: 0.9,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline1!.color,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
