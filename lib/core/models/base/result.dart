import 'error_type.dart';

sealed class Result<T> {
  void when({
    void Function(T? data)? success,
    void Function(ErrorType type, int? code, String error)? error,
  }) {
    switch (this) {
      case Success<T>():
        success?.call(((this as Success).data));
        break;
      case Error<T>():
        error?.call(
          (this as Error<T>).type,
          (this as Error<T>).errorCode,
          (this as Error<T>).message.toString(),
        );
        break;
    }
  }
}

class Success<T> extends Result<T> {
  T? data;

  Success(this.data);
}

class Error<T> extends Result<T> {
  int? errorCode;
  ErrorType type;
  String message;

  Error({required this.type, required this.message, this.errorCode});

  bool get isTimeOut => type == ErrorType.timeOut;
}
