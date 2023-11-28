import 'package:dio/dio.dart';

import '../config.dart';
import '../constants.dart';
import 'logger_interceptor.dart';

class HttpClient {
  HttpClient._();

  static String? authentication;
  static const Duration connectTimeOut = Duration(seconds: 20);
  static const Duration receiveTimeOut = Duration(seconds: 20);

  static Dio get dio => _dio;

  static final _dio = Dio()
        ..options.baseUrl = AppConfig.baseUrl
        ..options.connectTimeout = connectTimeOut
        ..options.receiveTimeout = receiveTimeOut
        ..options.followRedirects = false
        ..options.headers = {
          "Content-Type": "application/json",
        }
        ..interceptors.add(LoggerInterceptors())
      // ..interceptors.add(RenewInterceptors())
      ;
  static void setBaseUrl(String url) => _dio.options.baseUrl = url;

  static void setConnectTimeOut(int? val) {
    _dio.options.connectTimeout = Duration(milliseconds: val ?? 0);
  }

  static void setHeader(Map<String, dynamic> headers) {
    _dio.options.headers.addAll(headers);
  }

  static void removeHeader(String header) {
    _dio.options.headers.remove(header);
  }

  static void setTokenHeader(String token) {
    setHeader({
      StringUtils.authorization: 'Bearer $token',
    });
  }

  static void removeTokenHeader() {
    removeHeader(StringUtils.authorization);
  }
}
