import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_extra.freezed.dart';
part 'login_extra.g.dart';

@freezed
class LoginExtra with _$LoginExtra {
  const factory LoginExtra({
    String? email,
    String? password,
  }) = _LoginExtra;

  factory LoginExtra.fromJson(Map<String, dynamic> json) =>
      _$LoginExtraFromJson(json);
}
