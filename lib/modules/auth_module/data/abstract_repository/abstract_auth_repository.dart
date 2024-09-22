// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../../core/utils/failure.dart';
import '../param/login_param.dart';
import '../param/recovery_secret_param.dart';

abstract class IAuthRepository {
  Future<Either<Failure, String>> login(LoginParam loginParam);
  Future<Either<Failure, String>> recoverySecret(RecoverySecretParam recoverySecretParam);
}
