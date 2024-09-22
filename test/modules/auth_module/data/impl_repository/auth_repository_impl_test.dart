import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dev_test/modules/auth_module/data/abstract_repository/abstract_auth_repository.dart';
import 'package:flutter_dev_test/modules/auth_module/data/impl_repository/auth_repository_impl.dart';
import 'package:flutter_dev_test/modules/auth_module/data/param/login_param.dart';
import 'package:flutter_dev_test/modules/auth_module/data/param/recovery_secret_param.dart';
import 'package:flutter_dev_test/modules/core/utils/failure.dart';
import 'package:flutter_dev_test/modules/core/utils/generate_totp.dart';
import 'package:flutter_dev_test/modules/shared/dio/dio_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late IAuthRepository repository;

  setUpAll(() {
    repository = AuthRepositoryImpl(DioClient(Dio()));
  });
  tearDownAll(() {});
  group("Teste two endpoints as success", () {
    String secret = '';

    test("Login endpoint failure error credentials", () async {
      var loginParam = LoginParam(username: "error admin", password: "password123", totp_code: TOTP.generate(secret));

      var response = await repository.login(loginParam);
      expect(response, isA<Left>());

      response.fold((failure) {
        expect(failure, isA<Failure>());
        expect(failure.message, "Invalid credentials");
      }, (success) {});
    });
    test("Login endpoint failure", () async {
      var loginParam = LoginParam(username: "admin", password: "password123", totp_code: TOTP.generate(secret));

      var response = await repository.login(loginParam);
      expect(response, isA<Left>());

      response.fold((failure) {
        expect(failure, isA<Failure>());
        expect(failure.message, "Invalid TOTP code");
      }, (success) {});
    });
    test("recovery secret endpoint success", () async {
      var recoverySecretParam = RecoverySecretParam(username: "admin", password: "password123", code: "000010");

      var response = await repository.recoverySecret(recoverySecretParam);
      expect(response, isA<Right>());
      response.fold((failure) {}, (success) {
        expect(success, isA<String>());
        secret = success;
      });
    });

    test("Login endpoint Success", () async {
      String totpCode = TOTP.generate(secret);
      var loginParam = LoginParam(username: "admin", password: "password123", totp_code: totpCode);

      var response = await repository.login(loginParam);
      expect(response, isA<Right>());
      response.fold((failure) {}, (success) {
        expect(success, isA<String>());
        secret = success;
      });
    });
  });
}
