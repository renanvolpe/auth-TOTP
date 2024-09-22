part of 'recovery_secret_bloc.dart';


sealed class RecoverySecretState {}

final class RecoverySecretInitial extends RecoverySecretState {}
final class RecoverySecretProgress extends RecoverySecretState {}
final class RecoverySecretSuccess extends RecoverySecretState {
  final String totpCode;
  RecoverySecretSuccess(this.totpCode);
}
final class RecoverySecretFailure extends RecoverySecretState {
  final String message;
  RecoverySecretFailure(this.message);
}
