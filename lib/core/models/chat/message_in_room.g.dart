// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names, unused_element, unused_field, prefer_const_declarations

part of 'message_in_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageInRoomImpl _$$MessageInRoomImplFromJson(Map<String, dynamic> json) =>
    _$MessageInRoomImpl(
      senderId: json['sender_id'] as String,
      message: json['message'] as String? ?? '',
      createAt: json['create_at'] as int?,
    );

Map<String, dynamic> _$$MessageInRoomImplToJson(_$MessageInRoomImpl instance) =>
    <String, dynamic>{
      'sender_id': instance.senderId,
      'message': instance.message,
      'create_at': instance.createAt,
    };
