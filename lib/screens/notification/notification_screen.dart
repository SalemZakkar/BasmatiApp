import 'package:basic_project/config/bloc_export.dart';
import 'package:basic_project/screens/authentication/persistance/storage.dart';
import 'package:basic_project/screens/notification/bloc/notification_bloc.dart';
import 'package:basic_project/screens/notification/widget/notification_card.dart';
import 'package:basic_project/shared/shared_bloc/shared_bloc.dart';
import 'package:basic_project/widgets/error_notification.dart';
import 'package:basic_project/widgets/un_auth.dart';
import 'package:flutter/material.dart';

import 'model/notification_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int skip = 0, limit = 10;
  int? end;
  NotificationBloc bloc = NotificationBloc();
  bool loading = false;
  bool? auth;
  bool loaded = false;
  List<NotificationData> data = [];
  void reset() {
    skip = 0;
    limit = 10;
    end = null;
    data.clear();
    loading = false;
  }

  ScrollController controller = ScrollController();
  void fetch() {
    if (loading) {
      return;
    }
    if (limit - 10 >= (end ?? double.infinity)) {
      return;
    }
    bloc.add(NotificationGetEvent(skip: skip, limit: limit));
  }

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset == controller.position.maxScrollExtent) {
        fetch();
      }
    });
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
    }
    if (auth == false) {
      return unAuth(context);
    }
    return MultiBlocListener(
        listeners: [
          BlocListener<NotificationBloc, NotificationState>(
            listener: (context, state) {
              if (state.waiting == true) {
                setState(() {
                  loading = true;
                });
              } else {
                setState(() {
                  loading = false;
                });
              }
              if (state.success == true) {
                List<NotificationData> raw =
                    state.notificationModel?.data ?? [];
                end = state.notificationModel?.totalRecords?.toInt();
                setState(() {
                  for (var val in raw) {
                    data.add(val);
                  }
                  data = data.toSet().toList();
                });
                skip += 10;
                limit += 10;
              }
            },
            bloc: bloc,
          ),
          BlocListener<SharedBloc, SharedState>(
            listener: (context, state) {
              if (state is NotifyFetchState) {
                reset();
                fetch();
              }
            },
          )
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text("الإشعارات"),
            toolbarHeight: 70,
          ),
          body: BlocBuilder<NotificationBloc, NotificationState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is NotificationInitial) {
                fetch();
              }
              if (state.failure == true) {
                return errorNotification(context, state.error ?? "1334", () {
                  reset();
                  fetch();
                });
              }
              return Container(
                constraints: const BoxConstraints.expand(),
                alignment: Alignment.center,
                child: ListView.builder(
                  itemCount: data.length + 1,
                  physics: const BouncingScrollPhysics(),
                  controller: controller,
                  itemBuilder: (context, index) {
                    if (index < data.length) {
                      return NotificationCard(
                        notificationData: data[index],
                      );
                    } else {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: loading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : null,
                      );
                    }
                  },
                ),
              );
            },
          ),
        ));
  }
}
