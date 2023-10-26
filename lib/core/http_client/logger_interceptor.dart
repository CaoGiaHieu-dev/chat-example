import 'dart:convert';

import 'package:dio/dio.dart';

import '../utilities/app_logger.dart';

const _logger = false;
const _loggerRequest = false;
const _loggerResponse = true;

class LoggerInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_logger || _loggerRequest) {
      AppLogger.print(
        'REQUEST[${options.method}] => PATH: ${options.uri}, Data: ${options.data} , header ${options.headers}',
        tag: "Interceptor",
      );
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (_logger || _loggerResponse) {
      final url = response.requestOptions.uri;
      AppLogger.print(
        'RESPONSE[${response.statusCode}] => PATH: $url ,Data: ${jsonEncode(response.data)}',
        tag: "Interceptor",
      );
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    AppLogger.print(
      "msg: ${err.message} - type: ${err.type} - error: ${err.error} - response: ${err.response} - url: ${err.requestOptions.uri} - header:${err.requestOptions.headers}}}}",
      tag: "Interceptor",
    );
    super.onError(err, handler);
  }
}
