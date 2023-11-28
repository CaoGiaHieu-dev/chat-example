// ignore_for_file: invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed(copyWith: true)
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'uid') String? uid,
    String? email,
    @JsonKey(name: 'displayName') String? displayName,
    @JsonKey(name: 'photoURL') String? imagePath,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic>? json) =>
      _$UserModelFromJson(json ?? {});
}
