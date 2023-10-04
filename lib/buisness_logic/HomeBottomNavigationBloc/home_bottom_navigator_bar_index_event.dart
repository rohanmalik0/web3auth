part of 'home_bottom_navigator_bar_index_bloc.dart';

@immutable
abstract class HomeBottomNavigatorBarIndexEvent {}

// ignore: must_be_immutable
class ChangeHomeBottomNavigationIndex extends HomeBottomNavigatorBarIndexEvent {
  int index = 0;
  ChangeHomeBottomNavigationIndex(this.index);
}

// ignore: must_be_immutable
class ChangeWelcomeBottomNavigationIndex
    extends HomeBottomNavigatorBarIndexEvent {
  int index = 0;
  ChangeWelcomeBottomNavigationIndex(this.index);
}
