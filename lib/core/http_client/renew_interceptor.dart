// import 'dart:async';
// import 'dart:convert';

// import 'package:dio/dio.dart';

// import '../constants.dart';
// import '../models/result_model.dart';
// import '../models/user/user_model.dart';
// import '../repositories/base_repositories.dart';
// import '../utilities/app_logger.dart';
// import 'http_client.dart';

// class RenewInterceptors extends Interceptor {
//   Completer<Result<BaseModel<UserModel>>>? renewCompleter;

//   @override
//   Future<void> onResponse(
//     Response response,
//     ResponseInterceptorHandler handler,
//   ) async {
//     AppLogger.print(response.requestOptions.path);

//     if (response.requestOptions.path == ApiUtils.renewToken) {
//       return handler.next(response);
//     }

//     bool isRenewTokenComplete = renewCompleter?.isCompleted ?? true;

//     if (!isRenewTokenComplete) {
//       if (response.requestOptions.headers.containsKey('Authorization')) {
//         return renewToken(response, handler);
//       }
//     }

//     final res =
//         response.data is String ? jsonDecode(response.data) : response.data;

//     final baseResponse = BaseModel.fromJson(res, (json) {});

//     if (baseResponse.status == 401) {
//       if (renewCompleter == null) {
//         renewCompleter = Completer();
//         renewCompleter?.complete(Repositories.auth.renewToken());
//       }

//       return renewToken(response, handler);
//     }

//     super.onResponse(response, handler);
//   }

//   Future<void> renewToken(
//     Response response,
//     ResponseInterceptorHandler handler,
//   ) async {
//     final newToken = await renewCompleter?.future;
//     renewCompleter = null;

//     if (newToken != null) {
//       newToken.when(
//         success: (data) async {
//           if (data?.isSuccess ?? false) {
//             HttpClient.setTokenHeader(data?.data?.token ?? '');
//             final retryResponse = await HttpClient.dio.fetch(
//               response.requestOptions.copyWith(
//                 headers: HttpClient.dio.options.headers,
//               ),
//             );

//             return handler.next(retryResponse);
//           }
//         },
//         error: (type, code, error) {
//           HttpClient.removeTokenHeader();
//           return handler.next(response);
//         },
//       );
//     }
//   }
// }
