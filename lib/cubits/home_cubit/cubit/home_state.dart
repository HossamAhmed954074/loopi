part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoaded extends HomeState {}

final class Homesucess extends HomeState {
  final List<TicketsModel> ticketModel ;
  Homesucess({required this.ticketModel});
}

final class HomeFaluire extends HomeState {
  final String errorMessage;
  HomeFaluire({required this.errorMessage});
}
