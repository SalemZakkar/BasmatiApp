part of 'home_bloc.dart';

class HomeState extends Equatable {
  final StateStatus stateStatusProductByCriteria;
  final ProductByCriteria productByCriteria;

  const HomeState(
      {required this.stateStatusProductByCriteria,
      required this.productByCriteria});

  @override
  List<Object> get props => [stateStatusProductByCriteria, productByCriteria];
}

class HomeInitialState extends HomeState {
  const HomeInitialState(
      {required super.stateStatusProductByCriteria,
      required super.productByCriteria});
}

class GetProductByCriteriaState extends HomeState {
  const GetProductByCriteriaState(
      {required super.stateStatusProductByCriteria,
      required super.productByCriteria});
}
