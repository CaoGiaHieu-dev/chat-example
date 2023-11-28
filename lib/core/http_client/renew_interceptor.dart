import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../constants.dart';
import '../models/result_model.dart';
import '../models/user/user_model.dart';
import '../repositories/base_repositories.dart';
import 'http_client.dart';

class RenewInterceptors extends Interceptor {
  Completer<Result<BaseModel<UserModel>>>? renewCompleter;

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.requestOptions.path == ApiUtils.renewToken) {
      return handler.next(response);
    }

    if (!response.requestOptions.headers.containsKey('Authorization')) {
      return handler.next(response);
    }

    final baseResponse = BaseModel.fromJson(
      response.data is String ? jsonDecode(response.data) : response.data,
      (json) {},
    );

    if (baseResponse.status == 401) {
      if (renewCompleter == null) {
        renewCompleter = Completer();

        renewCompleter?.complete(
          Repositories.auth.renewToken(),
        );
      }

      return renewToken(response, handler);
    }

    super.onResponse(response, handler);

    // if (renewCompleter?.isCompleted ?? true) {
    //   return super.onResponse(response, handler);
    // }

    // if (response.requestOptions.headers.containsKey('Authorization')) {
    //   bool isRenewTokenComplete = renewCompleter?.isCompleted ?? true;
    //   if (!isRenewTokenComplete) {
    //     return renewToken(response, handler);
    //   }
    // }

    // if (baseResponse.status == 401) {
    //   if (renewCompleter == null) {
    //     renewCompleter = Completer();
    //     renewCompleter?.complete(Repositories.auth.renewToken());
    //   }

    //   return renewToken(response, handler);
    // }
  }

  Future<void> renewToken(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final newToken = await renewCompleter?.future;
    renewCompleter = null;

    if (newToken != null) {
      newToken.when(
        success: (data) async {
          if (data?.isSuccess ?? false) {
            // HttpClient.setTokenHeader(data?.data?.token ?? '');

            final retryResponse = await HttpClient.dio.fetch(
              response.requestOptions.copyWith(
                headers: HttpClient.dio.options.headers,
              ),
            );

            return handler.next(retryResponse);
          }
        },
        error: (type, code, error) {
          HttpClient.removeTokenHeader();
          return handler.next(response);
        },
      );
    }
  }
}
