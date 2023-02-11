import 'package:basic_project/screens/settings/bloc_export.dart';
import 'package:basic_project/screens/subscriptions/bloc/subscription_bloc.dart';
import 'package:basic_project/screens/subscriptions/widget/pay_button.dart';
import 'package:basic_project/widgets/error_notification.dart';
import 'package:flutter/material.dart';

class SubscriptionDetails extends StatefulWidget {
  static const String routeName = "/sub_details";
  final String id;
  const SubscriptionDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<SubscriptionDetails> createState() => _SubscriptionDetailsState();
}

class _SubscriptionDetailsState extends State<SubscriptionDetails> {
  SubscriptionBloc bloc = SubscriptionBloc();
  bool success = false;
  @override
  void initState() {
    bloc.add(GetSubDetails(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("معلومات الباقة"),
        toolbarHeight: 70,
      ),
      body: Container(
          constraints: const BoxConstraints.expand(),
          child: BlocBuilder<SubscriptionBloc, SubscriptionState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.success == true) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  setState(() {
                    success = true;
                  });
                });
                return Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                              state.detailsData?.name?.toString() ?? "null"),
                          subtitle: Row(
                            children: [
                              Text(
                                "المدة: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(fontSize: 18),
                              ),
                              Text(
                                state.detailsData?.duration?.value
                                        ?.toString() ??
                                    "null",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(fontSize: 18),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                getDuration(state.detailsData!.duration!.unit!),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                state.detailsData!.description!,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontSize: 20,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .color),
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              } else if (state.fail == true) {
                return errorNotification(context, state.error ?? "999", () {
                  bloc.add(GetSubDetails(id: widget.id));
                });
              } else if (state.wait == true) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const SizedBox();
            },
          )),
      bottomNavigationBar: BlocBuilder<SubscriptionBloc, SubscriptionState>(
        bloc: bloc,
        builder: (context, state) {
          if (state.success == true) {
            return Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22))),
                height: 120,
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    getPrice(state.detailsData!.price!.toDouble(),
                        state.detailsData?.discount?.toDouble(), context),
                    PayButton(id: widget.id)
                  ],
                ));
          }
          return const SizedBox();
        },
      ),
    );
  }
}

String getDuration(String dur) {
  if (dur == "day") {
    return "يوم";
  } else {
    return "شهر";
  }
}

Widget getPrice(double price, double? discount, context) {
  if (discount == null || discount == 0) {
    return Row(
      children: [
        Text(
          price.toString(),
          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 20),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "ر.س",
          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 20),
        )
      ],
    );
  }
  return Row(
    children: [
      Text(
        price.toString(),
        style: const TextStyle(
            color: Colors.red,
            decoration: TextDecoration.lineThrough,
            fontSize: 20),
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        discount.toString(),
        style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 20),
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        "ر.س",
        style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 20),
      )
    ],
  );
}
