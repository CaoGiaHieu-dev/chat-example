// ignore_for_file: invalid_annotation_target

import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_model.freezed.dart';
part 'base_model.g.dart';

@Freezed(genericArgumentFactories: true)
class BaseModel<T> with _$BaseModel<T> {
  const factory BaseModel({
    required int status,
    @JsonKey(name: 'time_stamp') required int timestamp,
    T? data,
    String? message,
  }) = _BaseModel;

  factory BaseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$BaseModelFromJson(json, fromJsonT);
}

extension ResponseStatus<T> on BaseModel<T> {
  bool get isSuccess => status == 200;
  bool get isExpiredToken => status == 401;
  DateTime get time => DateTime.fromMillisecondsSinceEpoch(timestamp);
}

class Uint8ListConverter implements JsonConverter<Uint8List?, List<int>?> {
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(List<int>? json) {
    return json == null ? null : Uint8List.fromList(json);
  }

  @override
  List<int>? toJson(Uint8List? object) {
    return object?.toList();
  }
}
