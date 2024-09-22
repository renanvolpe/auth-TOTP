// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_dev_test/modules/auth_module/data/abstract_repository/abstract_auth_repository.dart';
import 'package:flutter_dev_test/modules/core/utils/endpoint.dart';
import 'package:flutter_dev_test/modules/core/utils/failure.dart';

import '../../../shared/dio/dio_service.dart';
import '../param/login_param.dart';
import '../param/recovery_secret_param.dart';

class AuthRepositoryImpl implements IAuthRepository {
  DioService dio;
  AuthRepositoryImpl(this.dio);

  @override
  Future<Either<Failure, String>> login(LoginParam loginParam) async{
    try {
      var response = await dio.dioPost(endpoint: Endpoint.login, body: loginParam.toMap());
      return response.fold((failure) => Left(failure), (success) {
        String totpSecret = success["message"];
        return Right(totpSecret);
      });
    } catch (e) {
      return const Left(UnexpectedFailure("unexpected error in login, contact adm"));
    }
  }

  @override
  recoverySecret(RecoverySecretParam recoverySecretParam) async {
    try {
      var response = await dio.dioPost(endpoint: Endpoint.recoverySecret, body: recoverySecretParam.toMap());
      return response.fold((failure) => failure, (success) {
        String totpSecret = success["totp_secret"];
        return Right(totpSecret);
      });
    } catch (e) {
      return const Left(UnexpectedFailure("unexpected error in get recovery secret, contact adm"));
    }
  }
}
