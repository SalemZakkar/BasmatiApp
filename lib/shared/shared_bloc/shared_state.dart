part of 'shared_bloc.dart';

abstract class SharedState {}

class SharedInitial extends SharedState {}

class ResetProduct extends SharedState {}

class AddToCartState extends SharedState {}

class CartAddState extends SharedState {
  final double price;
  CartAddState({required this.price});
}

class CartSubState extends SharedState {
  final double price;
  CartSubState({required this.price});
}

class NotifyFetchState extends SharedState {}

class ResetCartState extends SharedState {}
