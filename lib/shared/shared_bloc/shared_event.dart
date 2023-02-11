part of 'shared_bloc.dart';

abstract class SharedEvent {}

class ResetProductEvent extends SharedEvent {}

class AddToCart extends SharedEvent {}

class CartAdd extends SharedEvent {
  final double price;
  CartAdd({required this.price});
}

class CartSub extends SharedEvent {
  final double price;
  CartSub({required this.price});
}

class NotifyFetch extends SharedEvent {}

class ResetCart extends SharedEvent {}
