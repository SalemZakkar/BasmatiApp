import 'dart:convert';

import 'package:basic_project/core/item_core/item_core.dart';
import 'package:basic_project/screens/authentication/models/models_export.dart';
import 'package:basic_project/screens/items/models/item_details.dart';
import 'package:basic_project/services/web_services/api_engine/response_model.dart';
import 'package:equatable/equatable.dart';

import '../../../config/bloc_export.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemInitial(status: StateStatus())) {
    on<ItemEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetItemDetails>(_getItemDetails);
  }
  _getItemDetails(GetItemDetails event, Emitter<ItemState> emit) async {
    emit(GetItemDetailsState(
        itemDetailsData: ItemDetailsData(),
        status: StateStatus().copyWith(inProgress: true)));
    ResponseModel res = await ItemCore.getItemDetails(event.id);
    if (res.success) {
      ItemDetails details = ItemDetails.fromJson(jsonDecode(res.res?.data));
      emit(GetItemDetailsState(
          itemDetailsData: details.data ?? ItemDetailsData(),
          status: StateStatus().copyWith(success: true)));
    } else {
      emit(GetItemDetailsState(
          itemDetailsData: ItemDetailsData(),
          status: StateStatus()
              .copyWith(failure: true, errorMessage: res.errorCode)));
    }
  }
}
