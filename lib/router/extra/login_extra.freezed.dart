// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_extra.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginExtra _$LoginExtraFromJson(Map<String, dynamic> json) {
  return _LoginExtra.fromJson(json);
}

/// @nodoc
mixin _$LoginExtra {
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginExtraCopyWith<LoginExtra> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginExtraCopyWith<$Res> {
  factory $LoginExtraCopyWith(
          LoginExtra value, $Res Function(LoginExtra) then) =
      _$LoginExtraCopyWithImpl<$Res, LoginExtra>;
  @useResult
  $Res call({String? email, String? password});
}

/// @nodoc
class _$LoginExtraCopyWithImpl<$Res, $Val extends LoginExtra>
    implements $LoginExtraCopyWith<$Res> {
  _$LoginExtraCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginExtraImplCopyWith<$Res>
    implements $LoginExtraCopyWith<$Res> {
  factory _$$LoginExtraImplCopyWith(
          _$LoginExtraImpl value, $Res Function(_$LoginExtraImpl) then) =
      __$$LoginExtraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? email, String? password});
}

/// @nodoc
class __$$LoginExtraImplCopyWithImpl<$Res>
    extends _$LoginExtraCopyWithImpl<$Res, _$LoginExtraImpl>
    implements _$$LoginExtraImplCopyWith<$Res> {
  __$$LoginExtraImplCopyWithImpl(
      _$LoginExtraImpl _value, $Res Function(_$LoginExtraImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$LoginExtraImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginExtraImpl implements _LoginExtra {
  const _$LoginExtraImpl({this.email, this.password});

  factory _$LoginExtraImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginExtraImplFromJson(json);

  @override
  final String? email;
  @override
  final String? password;

  @override
  String toString() {
    return 'LoginExtra(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginExtraImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginExtraImplCopyWith<_$LoginExtraImpl> get copyWith =>
      __$$LoginExtraImplCopyWithImpl<_$LoginExtraImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginExtraImplToJson(
      this,
    );
  }
}

abstract class _LoginExtra implements LoginExtra {
  const factory _LoginExtra({final String? email, final String? password}) =
      _$LoginExtraImpl;

  factory _LoginExtra.fromJson(Map<String, dynamic> json) =
      _$LoginExtraImpl.fromJson;

  @override
  String? get email;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginExtraImplCopyWith<_$LoginExtraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
