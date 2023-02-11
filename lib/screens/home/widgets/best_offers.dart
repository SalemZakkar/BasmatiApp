import 'package:basic_project/config/bloc_export.dart';
import 'package:basic_project/screens/home/bloc_export.dart';
import 'package:basic_project/screens/home/models/product_by_criteria.dart';
import 'package:basic_project/shared/shared_bloc/shared_bloc.dart';
import 'package:basic_project/widgets/error_notification.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BestOffers extends StatefulWidget {
  const BestOffers({Key? key}) : super(key: key);

  @override
  State<BestOffers> createState() => _BestOffersState();
}

class _BestOffersState extends State<BestOffers> {
  HomeBloc data = HomeBloc();
  bool loading = false;
  bool loaded = false;
  bool visible = true;
  int skip = 0, limit = 10;
  int? end;
  List<ProductMainInfo> items = [];
  void fetch() {
    if (limit - 10 >= (end ?? double.infinity)) {
      return;
    }
    if (loading) {
      return;
    }
    visible = true;
    data.add(
        GetProductByCriteriaEvent(skip: skip, total: limit, isSpecial: true));
  }

  void reset() {
    limit = 10;
    skip = 0;
    end = null;
    loading = false;
    items.clear();
  }

  ScrollController controller = ScrollController();
  @override
  void initState() {
    data.add(
        GetProductByCriteriaEvent(skip: skip, total: limit, isSpecial: true));
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
    return MultiBlocListener(
        listeners: [
          BlocListener<SharedBloc, SharedState>(
            listener: (context, state) {
              if (state is ResetProduct) {
                reset();
                fetch();
              }
            },
          ),
          BlocListener<HomeBloc, HomeState>(
            bloc: data,
            listener: (context, state) {
              if (state.stateStatusProductByCriteria.inProgress == true) {
                setState(() {
                  loading = true;
                });
              } else {
                setState(() {
                  loading = false;
                });
              }
              if (state.stateStatusProductByCriteria.failure == true) {
                setState(() {
                  visible = false;
                });
              }
              if (state.stateStatusProductByCriteria.success == true) {
                end = state.productByCriteria.totalRecords?.toInt();
                List<ProductMainInfo> raw = state.productByCriteria.data ?? [];
                for (var e in raw) {
                  items.add(e);
                }
                skip += 10;
                limit += 10;
                setState(() {
                  items = items.toSet().toList();
                });
              }
            },
          )
        ],
        child: Visibility(
          visible: visible && !loading,
          child: Container(
            padding: const EdgeInsets.only(
                top: 5.0, bottom: 10.0, right: 0, left: 0),
            height: 260.0,
            decoration: BoxDecoration(
              color: context.read<ServicesBloc>().state.isDark
                  ? Theme.of(context).cardColor
                  : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: BlocBuilder<HomeBloc, HomeState>(
                bloc: data,
                builder: (context, state) {
                  if (state.stateStatusProductByCriteria.success == true) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      if (items.isNotEmpty) {
                        setState(() {
                          visible = true;
                        });
                      } else {
                        setState(() {
                          visible = false;
                        });
                      }
                    });
                  }
                  if (state.stateStatusProductByCriteria.failure == true) {
                    loading = false;
                    return Expanded(
                      child: Center(
                        child: errorNotification(
                            context,
                            state.stateStatusProductByCriteria.errorMessage ??
                                "",
                            () {}),
                      ),
                    );
                  }
                  return Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "أهم العروض",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Scrollbar(
                        thumbVisibility: true,
                        controller: controller,
                        radius: const Radius.circular(22),
                        child: Container(
                          height: 200,
                          alignment: Alignment.center,
                          child: SizedBox(
                              height: 180,
                              child: ListView.builder(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  physics: const BouncingScrollPhysics(),
                                  controller: controller,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: items.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index >= items.length) {
                                      return Visibility(
                                        visible: loading,
                                        child: Shimmer.fromColors(
                                            baseColor: Colors.black12,
                                            highlightColor: Colors.white24,
                                            child: Container(
                                              width: 160,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          22)),
                                            )),
                                      );
                                    }
                                    return MyCustomOverCategoryWidget(
                                      data: items[index],
                                    );
                                  })),
                        ),
                      )
                    ],
                  );
                }),
          ),
        ));
  }
}
