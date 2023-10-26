library repositories;

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../router/app_routes.dart';
import '../http_client/http_client.dart';
import '../models/base/base_model.dart';
import '../models/base/error_type.dart';
import '../models/result_model.dart';
import '../models/user/user_model.dart';
import '../services/auth_service.dart';

export '../models/base/base_model.dart';

part 'auth_repositories.dart';

typedef CallBack<Data> = Future Function(Data? data);

abstract class BaseRepository {
  Future<Result<BaseModel<T>>> request<T>(Future<BaseModel<T>> call) async {
    ErrorType toErrorType(DioExceptionType type) {
      return switch (type) {
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

    try {
      final response = await call;

      if (response.isExpiredToken) {
        final context = AppRouter.currentContext;
        if (context.mounted) {
          const LoginRoute().replace(context);
        }
      }

      return Success(response);
    } on DioExceptionType catch (exception) {
      switch (exception) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.badCertificate:
        case DioExceptionType.badResponse:
        case DioExceptionType.cancel:
        case DioExceptionType.connectionError:
        case DioExceptionType.unknown:
          return Error(
            type: toErrorType(exception),
            message: exception.toString(),
          );
      }
    } catch (e) {
      return Error(
        type: ErrorType.other,
        message: e.toString(),
      );
    }
  }
}

class Repositories {
  Repositories._();
  static AuthRepository auth = AuthRepositoryIml();
}
