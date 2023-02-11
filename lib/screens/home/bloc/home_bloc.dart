import 'dart:convert';

import 'package:basic_project/core/home_core/home_core.dart';
import 'package:basic_project/screens/authentication/models/models_export.dart';
import 'package:basic_project/screens/home/models/product_by_criteria.dart';
import 'package:basic_project/services/web_services/api_engine/response_model.dart';
import 'package:equatable/equatable.dart';

import '../bloc_export.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(HomeInitialState(
          stateStatusProductByCriteria: StateStatus(),
          productByCriteria: ProductByCriteria(),
        )) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetProductByCriteriaEvent>(_getProductByCriteriaEvent);
  }

  _getProductByCriteriaEvent(
      GetProductByCriteriaEvent event, Emitter<HomeState> emit) async {
    emit(HomeState(
        stateStatusProductByCriteria: StateStatus()
            .copyWith(inProgress: true, success: false, failure: false),
        productByCriteria: state.productByCriteria));
    ResponseModel res = await HomeCore.getData(
        event.search, event.skip, event.total,
        isSpecial: event.isSpecial);
    if (res.success) {
      ProductByCriteria data =
          ProductByCriteria.fromJson(jsonDecode(res.res?.data));
      emit(HomeState(
          stateStatusProductByCriteria: StateStatus()
              .copyWith(inProgress: false, success: true, failure: false),
          productByCriteria: data));
    } else {
      emit(HomeState(
          stateStatusProductByCriteria: StateStatus().copyWith(
              inProgress: false,
              success: false,
              failure: true,
              errorMessage: res.errorCode),
          productByCriteria: state.productByCriteria));
    }
  }
}
