import 'package:basic_project/helper/payment_enum.dart';
import 'package:basic_project/helper/support_app.dart';
import 'package:basic_project/screens/order/bloc/order_bloc.dart';
import 'package:basic_project/widgets/error_notification.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../../config/bloc_export.dart';
import '../../widgets/custom_button_widget.dart';

class OrderDetailsSubscription extends StatefulWidget {
  final String idOrder;
  const OrderDetailsSubscription({Key? key, required this.idOrder})
      : super(key: key);
  static const String routeName = '/order_details_subscription';

  @override
  State<OrderDetailsSubscription> createState() =>
      _OrderDetailsSubscriptionState();
}

class _OrderDetailsSubscriptionState extends State<OrderDetailsSubscription> {
  OrderBloc orderBloc = OrderBloc();
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocBuilder<OrderBloc, OrderState>(
        bloc: orderBloc,
        builder: (context, state) {
          if (state is OrderInitial) {
            orderBloc.add(GetSubscriptionDetails(id: widget.idOrder));
          }
          if (state.wait == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.fail == true) {
            return errorNotification(context, state.errorCode ?? "999", () {
              orderBloc.add(GetSubscriptionDetails(id: widget.idOrder));
            });
          }
          if (state.success == true) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("سجل"),
                toolbarHeight: 80,
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          "اسم الإشتراك",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          state.subscriptionDetailsModel!.data!.subscription!
                              .name
                              .toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          getDateWithHrs(
                              intl.DateFormat("yyyy-MM-ddTHH:mm", "en").parse(
                                  state.subscriptionDetailsModel!.data!
                                      .createdAt!)),
                          textDirection: TextDirection.ltr,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          "مجموع التكلفة",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          state.subscriptionDetailsModel!.data!.totalPrice!
                              .toStringAsFixed(2),
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontSize: 16),
                        ),
                        const SizedBox(width: 2.0),
                        Text(
                          "ر.س",
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          "حالة الطلب : ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          getPaymentStatus(state.subscriptionDetailsModel!.data!
                              .statuses!.last.status!),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22))),
                height: 100,
                alignment: Alignment.center,
                child: MyCustomButton(
                  width: 120,
                  height: 40,
                  color: Theme.of(context).primaryColor,
                  borderRadius: 22,
                  customWidget: const Text(
                    "الدفع الآن",
                    style: TextStyle(color: Colors.white),
                  ),
                  function: () {},
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
