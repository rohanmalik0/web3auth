import 'package:dextrlabstask/bottom_nav_bar/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_bottom_navigator_bar_index_event.dart';

part 'home_bottom_navigator_bar_index_state.dart';

class HomeBottomNavigatorBarIndexBloc extends Bloc<
    HomeBottomNavigatorBarIndexEvent, HomeBottomNavigatorBarIndexState> {
  HomeBottomNavigatorBarIndexBloc()
      : super(HomeBottomNavigatorBarIndexInitial()) {
    on<ChangeHomeBottomNavigationIndex>((event, emit) {
      emit(HomeBottomChangeIndexState());
    });

    on<ChangeWelcomeBottomNavigationIndex>((event, emit) {
      emit(HomeBottomNavigatorBarIndexInitial());
      Routes.selectHomeIndex = event.index;
      emit(WelcomeBottomChangeIndexState());
    });
  }
}
