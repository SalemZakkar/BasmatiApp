import 'package:basic_project/screens/authentication/authentication_export.dart';
import 'package:basic_project/screens/settings/bloc_export.dart';
import 'package:basic_project/widgets/text_field_holder.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widgets_export.dart';

class UserNameDialog extends StatefulWidget {
  final String old;
  const UserNameDialog({Key? key, required this.old}) : super(key: key);

  @override
  State<UserNameDialog> createState() => _UserNameDialogState();
}

class _UserNameDialogState extends State<UserNameDialog> {
  late TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller = TextEditingController(text: widget.old);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      title: Text(
        "تعديل الإسم الثلاثي",
        style: Theme.of(context).textTheme.headline1,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      content: Container(
        width: size.width,
        height: 200,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(22)),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text(
                  "الإسم الثلاثي",
                  style: Theme.of(context).textTheme.headline1,
                ),
                subtitle: TextFieldHolder(
                  width: size.width,
                  height: 50,
                  textFormField: TextFormField(
                    controller: controller,
                    decoration:
                        const InputDecoration(hintText: "أدخل الإسم الثلاثي"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "ملاحظة: ",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 19),
                  ),
                  Text(
                    "يرجى إدخال الإسم الثلاثي",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 19, fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "الغاء",
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 18),
            )),
        BlocConsumer<SettingsBloc, SettingsState>(
          listener: (context, state) {
            if (state is UpdateFullNameState &&
                state.stateStatusUpdateFullName.inProgress == true) {
              myCustomShowLoadingDialog(context);
            }
            if (state is UpdateFullNameState &&
                state.stateStatusUpdateFullName.success == true) {
              myCustomKillLoadingDialog(context);
              Navigator.pop(context);
              context.read<SettingsBloc>().add(const GetUserInfoEvent());
            }
            if (state is UpdateFullNameState &&
                state.stateStatusUpdateFullName.failure == true) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                myCustomKillLoadingDialog(context);
                myCustomShowSnackBarText(
                    context, state.stateStatusUserInfo.errorMessage.toString());
              });
            }
          },
          builder: (context, state) {
            return TextButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  if (controller.text.length > 6) {
                    context.read<SettingsBloc>().add(UpdateFullNameEvent(
                        token: context
                            .read<AuthBloc>()
                            .state
                            .singIn
                            .data!
                            .accessToken
                            .toString(),
                        fullName: controller.text.toString()));
                  } else {
                    myCustomShowSnackBarText(
                        context, "يجب ادخال الإسم بشكل صحيح");
                  }
                },
                child: Text(
                  "حفظ",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18),
                ));
          },
        ),
      ],
    );
  }
}
