import 'package:basic_project/config/bloc_export.dart';
import 'package:basic_project/screens/order/bloc/order_bloc.dart';
import 'package:basic_project/widgets/error_notification.dart';
import 'package:flutter/material.dart';

import 'models/subscribe_log_model.dart';
import 'widgets/subscribe_log_card.dart';

class SubscribeLog extends StatefulWidget {
  static const String routeName = "subscribeLog";
  const SubscribeLog({Key? key}) : super(key: key);

  @override
  State<SubscribeLog> createState() => _SubscribeLogState();
}

class _SubscribeLogState extends State<SubscribeLog> {
  int skip = 0, limit = 10;
  int? end;
  List<SubscribeLogData> data = [];
  bool loading = false;
  ScrollController controller = ScrollController();
  OrderBloc bloc = OrderBloc();
  void fetch() {
    if (loading) {
      return;
    }
    if (limit - 10 >= (end ?? double.infinity)) {
      return;
    }
    bloc.add(GetSubscriptionLog(limit: limit, skip: skip));
  }

  void reset() {
    skip = 0;
    limit = 10;
    end = null;
    data.clear();
    loading = false;
  }

  @override
  void initState() {
    fetch();
    controller.addListener(() {
      if (controller.offset == controller.position.maxScrollExtent) {
        fetch();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return MultiBlocListener(
      listeners: [
        BlocListener<OrderBloc, OrderState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.wait == true) {
              setState(() {
                loading = true;
              });
            } else {
              setState(() {
                loading = false;
              });
            }
            if (state.success == true) {
              List<SubscribeLogData> raw = state.subscribeLogModel?.data ?? [];
              end = state.subscribeLogModel?.totalRecords?.toInt();
              setState(() {
                for (var e in raw) {
                  data.add(e);
                }
                data = data.toSet().toList();
              });
            }
            skip += 10;
            limit += 10;
          },
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("سجلات الإشتراك"),
          toolbarHeight: 80,
        ),
        body: BlocBuilder<OrderBloc, OrderState>(
          bloc: bloc,
          builder: (context, state) {
            if (state.fail == true) {
              return errorNotification(context, state.errorCode ?? "999", () {
                reset();
                fetch();
              });
            }
            return Container(
              constraints: const BoxConstraints.expand(),
              child: ListView.builder(
                controller: controller,
                itemBuilder: (context, index) {
                  if (index >= data.length) {
                    return SizedBox(
                      height: 80,
                      child: Visibility(
                        visible: loading,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  }
                  return SubscribeLogCard(
                    data: data[index],
                  );
                },
                itemCount: data.length + 1,
                physics: const BouncingScrollPhysics(),
              ),
            );
          },
        ),
      ),
    );
  }
}
