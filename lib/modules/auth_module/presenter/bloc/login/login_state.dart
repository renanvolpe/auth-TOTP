part of 'login_bloc.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginProgress extends LoginState {}
final class LoginSuccess extends LoginState {
  final dynamic value;
  LoginSuccess(this.value);
}

final class LoginFailureTotp extends LoginState {
  final String message;
  LoginFailureTotp(this.message);
}

final class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}
