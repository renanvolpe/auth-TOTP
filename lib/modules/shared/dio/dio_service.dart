import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dev_test/modules/shared/dio/error_treatment.dart';

import '../../core/utils/logger.dart';
import 'request_utils.dart';

abstract class DioService {
  Future<Either<dynamic, dynamic>> dioGet(
      {required String endpoint, bool withToken = true, Map<String, String>? params});
  Future<Either<dynamic, dynamic>> dioPost({required String endpoint, required Map body});
  Future<Either<dynamic, dynamic>> dioPut({required String endpoint, required Map body, String? token});
  Future<Either<dynamic, dynamic>> dioDelete({required String endpoint, required Map body});
  Future<Either<dynamic, dynamic>> dioPatch({required String endpoint, required Map body, String? token});
}

class DioClient implements DioService {
  final Dio _dio;

  DioClient(this._dio) {
    // _dio.options.baseUrl = FlavorConfig.instance.variables["baseUrl"] + Endpoints.apiV1;
    // _dio.options.connectTimeout = const Duration(seconds: 5);
    // _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  void _printLoggSuccess(Response response) =>
      Logg.consoleShow("ENDPOINT :: ${response.requestOptions.path} \nVERB :: ${response.requestOptions.method}");

  @override
  Future<Either<dynamic, dynamic>> dioGet(
      {required String endpoint, bool withToken = true, Map<String, String>? params, String? token}) async {
    dynamic errorMessage;

    try {
      Response response = await _dio.get(
        RequestUtils.pathDio(endpoint),
        queryParameters: RequestUtils.allParams(params),
        options: RequestUtils.headerRequestDio(),
      );
      _printLoggSuccess(response);
      return Right(response.data);
    } on DioException catch (e) {
      errorMessage = ErrorTreatment.getError(e);
    }
    return Left(errorMessage);
  }

//   DioException (DioException [connection error]: The connection errored: Connection refused This indicates an error which most likely cannot be solved by the library.
// Error: SocketException: Connection refused (OS Error: Connection refused, errno = 111), address = 127.0.0.1, port = 46264)
  @override
  Future<Either<dynamic, dynamic>> dioPost({required String endpoint, required Map body}) async {
    dynamic errorMessage;
    try {
      Response response = await _dio.post(RequestUtils.pathDio(endpoint),
          data: json.encode(body), options: RequestUtils.headerRequestDio());
      _printLoggSuccess(response);
      return Right(response.data);
    } on DioException catch (e) {
      errorMessage = ErrorTreatment.getError(e);
    }
    return Left(errorMessage);
  }

  @override
  Future<Either<dynamic, dynamic>> dioDelete({required String endpoint, Map? body, String? token}) async {
    dynamic errorMessage;

    try {
      Response response = await _dio.delete(RequestUtils.pathDio(endpoint),
          data: json.encode(body), options: RequestUtils.headerRequestDio());
      _printLoggSuccess(response);
      return Right(response.data);
    } on DioException catch (e) {
      errorMessage = ErrorTreatment.getError(e);
    }
    return Left(errorMessage);
  }

  @override
  Future<Either<dynamic, dynamic>> dioPut({required String endpoint, required Map body, String? token}) async {
    dynamic errorMessage;

    try {
      Response response = await _dio.put(RequestUtils.pathDio(endpoint),
          data: json.encode(body), options: RequestUtils.headerRequestDio());
      _printLoggSuccess(response);
      return Right(response.data);
    } on DioException catch (e) {
      errorMessage = ErrorTreatment.getError(e);
    }
    return Left(errorMessage);
  }

  @override
  Future<Either<dynamic, dynamic>> dioPatch({required String endpoint, required Map body, String? token}) async {
    dynamic errorMessage;

    try {
      Response response = await _dio.patch(RequestUtils.pathDio(endpoint),
          data: json.encode(body), options: RequestUtils.headerRequestDio());
      _printLoggSuccess(response);
      return Right(response.data);
    } on DioException catch (e) {
      errorMessage = ErrorTreatment.getError(e);
    }
    return Left(errorMessage);
  }
}
