import 'package:basic_project/screens/settings/widget/un_subscribe_card.dart';
import 'package:basic_project/widgets/widgets_export.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../bloc_export.dart';
import '../change_phone.dart';
import '../new_password_page.dart';
import 'subscribe_card.dart';
import 'user_name_dialog.dart';

class UserCard extends StatefulWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state.stateStatusUserInfo.failure == true) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Add Your Code here.
            myCustomShowSnackBarText(
                context, state.stateStatusUserInfo.errorMessage.toString());
          });
        }

        return Container(
          width: size.width,
          height: 435,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(22)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              (state.myCustomUserInfo.data?.subscription == null
                  ? const UnSubscribeCard()
                  : SubscribeCard(
                      subscription:
                          state.myCustomUserInfo.data!.subscription!)),
              ListTile(
                title: Text(
                  "المعلومات الشخصية",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 22, fontWeight: FontWeight.w700),
                  textScaleFactor: 0.8,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(
                  "إسم المستخدم",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                  textScaleFactor: 0.8,
                ),
                subtitle: state.stateStatusUserInfo.success == true
                    ? Text(
                        state.myCustomUserInfo.data!.fullName.toString(),
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w500),
                        textScaleFactor: 0.8,
                      )
                    : myCustomShimmerShowLoading(height: 20.0, width: 40.0),
                trailing: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return UserNameDialog(
                            old: state.myCustomUserInfo.data?.fullName ?? "",
                          );
                        });
                  },
                  child: Text(
                    "تعديل",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18),
                    textScaleFactor: 0.8,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(
                  S.of(context).phone_number,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                  textScaleFactor: 0.8,
                ),
                subtitle: state.stateStatusUserInfo.success == true
                    ? Text(
                        state.myCustomUserInfo.data!.phone.toString(),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w500),
                        textScaleFactor: 0.8,
                      )
                    : myCustomShimmerShowLoading(height: 20.0, width: 40.0),
                trailing: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ChangePhone.routeName);
                  },
                  child: Text(
                    "تعديل",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18),
                    textScaleFactor: 0.8,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.vpn_key),
                title: Text(
                  S.of(context).password,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                  textScaleFactor: 0.8,
                ),
                trailing: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, NewPasswordPage.routeName);
                  },
                  child: Text(
                    "تعديل",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 18),
                    textScaleFactor: 0.8,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
