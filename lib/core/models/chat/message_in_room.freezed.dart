// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_in_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageInRoom _$MessageInRoomFromJson(Map<String, dynamic> json) {
  return _MessageInRoom.fromJson(json);
}

/// @nodoc
mixin _$MessageInRoom {
  @JsonKey(name: 'sender_id')
  String get senderId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_at')
  int? get createAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageInRoomCopyWith<MessageInRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageInRoomCopyWith<$Res> {
  factory $MessageInRoomCopyWith(
          MessageInRoom value, $Res Function(MessageInRoom) then) =
      _$MessageInRoomCopyWithImpl<$Res, MessageInRoom>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sender_id') String senderId,
      String message,
      @JsonKey(name: 'create_at') int? createAt});
}

/// @nodoc
class _$MessageInRoomCopyWithImpl<$Res, $Val extends MessageInRoom>
    implements $MessageInRoomCopyWith<$Res> {
  _$MessageInRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? message = null,
    Object? createAt = freezed,
  }) {
    return _then(_value.copyWith(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageInRoomImplCopyWith<$Res>
    implements $MessageInRoomCopyWith<$Res> {
  factory _$$MessageInRoomImplCopyWith(
          _$MessageInRoomImpl value, $Res Function(_$MessageInRoomImpl) then) =
      __$$MessageInRoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sender_id') String senderId,
      String message,
      @JsonKey(name: 'create_at') int? createAt});
}

/// @nodoc
class __$$MessageInRoomImplCopyWithImpl<$Res>
    extends _$MessageInRoomCopyWithImpl<$Res, _$MessageInRoomImpl>
    implements _$$MessageInRoomImplCopyWith<$Res> {
  __$$MessageInRoomImplCopyWithImpl(
      _$MessageInRoomImpl _value, $Res Function(_$MessageInRoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? message = null,
    Object? createAt = freezed,
  }) {
    return _then(_$MessageInRoomImpl(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: freezed == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageInRoomImpl
    with DiagnosticableTreeMixin
    implements _MessageInRoom {
  const _$MessageInRoomImpl(
      {@JsonKey(name: 'sender_id') required this.senderId,
      this.message = '',
      @JsonKey(name: 'create_at') this.createAt});

  factory _$MessageInRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageInRoomImplFromJson(json);

  @override
  @JsonKey(name: 'sender_id')
  final String senderId;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey(name: 'create_at')
  final int? createAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageInRoom(senderId: $senderId, message: $message, createAt: $createAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageInRoom'))
      ..add(DiagnosticsProperty('senderId', senderId))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('createAt', createAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageInRoomImpl &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, senderId, message, createAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageInRoomImplCopyWith<_$MessageInRoomImpl> get copyWith =>
      __$$MessageInRoomImplCopyWithImpl<_$MessageInRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageInRoomImplToJson(
      this,
    );
  }
}

abstract class _MessageInRoom implements MessageInRoom {
  const factory _MessageInRoom(
      {@JsonKey(name: 'sender_id') required final String senderId,
      final String message,
      @JsonKey(name: 'create_at') final int? createAt}) = _$MessageInRoomImpl;

  factory _MessageInRoom.fromJson(Map<String, dynamic> json) =
      _$MessageInRoomImpl.fromJson;

  @override
  @JsonKey(name: 'sender_id')
  String get senderId;
  @override
  String get message;
  @override
  @JsonKey(name: 'create_at')
  int? get createAt;
  @override
  @JsonKey(ignore: true)
  _$$MessageInRoomImplCopyWith<_$MessageInRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
