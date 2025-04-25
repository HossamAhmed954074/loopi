part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}
final class PaymentLoading extends PaymentState {}
final class PaymentSuccess extends PaymentState {
 final PaymentModel paymentModel;


  PaymentSuccess({ required this.paymentModel});
}
final class PaymentFaluire extends PaymentState {
  final String errorMessage;
  PaymentFaluire({required this.errorMessage});
}



final class PaymentRequistLoading extends PaymentState {}
final class PaymentRequistSuccess extends PaymentState {
  final PaymentVisaModel paymentVisaModel;
  PaymentRequistSuccess({required this.paymentVisaModel});
}
final class PaymentRequistFaluire extends PaymentState {
  final String errorMessage;
  PaymentRequistFaluire({required this.errorMessage});
}