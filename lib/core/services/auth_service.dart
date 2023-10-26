import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../constants.dart';
import '../models/base/base_model.dart';
import '../models/user/user_model.dart';

part 'auth_service.g.dart';

@RestApi()
@FormUrlEncoded()
abstract class AuthService {
  factory AuthService(Dio apiClient, {String baseUrl}) = _AuthService;

  @POST(ApiUtils.login)
  Future<BaseModel<UserModel>> login(
    @Body() Map<String, dynamic> request,
  );

  @POST(ApiUtils.register)
  Future<BaseModel<UserModel>> register(
    @Body() Map<String, dynamic> request,
  );

  @GET(ApiUtils.info)
  Future<BaseModel<UserModel>> getInfo();

  @POST(ApiUtils.updateUser)
  Future<BaseModel<UserModel>> updateInfo(
    @Body() Map<String, dynamic> request,
  );

  @POST(ApiUtils.renewToken)
  Future<BaseModel<UserModel>> renewToken();
}
