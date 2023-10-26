// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: '_id')
  OptionsId? get optionId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_path')
  String? get imagePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') OptionsId? optionId,
      String? email,
      String? password,
      @JsonKey(name: 'display_name') String? displayName,
      String? token,
      @Uint8ListConverter() Uint8List? image,
      @JsonKey(name: 'image_path') String? imagePath});

  $OptionsIdCopyWith<$Res>? get optionId;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionId = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? displayName = freezed,
    Object? token = freezed,
    Object? image = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_value.copyWith(
      optionId: freezed == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as OptionsId?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OptionsIdCopyWith<$Res>? get optionId {
    if (_value.optionId == null) {
      return null;
    }

    return $OptionsIdCopyWith<$Res>(_value.optionId!, (value) {
      return _then(_value.copyWith(optionId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') OptionsId? optionId,
      String? email,
      String? password,
      @JsonKey(name: 'display_name') String? displayName,
      String? token,
      @Uint8ListConverter() Uint8List? image,
      @JsonKey(name: 'image_path') String? imagePath});

  @override
  $OptionsIdCopyWith<$Res>? get optionId;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionId = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? displayName = freezed,
    Object? token = freezed,
    Object? image = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_$UserModelImpl(
      optionId: freezed == optionId
          ? _value.optionId
          : optionId // ignore: cast_nullable_to_non_nullable
              as OptionsId?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl with DiagnosticableTreeMixin implements _UserModel {
  const _$UserModelImpl(
      {@JsonKey(name: '_id') this.optionId,
      this.email,
      this.password,
      @JsonKey(name: 'display_name') this.displayName,
      this.token,
      @Uint8ListConverter() this.image,
      @JsonKey(name: 'image_path') this.imagePath});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final OptionsId? optionId;
  @override
  final String? email;
  @override
  final String? password;
  @override
  @JsonKey(name: 'display_name')
  final String? displayName;
  @override
  final String? token;
  @override
  @Uint8ListConverter()
  final Uint8List? image;
  @override
  @JsonKey(name: 'image_path')
  final String? imagePath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(optionId: $optionId, email: $email, password: $password, displayName: $displayName, token: $token, image: $image, imagePath: $imagePath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('optionId', optionId))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('imagePath', imagePath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.optionId, optionId) ||
                other.optionId == optionId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.token, token) || other.token == token) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      optionId,
      email,
      password,
      displayName,
      token,
      const DeepCollectionEquality().hash(image),
      imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {@JsonKey(name: '_id') final OptionsId? optionId,
      final String? email,
      final String? password,
      @JsonKey(name: 'display_name') final String? displayName,
      final String? token,
      @Uint8ListConverter() final Uint8List? image,
      @JsonKey(name: 'image_path') final String? imagePath}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  OptionsId? get optionId;
  @override
  String? get email;
  @override
  String? get password;
  @override
  @JsonKey(name: 'display_name')
  String? get displayName;
  @override
  String? get token;
  @override
  @Uint8ListConverter()
  Uint8List? get image;
  @override
  @JsonKey(name: 'image_path')
  String? get imagePath;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OptionsId _$OptionsIdFromJson(Map<String, dynamic> json) {
  return _OptionsId.fromJson(json);
}

/// @nodoc
mixin _$OptionsId {
  @JsonKey(name: r'$oid')
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionsIdCopyWith<OptionsId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionsIdCopyWith<$Res> {
  factory $OptionsIdCopyWith(OptionsId value, $Res Function(OptionsId) then) =
      _$OptionsIdCopyWithImpl<$Res, OptionsId>;
  @useResult
  $Res call({@JsonKey(name: r'$oid') String id});
}

/// @nodoc
class _$OptionsIdCopyWithImpl<$Res, $Val extends OptionsId>
    implements $OptionsIdCopyWith<$Res> {
  _$OptionsIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionsIdImplCopyWith<$Res>
    implements $OptionsIdCopyWith<$Res> {
  factory _$$OptionsIdImplCopyWith(
          _$OptionsIdImpl value, $Res Function(_$OptionsIdImpl) then) =
      __$$OptionsIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: r'$oid') String id});
}

/// @nodoc
class __$$OptionsIdImplCopyWithImpl<$Res>
    extends _$OptionsIdCopyWithImpl<$Res, _$OptionsIdImpl>
    implements _$$OptionsIdImplCopyWith<$Res> {
  __$$OptionsIdImplCopyWithImpl(
      _$OptionsIdImpl _value, $Res Function(_$OptionsIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$OptionsIdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionsIdImpl with DiagnosticableTreeMixin implements _OptionsId {
  const _$OptionsIdImpl({@JsonKey(name: r'$oid') required this.id});

  factory _$OptionsIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionsIdImplFromJson(json);

  @override
  @JsonKey(name: r'$oid')
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OptionsId(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OptionsId'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionsIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionsIdImplCopyWith<_$OptionsIdImpl> get copyWith =>
      __$$OptionsIdImplCopyWithImpl<_$OptionsIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionsIdImplToJson(
      this,
    );
  }
}

abstract class _OptionsId implements OptionsId {
  const factory _OptionsId({@JsonKey(name: r'$oid') required final String id}) =
      _$OptionsIdImpl;

  factory _OptionsId.fromJson(Map<String, dynamic> json) =
      _$OptionsIdImpl.fromJson;

  @override
  @JsonKey(name: r'$oid')
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$OptionsIdImplCopyWith<_$OptionsIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
