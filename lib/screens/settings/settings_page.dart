import 'package:basic_project/screens/authentication/authentication_export.dart';
import 'package:basic_project/screens/authentication/persistance/storage.dart';
import 'package:basic_project/screens/settings/bloc_export.dart';
import 'package:basic_project/screens/settings/widget/dark_mode.dart';
import 'package:basic_project/screens/settings/widget/user_card.dart';
import 'package:basic_project/screens/splash_screen.dart';
import 'package:basic_project/screens/subscriptions/subscription_screen.dart';
import 'package:basic_project/widgets/error_notification.dart';
import 'package:basic_project/widgets/un_auth.dart';
import 'package:basic_project/widgets/widgets_export.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../order/payment_log.dart';
import '../order/subscribe_log.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = "/settings";

  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool? auth;
  bool loaded = false;
  @override
  initState() {
    context.read<SettingsBloc>().add(const GetUserInfoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        auth = await AuthStore.getToken() != null;
        setState(() {});
      });
      loaded = true;
    }
    if (auth == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (auth == false) {
      return unAuth(context);
    }
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state.stateStatusUserInfo.inProgress == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.stateStatusUserInfo.success == true) {
          return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).settings),
            ),
            body: Container(
              constraints: const BoxConstraints.expand(),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(13),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const UserCard(),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(18)),
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: const Icon(Icons.receipt),
                          onTap: () {
                            Navigator.pushNamed(context, PaymentLog.routeName);
                          },
                          title: Text(
                            "سجلات الشراء",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(18)),
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: const Icon(Icons.receipt),
                          onTap: () {
                            Navigator.pushNamed(
                                context, SubscribeLog.routeName);
                          },
                          title: Text(
                            "سجلات الإشتراك",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(18)),
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: const Icon(Icons.workspace_premium),
                          onTap: () {
                            Navigator.pushNamed(
                                context, SubscriptionScreen.routeName);
                          },
                          title: Text(
                            "باقات الإشتراك",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const DarkModeButton(),
                      const SizedBox(height: 10.0),
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthSignOutState) {
                            Navigator.of(context)
                                .pushReplacementNamed(SplashScreen.routeName);
                          }
                        },
                        builder: (context, state) {
                          return MyCustomButton(
                              customWidget: Text(
                                "تسجيل الخروج",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              height: 40,
                              width: double.maxFinite,
                              color: Colors.red,
                              borderRadius: 12.0,
                              function: () async {
                                context
                                    .read<AuthBloc>()
                                    .add(AuthSignOutEvent());
                              });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state.stateStatusUserInfo.failure == true) {
          return errorNotification(
              context, state.stateStatusUserInfo.errorMessage ?? "999", () {
            context.read<SettingsBloc>().add(const GetUserInfoEvent());
          });
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
