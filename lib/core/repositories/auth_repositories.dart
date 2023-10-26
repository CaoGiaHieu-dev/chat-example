part of repositories;

sealed class AuthRepository {
  Future<Result<UserCredential>> login({
    required String email,
    required String password,
  });

  Future<Result<UserCredential>> register({
    required String email,
    required String password,
  });

  Future<Result<BaseModel<UserModel>>> updateInfo(UserModel model);

  Future<Result<BaseModel<UserModel>>> renewToken();
}

class AuthRepositoryIml extends BaseRepository implements AuthRepository {
  final _service = AuthService(HttpClient.dio);

  @override
  Future<Result<UserCredential>> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Success(credential);
    } on FirebaseAuthException catch (e) {
      return Error(
        message: e.message ?? e.toString(),
      );
    } catch (e) {
      return Error(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Result<UserCredential>> register({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Success(credential);
    } on FirebaseAuthException catch (e) {
      return Error(
        message: e.message ?? e.toString(),
      );
    } catch (e) {
      return Error(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Result<BaseModel<UserModel>>> updateInfo(UserModel model) {
    return request(_service.updateInfo(
      model.toJson(),
    ));
  }

  @override
  Future<Result<BaseModel<UserModel>>> renewToken() {
    return request(_service.renewToken());
  }
}
