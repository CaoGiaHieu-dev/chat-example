library repositories;

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../router/app_routes.dart';
import '../http_client/http_client.dart';
import '../models/base/base_model.dart';
import '../models/result_model.dart';
import '../models/user/user_model.dart';
import '../models/youtube_video/youtube_video_model.dart';
import '../services/auth_service.dart';
import '../services/youtube_service.dart';

export '../models/base/base_model.dart';

part 'auth_repositories.dart';
part 'youtube_repositories.dart';

abstract class BaseRepository {
  Future<Result<BaseModel<T>>> request<T>(
    Future<BaseModel<T>> call,
  ) async {
    try {
      final response = await call;

      if (response.isExpiredToken) {
        final context = AppRouter.currentContext;
        if (context.mounted) {
          const LoginRoute().go(context);
        }
      }

      return Success(response);
    } on DioExceptionType catch (exception) {
      return Error(
        type: exception,
        message: exception.toString(),
      );
    } catch (e) {
      return Error(
        type: DioExceptionType.unknown,
        message: e.toString(),
      );
    }
  }
}

class Repositories {
  Repositories._();
  static AuthRepository auth = AuthRepositoryIml();
  static YoutubeRepository youtube = YoutubeRepositoryIml();
}
