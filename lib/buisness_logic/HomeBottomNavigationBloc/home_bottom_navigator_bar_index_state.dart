part of 'home_bottom_navigator_bar_index_bloc.dart';

@immutable
abstract class HomeBottomNavigatorBarIndexState {}

class HomeBottomNavigatorBarIndexInitial
    extends HomeBottomNavigatorBarIndexState {}

class HomeBottomChangeIndexState extends HomeBottomNavigatorBarIndexState {
  HomeBottomChangeIndexState();
}

class WelcomeBottomChangeIndexState extends HomeBottomNavigatorBarIndexState {
  WelcomeBottomChangeIndexState();
}
