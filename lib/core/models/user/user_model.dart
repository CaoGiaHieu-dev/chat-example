// ignore_for_file: invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../base/base_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed(copyWith: true)
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: '_id') OptionsId? optionId,
    String? email,
    String? password,
    @JsonKey(name: 'display_name') String? displayName,
    String? token,
    @Uint8ListConverter() Uint8List? image,
    @JsonKey(name: 'image_path') String? imagePath,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class OptionsId with _$OptionsId {
  const factory OptionsId({
    @JsonKey(name: r'$oid') required String id,
  }) = _OptionsId;

  factory OptionsId.fromJson(Map<String, dynamic> json) =>
      _$OptionsIdFromJson(json);
}

mixin UserModelMixin on UserModel {
  String get id => optionId?.id ?? '';
}
