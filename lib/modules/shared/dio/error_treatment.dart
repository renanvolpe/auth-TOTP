import 'package:dio/dio.dart';

import '../../core/utils/failure.dart';
import '../../core/utils/logger.dart';

class ErrorTreatment {
  static Failure getError(DioException e) {
    String errorMessage = e.response?.data["message"];
    String statusCode = e.response!.statusCode.toString();

    _printLoggError(e, errorMessage);

    if (statusCode == "401") {
      var failure = UnauthorizedFailure(errorMessage);
      return failure;
    } else if (statusCode.startsWith("5")) {
      return ServerFailure(errorMessage);
    }

    return UnexpectedFailure(errorMessage);
  }

  static void _printLoggError(DioException e, String errorMessage) => Logg.error(
      "ENDPOINT :: ${e.requestOptions.path} \nVERB :: ${e.requestOptions.method}  \nSTATUS CODE :: ${e.response?.statusCode}  \nErrorMessage :: $errorMessage");
}

class ErrorMessages {
  static String errorTotp = "Invalid TOTP code";
  static String errorCredentials = "Invalid credentials";
}
