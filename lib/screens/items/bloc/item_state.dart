part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  final StateStatus status;
  const ItemState({required this.status});
}

class ItemInitial extends ItemState {
  const ItemInitial({required super.status});
  @override
  List<Object> get props => [];
}

class GetItemDetailsState extends ItemState {
  final ItemDetailsData itemDetailsData;
  const GetItemDetailsState(
      {required this.itemDetailsData, required super.status});

  @override
  // TODO: implement props
  List<Object?> get props => [itemDetailsData, status];
}
