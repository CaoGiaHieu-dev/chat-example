// ignore_for_file: invalid_annotation_target

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_in_room.freezed.dart';
part 'message_in_room.g.dart';

@Freezed(copyWith: true)
class MessageInRoom with _$MessageInRoom {
  const factory MessageInRoom({
    @JsonKey(name: 'sender_id') required String senderId,
    @Default('') String message,
    @JsonKey(name: 'create_at') int? createAt,
  }) = _MessageInRoom;

  factory MessageInRoom.fromJson(Map<String, dynamic> json) =>
      _$MessageInRoomFromJson(json);
}

extension MessageInRoomExt on MessageInRoom {
  bool get isSender {
    return senderId == FirebaseAuth.instance.currentUser?.uid;
  }
}
