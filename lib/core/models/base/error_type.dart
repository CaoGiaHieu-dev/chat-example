import 'package:dio/dio.dart';

enum ErrorType {
  noNetwork,
  tokenExpired,
  timeOut,
  response,
  cancel,
  other,
  badCertificate,
}

extension DioExceptionTypeExt on DioExceptionType {
  ErrorType toErrorType() {
    return switch (this) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        ErrorType.timeOut,
      DioExceptionType.cancel => ErrorType.cancel,
      DioExceptionType.connectionError => ErrorType.noNetwork,
      DioExceptionType.badCertificate => ErrorType.badCertificate,
      _ => ErrorType.other,
    };
  }
}
