import 'package:basic_project/screens/settings/bloc_export.dart';
import 'package:basic_project/screens/subscriptions/bloc/subscription_bloc.dart';
import 'package:basic_project/screens/subscriptions/model/subsription_model.dart';
import 'package:basic_project/screens/subscriptions/widget/subscription_card.dart';
import 'package:basic_project/widgets/error_notification.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  static const String routeName = "/subscriptions";
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int skip = 0, limit = 10;
  int? end;
  List<SubscriptionData> data = [];
  SubscriptionBloc bloc = SubscriptionBloc();
  bool loading = false;
  void reset() {
    skip = 0;
    limit = 10;
    end = null;
    data.clear();
    loading = false;
  }

  void fetch() {
    if (loading) {
      return;
    }
    if (limit - 10 > (end ?? double.infinity)) {
      return;
    }
    bloc.add(GetSubscription(skip: skip, limit: limit));
  }

  ScrollController controller = ScrollController();
  @override
  void initState() {
    fetch();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SubscriptionBloc, SubscriptionState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.wait == true) {
              setState(() {
                loading = true;
              });
            } else {
              loading = false;
            }
            if (state.success == true) {
              List<SubscriptionData> raw = state.data?.data ?? [];
              end = state.data?.totalRecords?.toInt() ?? 0;
              setState(() {
                for (var e in raw) {
                  data.add(e);
                }
                data = data.toSet().toList();
              });
              skip += 10;
              limit += 10;
            }
          },
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("باقات الاشتراك"),
          toolbarHeight: 70,
        ),
        body: BlocBuilder<SubscriptionBloc, SubscriptionState>(
          bloc: bloc,
          builder: (context, state) {
            if (state.fail == true) {
              return errorNotification(context, state.error ?? "999", () {
                reset();
                fetch();
              });
            }
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: data.length + 1,
              itemBuilder: (context, index) {
                if (index < data.length) {
                  return SubscriptionCard(
                    data: data[index],
                  );
                }
                return Visibility(
                  visible: loading,
                  child: const SizedBox(
                    height: 80,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
