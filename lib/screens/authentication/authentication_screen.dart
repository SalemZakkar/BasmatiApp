import 'package:flutter/material.dart';

import '../../config/bloc_export.dart';
import '../../generated/l10n.dart';
import 'widget/widget_export.dart';

enum AuthenticationTypeEnum {
  logIn,
  logUp,
}

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);
  static const routeName = 'authentication_screen';

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  AuthenticationTypeEnum userAuthenticationType = AuthenticationTypeEnum.logIn;
  late String displayName, password, email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late String locale;

  @override
  Widget build(BuildContext context) {
    //double sizeHeight = MediaQuery.of(context).size.height;
    locale = Localizations.localeOf(context).toString();
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text(S.of(context).sign_in),
      ),
      body: BlocBuilder<ServicesBloc, ServicesState>(builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              userAuthenticationType == AuthenticationTypeEnum.logIn
                  ? const SignInWidget()
                  : const SignUpWidget(),
              const SizedBox(height: 12.0),
              userAuthenticationType == AuthenticationTypeEnum.logIn
                  ? Row(
                      children: [
                        Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 36.0),
                            child: Text(S.of(context).don_not_have_account,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.color))),
                        const Expanded(child: SizedBox()),
                        GestureDetector(
                          onTap: () {
                            userAuthenticationType =
                                AuthenticationTypeEnum.logUp;
                            setState(() {});
                          },
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 36.0),
                              child: Text(
                                S.of(context).create_account,
                              )),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            userAuthenticationType =
                                AuthenticationTypeEnum.logIn;
                            setState(() {});
                          },
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 36.0),
                              child: Text(
                                S.of(context).already_have_account,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              )),
                        ),
                      ],
                    ),
              const SizedBox(height: 12.0),
              InkWell(
                onTap: () {
                  context.read<ServicesBloc>().add(const ChangeLanguageEvent());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 36 * 2,
                  height: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: Theme.of(context).textTheme.caption?.color ??
                              Colors.blue)),
                  alignment: Alignment.center,
                  child: Text(
                    context.read<ServicesBloc>().state.languageIsEnglish == true
                        ? "العربية"
                        : "English",
                    textScaleFactor: 0.9,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText2?.color),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
