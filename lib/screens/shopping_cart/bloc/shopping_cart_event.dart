part of 'shopping_cart_bloc.dart';

abstract class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ShoppingCartGetData extends ShoppingCartEvent {
  @override
  List<Object?> get props => [];
}

class ShoppingCartSave extends ShoppingCartEvent {
  final String id;
  final int count;
  const ShoppingCartSave({required this.id, required this.count});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class ShoppingCartAddQty extends ShoppingCartEvent {
  final double price;
  const ShoppingCartAddQty({required this.price});

  @override
  // TODO: implement props
  List<Object?> get props => [price];
}

class ShoppingCartSubQty extends ShoppingCartEvent {
  final double price;
  const ShoppingCartSubQty({required this.price});

  @override
  // TODO: implement props
  List<Object?> get props => [price];
}

class SaveOrderEvent extends ShoppingCartEvent {
  const SaveOrderEvent();
}
