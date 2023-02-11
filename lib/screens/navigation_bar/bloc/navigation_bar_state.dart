part of 'navigation_bar_bloc.dart';

class NavigationBarState extends Equatable {
  final int indexScreen;

  const NavigationBarState(this.indexScreen);

  @override
  List<Object> get props => [indexScreen];
}

class NavigationBarInitialState extends NavigationBarState {
  const NavigationBarInitialState() : super(1);
}

class NavigationBarChangeState extends NavigationBarState {
  final int newIndex;

  const NavigationBarChangeState(this.newIndex) : super(newIndex);
}
