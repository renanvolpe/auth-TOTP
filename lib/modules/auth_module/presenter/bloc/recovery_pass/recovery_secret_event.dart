part of 'recovery_secret_bloc.dart';

sealed class RecoverySecretEvent {}

class RecoverySecretStarted extends RecoverySecretEvent {
  final RecoverySecretParam recoverySecretParam;

  RecoverySecretStarted(this.recoverySecretParam);
}
