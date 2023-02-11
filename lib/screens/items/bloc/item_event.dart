part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();
}

class GetItemDetails extends ItemEvent {
  final String id;
  const GetItemDetails({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
