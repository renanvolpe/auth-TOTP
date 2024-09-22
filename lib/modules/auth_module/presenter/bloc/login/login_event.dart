part of 'login_bloc.dart';

sealed class LoginEvent {}

class LoginStarted extends LoginEvent {
  final LoginParam param;

  LoginStarted(this.param);

}
