part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetProductByCriteriaEvent extends HomeEvent {
  final int skip, total;
  final String? search;
  final bool? isSpecial;
  const GetProductByCriteriaEvent(
      {required this.skip, required this.total, this.search, this.isSpecial});
}
