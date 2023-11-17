// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_extra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatRoomExtra _$ChatRoomExtraFromJson(Map<String, dynamic> json) {
  return _ChatRoomExtra.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomExtra {
  UserModel get withUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomExtraCopyWith<ChatRoomExtra> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomExtraCopyWith<$Res> {
  factory $ChatRoomExtraCopyWith(
          ChatRoomExtra value, $Res Function(ChatRoomExtra) then) =
      _$ChatRoomExtraCopyWithImpl<$Res, ChatRoomExtra>;
  @useResult
  $Res call({UserModel withUser});

  $UserModelCopyWith<$Res> get withUser;
}

/// @nodoc
class _$ChatRoomExtraCopyWithImpl<$Res, $Val extends ChatRoomExtra>
    implements $ChatRoomExtraCopyWith<$Res> {
  _$ChatRoomExtraCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withUser = null,
  }) {
    return _then(_value.copyWith(
      withUser: null == withUser
          ? _value.withUser
          : withUser // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get withUser {
    return $UserModelCopyWith<$Res>(_value.withUser, (value) {
      return _then(_value.copyWith(withUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatRoomExtraImplCopyWith<$Res>
    implements $ChatRoomExtraCopyWith<$Res> {
  factory _$$ChatRoomExtraImplCopyWith(
          _$ChatRoomExtraImpl value, $Res Function(_$ChatRoomExtraImpl) then) =
      __$$ChatRoomExtraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserModel withUser});

  @override
  $UserModelCopyWith<$Res> get withUser;
}

/// @nodoc
class __$$ChatRoomExtraImplCopyWithImpl<$Res>
    extends _$ChatRoomExtraCopyWithImpl<$Res, _$ChatRoomExtraImpl>
    implements _$$ChatRoomExtraImplCopyWith<$Res> {
  __$$ChatRoomExtraImplCopyWithImpl(
      _$ChatRoomExtraImpl _value, $Res Function(_$ChatRoomExtraImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withUser = null,
  }) {
    return _then(_$ChatRoomExtraImpl(
      withUser: null == withUser
          ? _value.withUser
          : withUser // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomExtraImpl implements _ChatRoomExtra {
  const _$ChatRoomExtraImpl({required this.withUser});

  factory _$ChatRoomExtraImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomExtraImplFromJson(json);

  @override
  final UserModel withUser;

  @override
  String toString() {
    return 'ChatRoomExtra(withUser: $withUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomExtraImpl &&
            (identical(other.withUser, withUser) ||
                other.withUser == withUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, withUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomExtraImplCopyWith<_$ChatRoomExtraImpl> get copyWith =>
      __$$ChatRoomExtraImplCopyWithImpl<_$ChatRoomExtraImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomExtraImplToJson(
      this,
    );
  }
}

abstract class _ChatRoomExtra implements ChatRoomExtra {
  const factory _ChatRoomExtra({required final UserModel withUser}) =
      _$ChatRoomExtraImpl;

  factory _ChatRoomExtra.fromJson(Map<String, dynamic> json) =
      _$ChatRoomExtraImpl.fromJson;

  @override
  UserModel get withUser;
  @override
  @JsonKey(ignore: true)
  _$$ChatRoomExtraImplCopyWith<_$ChatRoomExtraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
