import 'package:basic_project/helper/payment_enum.dart';
import 'package:basic_project/helper/support_app.dart';
import 'package:basic_project/screens/order/bloc/order_bloc.dart';
import 'package:basic_project/screens/order/models/order_details_model.dart';
import 'package:basic_project/screens/screens_export.dart';
import 'package:basic_project/widgets/error_notification.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../../config/bloc_export.dart';
import '../../widgets/custom_button_widget.dart';
import 'purchase_history_export.dart';

class PurchaseHistoryScreen extends StatefulWidget {
  final String idOrder;
  const PurchaseHistoryScreen({Key? key, required this.idOrder})
      : super(key: key);
  static const String routeName = '/purchase_history_screen';

  @override
  State<PurchaseHistoryScreen> createState() => _PurchaseHistoryScreenState();
}

class _PurchaseHistoryScreenState extends State<PurchaseHistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            orderBloc.add(GetOrderDetails(id: widget.idOrder));
          }
          if (state.wait == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.fail == true) {
            return errorNotification(context, state.errorCode ?? "999", () {
              orderBloc.add(GetOrderDetails(id: widget.idOrder));
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
                          getDateWithHrs(
                              intl.DateFormat("yyyy-MM-ddTHH:mm", "en").parse(
                                  state.orderDetailsModel!.data!.createdAt!)),
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
                          state.orderDetailsModel!.data!.products?.length
                                  .toString() ??
                              "0",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          "المشتريات",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                        const Expanded(child: SizedBox(width: 5.0)),
                        Text(
                          "مجموع التكلفة",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          state.orderDetailsModel!.data!.totalPrice!
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
                          getPaymentStatus(state
                              .orderDetailsModel!.data!.statuses!.last.status!),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ملاحطة: ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 20, color: Colors.red[500]),
                        ),
                        const SizedBox(width: 5.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const CallUsScreen()));
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 103,
                            child: Text(
                              "عند شرائك لاي شيء يرجى التواصل مع المركز من الصفحة الرئيسية..اضغط هنا للتواصل",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 15,
                                      overflow: TextOverflow.clip),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        itemCount:
                            state.orderDetailsModel!.data!.products?.length ??
                                0,
                        itemBuilder: (context, index) {
                          return MyCustomPurchaseWidget(
                            products: state.orderDetailsModel?.data
                                    ?.products?[index] ??
                                OrderProducts(),
                          );
                        }),
                  )
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
