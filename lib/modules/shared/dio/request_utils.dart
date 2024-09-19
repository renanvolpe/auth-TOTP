import 'package:dio/dio.dart';

import '../../core/utils/endpoint.dart';

class RequestUtils {
  static String pathDio(String endpoint) => Endpoint.baseUrl + endpoint;

  static Map<String, String> allParams( params) {
    return params;
  }

  static Options headerRequestDio() =>
      Options(headers: {"Content-Type": "application/json"});
}
