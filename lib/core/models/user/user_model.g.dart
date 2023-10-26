// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names, unused_element, unused_field, prefer_const_declarations

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      optionId: json['_id'] == null
          ? null
          : OptionsId.fromJson(json['_id'] as Map<String, dynamic>),
      email: json['email'] as String?,
      password: json['password'] as String?,
      displayName: json['display_name'] as String?,
      token: json['token'] as String?,
      image: const Uint8ListConverter().fromJson(json['image'] as List<int>?),
      imagePath: json['image_path'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.optionId,
      'email': instance.email,
      'password': instance.password,
      'display_name': instance.displayName,
      'token': instance.token,
      'image': const Uint8ListConverter().toJson(instance.image),
      'image_path': instance.imagePath,
    };

_$OptionsIdImpl _$$OptionsIdImplFromJson(Map<String, dynamic> json) =>
    _$OptionsIdImpl(
      id: json[r'$oid'] as String,
    );

Map<String, dynamic> _$$OptionsIdImplToJson(_$OptionsIdImpl instance) =>
    <String, dynamic>{
      r'$oid': instance.id,
    };
