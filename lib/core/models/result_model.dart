import 'base/error_type.dart';

sealed class Result<T> {
  R? when<R>({
    R Function(T? data)? success,
    R Function(ErrorType type, int? code, String error)? error,
  }) {
    if (this is Success<T?>) {
      return success?.call(((this as Success).data));
    } else if (this is Error<T>) {
      return error?.call(
        (this as Error<T>).type,
        (this as Error<T>).errorCode,
        (this as Error<T>).message,
      );
    } else {
      return error?.call(ErrorType.other, null, toString());
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

  Error({this.type = ErrorType.other, required this.message, this.errorCode});
}
