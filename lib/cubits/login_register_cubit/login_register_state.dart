part of 'login_register_cubit.dart';

@immutable
sealed class LoginRegisterState {}

final class LoginRegisterInitial extends LoginRegisterState {}
final class LoginRegisterSuccess extends LoginRegisterState {}
final class LoginRegisterLoading extends LoginRegisterState {}
final class LoginRegisterFailure extends LoginRegisterState {
  final String errorMessage;
  LoginRegisterFailure(this.errorMessage);
}
