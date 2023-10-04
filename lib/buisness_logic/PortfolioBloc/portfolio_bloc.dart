import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  static int portfolioTabIndex = 0;
  PortfolioBloc() : super(PortfolioInitial()) {
    on<PortfolioIndexChangeEvent>((event, emit) {
      portfolioTabIndex = event.index;
      emit(PortfolioTabIndexChanged());
    });
  }
}
