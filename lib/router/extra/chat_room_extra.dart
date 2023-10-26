import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_extra.freezed.dart';
part 'chat_room_extra.g.dart';

@freezed
class ChatRoomExtra with _$ChatRoomExtra {
  const factory ChatRoomExtra({
    required String username,
  }) = _ChatRoomExtra;

  factory ChatRoomExtra.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomExtraFromJson(json);
}
