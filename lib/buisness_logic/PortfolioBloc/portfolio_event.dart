part of 'portfolio_bloc.dart';

sealed class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object> get props => [];
}
class PortfolioIndexChangeEvent extends PortfolioEvent {
  final int index;
  const PortfolioIndexChangeEvent(this.index);
}