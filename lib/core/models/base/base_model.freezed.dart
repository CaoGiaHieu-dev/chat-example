// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BaseModel<T> _$BaseModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _BaseModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$BaseModel<T> {
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_stamp')
  int get timestamp => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseModelCopyWith<T, BaseModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseModelCopyWith<T, $Res> {
  factory $BaseModelCopyWith(
          BaseModel<T> value, $Res Function(BaseModel<T>) then) =
      _$BaseModelCopyWithImpl<T, $Res, BaseModel<T>>;
  @useResult
  $Res call(
      {int status,
      @JsonKey(name: 'time_stamp') int timestamp,
      T? data,
      String? message});
}

/// @nodoc
class _$BaseModelCopyWithImpl<T, $Res, $Val extends BaseModel<T>>
    implements $BaseModelCopyWith<T, $Res> {
  _$BaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timestamp = null,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseModelImplCopyWith<T, $Res>
    implements $BaseModelCopyWith<T, $Res> {
  factory _$$BaseModelImplCopyWith(
          _$BaseModelImpl<T> value, $Res Function(_$BaseModelImpl<T>) then) =
      __$$BaseModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {int status,
      @JsonKey(name: 'time_stamp') int timestamp,
      T? data,
      String? message});
}

/// @nodoc
class __$$BaseModelImplCopyWithImpl<T, $Res>
    extends _$BaseModelCopyWithImpl<T, $Res, _$BaseModelImpl<T>>
    implements _$$BaseModelImplCopyWith<T, $Res> {
  __$$BaseModelImplCopyWithImpl(
      _$BaseModelImpl<T> _value, $Res Function(_$BaseModelImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? timestamp = null,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$BaseModelImpl<T>(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$BaseModelImpl<T> implements _BaseModel<T> {
  const _$BaseModelImpl(
      {required this.status,
      @JsonKey(name: 'time_stamp') required this.timestamp,
      this.data,
      this.message});

  factory _$BaseModelImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$BaseModelImplFromJson(json, fromJsonT);

  @override
  final int status;
  @override
  @JsonKey(name: 'time_stamp')
  final int timestamp;
  @override
  final T? data;
  @override
  final String? message;

  @override
  String toString() {
    return 'BaseModel<$T>(status: $status, timestamp: $timestamp, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseModelImpl<T> &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, timestamp,
      const DeepCollectionEquality().hash(data), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseModelImplCopyWith<T, _$BaseModelImpl<T>> get copyWith =>
      __$$BaseModelImplCopyWithImpl<T, _$BaseModelImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$BaseModelImplToJson<T>(this, toJsonT);
  }
}

abstract class _BaseModel<T> implements BaseModel<T> {
  const factory _BaseModel(
      {required final int status,
      @JsonKey(name: 'time_stamp') required final int timestamp,
      final T? data,
      final String? message}) = _$BaseModelImpl<T>;

  factory _BaseModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$BaseModelImpl<T>.fromJson;

  @override
  int get status;
  @override
  @JsonKey(name: 'time_stamp')
  int get timestamp;
  @override
  T? get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$BaseModelImplCopyWith<T, _$BaseModelImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
