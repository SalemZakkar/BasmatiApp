import 'dart:math';

import 'package:basic_project/screens/home/widgets/best_offers.dart';
import 'package:basic_project/screens/home/widgets/subscribe_card.dart';
import 'package:basic_project/screens/settings/bloc_export.dart';
import 'package:basic_project/screens/shopping_cart/widgets/cart_button.dart';
import 'package:basic_project/shared/shared_bloc/shared_bloc.dart';
import 'package:basic_project/widgets/error_notification.dart';
import 'package:basic_project/widgets/text_field_holder.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../generated/l10n.dart';
import '../../helper/helper_export.dart';
import 'bloc_export.dart';
import 'models/product_by_criteria.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  int itemsNumberShopping = 2;
  ScrollController scrollController = ScrollController();

  int skip = 0, limit = 10;
  void reset() {
    skip = 0;
    limit = 10;
    ma = null;
    data.clear();
  }

  void fetch() {
    if (productLoading) {
      return;
    }
    if (limit - 10 >= (ma ?? double.infinity)) {
      return;
    }
    products.add(GetProductByCriteriaEvent(
        skip: skip,
        total: min(limit, (ma ?? 10)),
        search: Validator.checkName(searchValue) ? searchValue : null));
  }

  HomeBloc products = HomeBloc();
  HomeBloc offers = HomeBloc();
  SettingsBloc settingsBloc = SettingsBloc();
  bool productLoading = false;
  bool authLoading = false;
  bool error = false;
  String code = "";
  int? ma;
  String searchValue = "";
  bool showBestOffer = false;
  late TextEditingController search;
  List<ProductMainInfo> data = [];
  @override
  void initState() {
    settingsBloc.add(const GetUserInfoEvent());
    fetch();
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        fetch();
      }
    });
    search = TextEditingController(text: searchValue);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocListener(
        listeners: [
          BlocListener<HomeBloc, HomeState>(
            bloc: products,
            listener: (context, state) {
              if (state.stateStatusProductByCriteria.success == true) {
                setState(() {
                  productLoading = false;
                  error = false;
                  ma = state.productByCriteria.totalRecords?.toInt();
                  for (int i = 0;
                      i < state.productByCriteria.data!.length;
                      i++) {
                    data.add(state.productByCriteria.data![i]);
                  }
                  data = data.toSet().toList();
                  skip += 10;
                  limit += 10;
                });
              }
              if (state.stateStatusProductByCriteria.inProgress == true) {
                setState(() {
                  error = false;
                  productLoading = true;
                });
              }
              if (state.stateStatusProductByCriteria.failure == true) {
                reset();
                searchValue = "";
                setState(() {
                  error = true;
                  code =
                      state.stateStatusProductByCriteria.errorMessage ?? "99";
                });
              }
            },
          ),
          BlocListener<SettingsBloc, SettingsState>(
            bloc: settingsBloc,
            listener: (context, state) {
              if (state.stateStatusUserInfo.success == true) {
                if (state.myCustomUserInfo.data?.subscription == null) {
                  setState(() {
                    showBestOffer = true;
                  });
                } else {
                  setState(() {
                    showBestOffer = false;
                  });
                }
              }
            },
          )
        ],
        child: RefreshIndicator(
          onRefresh: () {
            settingsBloc.add(const GetUserInfoEvent());
            reset();
            products.add(GetProductByCriteriaEvent(skip: skip, total: limit));
            context.read<SharedBloc>().add(ResetProductEvent());
            return Future.value();
          },
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  S.of(context).surf_products,
                ),
                actions: const [
                  Padding(
                      padding: EdgeInsets.only(left: 10), child: CartButton())
                ],
              ),
              body: error
                  ? errorNotification(context, code, () {
                      reset();
                      products.add(
                          GetProductByCriteriaEvent(skip: skip, total: limit));
                    })
                  : Container(
                      constraints: const BoxConstraints.expand(),
                      child: Scrollbar(
                          controller: scrollController,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                TextFieldHolder(
                                    height: 70,
                                    width: MediaQuery.of(context).size.width,
                                    textFormField: TextFormField(
                                      controller: search,
                                      decoration: InputDecoration(
                                          hintText: "البحث",
                                          suffixIcon: InkWell(
                                            onTap: () {
                                              if (Validator.checkName(
                                                  search.text)) {
                                                reset();
                                                fetch();
                                              }
                                              FocusScope.of(context).unfocus();
                                            },
                                            child: const Icon(
                                              Icons.search,
                                              color: Colors.grey,
                                            ),
                                          )),
                                      onChanged: (value) {
                                        if (search.text.trim().isEmpty) {
                                          setState(() {
                                            search.clear();
                                          });
                                        }
                                        searchValue = value;
                                        if (search.text.isEmpty) {
                                          reset();
                                          fetch();
                                        }
                                      },
                                      onEditingComplete: () {
                                        if (Validator.checkName(search.text)) {
                                          reset();
                                          fetch();
                                        }
                                        FocusScope.of(context).unfocus();
                                      },
                                    )),

                                const BestOffers(),
                                const SizedBox(
                                  height: 20,
                                ),
                                Visibility(
                                  visible: showBestOffer,
                                  child: const SubscribeCardHome(),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                /// Grid View For Items
                                GridView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: data.length + 1,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                            mainAxisExtent: 200),
                                    itemBuilder: (context, index) {
                                      if (index < data.length) {
                                        return MyCustomCategoryWidget(
                                          data: data[index],
                                        );
                                      } else {
                                        // return SizedBox(
                                        //   child: Center(
                                        //     child: (productLoading
                                        //         ? const CircularProgressIndicator()
                                        //         : null),
                                        //   ),
                                        // );
                                        return Visibility(
                                          visible: productLoading,
                                          child: Shimmer.fromColors(
                                              baseColor: Colors.black12,
                                              highlightColor: Colors.white24,
                                              child: Container(
                                                width: 300,
                                                height: 300,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22)),
                                              )),
                                        );
                                      }
                                    })
                              ],
                            ),
                          )),
                    )),
        ),
      ),
    );
  }
}

//TODO
//check if user pays
