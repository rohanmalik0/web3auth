part of 'portfolio_bloc.dart';

@immutable
abstract class PortfolioState {}

final class PortfolioInitial extends PortfolioState {}

class PortfolioTabIndexChanged extends PortfolioState {}