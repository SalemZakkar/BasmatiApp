part of 'shopping_cart_bloc.dart';

abstract class ShoppingCartState extends Equatable {
  final StateStatus status;
  final CartItemModel cartItemModel;
  final ShoppingError? shoppingError;
  final double? shoppingCartAddQty;
  final double? shoppingCartSubQty;

  const ShoppingCartState(
      {required this.cartItemModel,
      required this.status,
      this.shoppingError,
      this.shoppingCartAddQty,
      this.shoppingCartSubQty});
}

class ShoppingCartInitial extends ShoppingCartState {
  const ShoppingCartInitial(
      {required super.status, required super.cartItemModel});

  @override
  List<Object> get props => [];
}

class ShoppingState extends ShoppingCartState {
  const ShoppingState(
      {required super.status,
      required super.cartItemModel,
      super.shoppingError,
      super.shoppingCartAddQty,
      super.shoppingCartSubQty});

  @override
  // TODO: implement props
  List<Object?> get props => [
        cartItemModel,
        status,
        shoppingError,
        shoppingCartSubQty,
        shoppingCartAddQty
      ];
}

class SaveOrderState extends ShoppingCartState {
  final StateStatus saveOrderStateStatus;
  final String idOrder;

  const SaveOrderState(
      {required super.cartItemModel,
      required super.status,
      required this.saveOrderStateStatus,
      required this.idOrder});

  @override
  // TODO: implement props
  List<Object?> get props => [saveOrderStateStatus, idOrder];
}
