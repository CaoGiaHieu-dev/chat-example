import 'package:dio/dio.dart';

sealed class Result<T> {
  R? when<R>({
    R? Function(T? data)? success,
    R? Function(DioExceptionType type, int? code, String error)? error,
  }) {
    switch (this) {
      case Success<T?>():
        return success?.call(((this as Success).data));
      case Error<T>():
        return error?.call(
          (this as Error<T>).type,
          (this as Error<T>).errorCode,
          (this as Error<T>).message,
        );
      default:
        return error?.call(DioExceptionType.unknown, null, toString());
    }
  }
}

class Success<T> extends Result<T> {
  T? data;
  Success(this.data);
}

class Error<T> extends Result<T> {
  int? errorCode;
  DioExceptionType type;
  String message;

  Error({
    this.type = DioExceptionType.unknown,
    required this.message,
    this.errorCode,
  });
}
