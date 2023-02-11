import 'package:basic_project/config/bloc_export.dart';
import 'package:basic_project/config/config_export.dart';
import 'package:basic_project/screens/call_us/bloc/call_us_bloc.dart';
import 'package:basic_project/screens/call_us/widget/app_icon.dart';
import 'package:basic_project/screens/call_us/widget/phone_holder.dart';
import 'package:basic_project/widgets/error_notification.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallUsScreen extends StatefulWidget {
  const CallUsScreen({Key? key}) : super(key: key);

  @override
  State<CallUsScreen> createState() => _CallUsScreenState();
}

class _CallUsScreenState extends State<CallUsScreen> {
  @override
  void initState() {
    super.initState();
  }

  CallUsBloc bloc = CallUsBloc();
  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: Theme.of(context).primaryColor,
      child: BlocBuilder<CallUsBloc, CallUsState>(
        bloc: bloc,
        builder: (context, state) {
          if (!loaded) {
            bloc.add(GetAboutUsEvent());
            loaded = true;
          }
          if (state.stateStatusGetAboutUs.failure == true) {
            return errorNotification(
                context, state.stateStatusGetAboutUs.errorMessage ?? "", () {
              bloc.add(GetAboutUsEvent());
            });
          }
          if (state.stateStatusGetAboutUs.inProgress == true) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }

          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              title: Text(
                "من نحن",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 22),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppIcon(),
                    Text(
                      state.aboutUs.data?.description.toString() ?? "",
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "تابعونا",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        _launchInstagram(state.aboutUs.data?.instagram ?? "");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppAssets.instagram,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              "حساب Instagram",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "تواصل معنا",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return PhoneHolder(
                            phone: state.aboutUs.data?.whatsApp?[index] ?? "");
                      },
                      itemCount: state.aboutUs.data?.whatsApp?.length ?? 0,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _launchInstagram(String insta) async {
    if (insta == "") {
      return;
    }
    String nativeUrl = "instagram://user?username=$insta";
    String webUrl = "https://www.instagram.com/$insta/";
    if (await canLaunchUrl(Uri.parse(nativeUrl))) {
      await launchUrl(Uri.parse(nativeUrl));
    } else {
      await launchUrl(Uri.parse(webUrl));
    }
  }
}
