part of 'ticket_cubit.dart';

@immutable
sealed class TicketState {}

final class TicketInitial extends TicketState {}

final class DateTimeSuccess extends TicketState {
  final DateTime dateTime;

  DateTimeSuccess({required this.dateTime});


}
final class DateTimeCancel extends TicketState {}
