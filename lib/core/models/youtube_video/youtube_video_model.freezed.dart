// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtube_video_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

YoutubeVideoModel _$YoutubeVideoModelFromJson(Map<String, dynamic> json) {
  return _YoutubeVideoModel.fromJson(json);
}

/// @nodoc
mixin _$YoutubeVideoModel {
  @JsonKey(name: 'kind')
  String? get kind => throw _privateConstructorUsedError;
  @JsonKey(name: 'etag')
  String? get etag => throw _privateConstructorUsedError;
  @JsonKey(name: 'nextPageToken')
  String? get nextPageToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'prevPageToken')
  String? get prevPageToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'regionCode')
  String? get regionCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'items')
  List<ItemsVideo>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YoutubeVideoModelCopyWith<YoutubeVideoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubeVideoModelCopyWith<$Res> {
  factory $YoutubeVideoModelCopyWith(
          YoutubeVideoModel value, $Res Function(YoutubeVideoModel) then) =
      _$YoutubeVideoModelCopyWithImpl<$Res, YoutubeVideoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'kind') String? kind,
      @JsonKey(name: 'etag') String? etag,
      @JsonKey(name: 'nextPageToken') String? nextPageToken,
      @JsonKey(name: 'prevPageToken') String? prevPageToken,
      @JsonKey(name: 'regionCode') String? regionCode,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo,
      @JsonKey(name: 'items') List<ItemsVideo>? items});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$YoutubeVideoModelCopyWithImpl<$Res, $Val extends YoutubeVideoModel>
    implements $YoutubeVideoModelCopyWith<$Res> {
  _$YoutubeVideoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? etag = freezed,
    Object? nextPageToken = freezed,
    Object? prevPageToken = freezed,
    Object? regionCode = freezed,
    Object? pageInfo = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      etag: freezed == etag
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String?,
      nextPageToken: freezed == nextPageToken
          ? _value.nextPageToken
          : nextPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      prevPageToken: freezed == prevPageToken
          ? _value.prevPageToken
          : prevPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      regionCode: freezed == regionCode
          ? _value.regionCode
          : regionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemsVideo>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PageInfoCopyWith<$Res>? get pageInfo {
    if (_value.pageInfo == null) {
      return null;
    }

    return $PageInfoCopyWith<$Res>(_value.pageInfo!, (value) {
      return _then(_value.copyWith(pageInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$YoutubeVideoModelImplCopyWith<$Res>
    implements $YoutubeVideoModelCopyWith<$Res> {
  factory _$$YoutubeVideoModelImplCopyWith(_$YoutubeVideoModelImpl value,
          $Res Function(_$YoutubeVideoModelImpl) then) =
      __$$YoutubeVideoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'kind') String? kind,
      @JsonKey(name: 'etag') String? etag,
      @JsonKey(name: 'nextPageToken') String? nextPageToken,
      @JsonKey(name: 'prevPageToken') String? prevPageToken,
      @JsonKey(name: 'regionCode') String? regionCode,
      @JsonKey(name: 'pageInfo') PageInfo? pageInfo,
      @JsonKey(name: 'items') List<ItemsVideo>? items});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$$YoutubeVideoModelImplCopyWithImpl<$Res>
    extends _$YoutubeVideoModelCopyWithImpl<$Res, _$YoutubeVideoModelImpl>
    implements _$$YoutubeVideoModelImplCopyWith<$Res> {
  __$$YoutubeVideoModelImplCopyWithImpl(_$YoutubeVideoModelImpl _value,
      $Res Function(_$YoutubeVideoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? etag = freezed,
    Object? nextPageToken = freezed,
    Object? prevPageToken = freezed,
    Object? regionCode = freezed,
    Object? pageInfo = freezed,
    Object? items = freezed,
  }) {
    return _then(_$YoutubeVideoModelImpl(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      etag: freezed == etag
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String?,
      nextPageToken: freezed == nextPageToken
          ? _value.nextPageToken
          : nextPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      prevPageToken: freezed == prevPageToken
          ? _value.prevPageToken
          : prevPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      regionCode: freezed == regionCode
          ? _value.regionCode
          : regionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemsVideo>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YoutubeVideoModelImpl implements _YoutubeVideoModel {
  const _$YoutubeVideoModelImpl(
      {@JsonKey(name: 'kind') this.kind,
      @JsonKey(name: 'etag') this.etag,
      @JsonKey(name: 'nextPageToken') this.nextPageToken,
      @JsonKey(name: 'prevPageToken') this.prevPageToken,
      @JsonKey(name: 'regionCode') this.regionCode,
      @JsonKey(name: 'pageInfo') this.pageInfo,
      @JsonKey(name: 'items') final List<ItemsVideo>? items})
      : _items = items;

  factory _$YoutubeVideoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$YoutubeVideoModelImplFromJson(json);

  @override
  @JsonKey(name: 'kind')
  final String? kind;
  @override
  @JsonKey(name: 'etag')
  final String? etag;
  @override
  @JsonKey(name: 'nextPageToken')
  final String? nextPageToken;
  @override
  @JsonKey(name: 'prevPageToken')
  final String? prevPageToken;
  @override
  @JsonKey(name: 'regionCode')
  final String? regionCode;
  @override
  @JsonKey(name: 'pageInfo')
  final PageInfo? pageInfo;
  final List<ItemsVideo>? _items;
  @override
  @JsonKey(name: 'items')
  List<ItemsVideo>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'YoutubeVideoModel(kind: $kind, etag: $etag, nextPageToken: $nextPageToken, prevPageToken: $prevPageToken, regionCode: $regionCode, pageInfo: $pageInfo, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YoutubeVideoModelImpl &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.etag, etag) || other.etag == etag) &&
            (identical(other.nextPageToken, nextPageToken) ||
                other.nextPageToken == nextPageToken) &&
            (identical(other.prevPageToken, prevPageToken) ||
                other.prevPageToken == prevPageToken) &&
            (identical(other.regionCode, regionCode) ||
                other.regionCode == regionCode) &&
            (identical(other.pageInfo, pageInfo) ||
                other.pageInfo == pageInfo) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      kind,
      etag,
      nextPageToken,
      prevPageToken,
      regionCode,
      pageInfo,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YoutubeVideoModelImplCopyWith<_$YoutubeVideoModelImpl> get copyWith =>
      __$$YoutubeVideoModelImplCopyWithImpl<_$YoutubeVideoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YoutubeVideoModelImplToJson(
      this,
    );
  }
}

abstract class _YoutubeVideoModel implements YoutubeVideoModel {
  const factory _YoutubeVideoModel(
          {@JsonKey(name: 'kind') final String? kind,
          @JsonKey(name: 'etag') final String? etag,
          @JsonKey(name: 'nextPageToken') final String? nextPageToken,
          @JsonKey(name: 'prevPageToken') final String? prevPageToken,
          @JsonKey(name: 'regionCode') final String? regionCode,
          @JsonKey(name: 'pageInfo') final PageInfo? pageInfo,
          @JsonKey(name: 'items') final List<ItemsVideo>? items}) =
      _$YoutubeVideoModelImpl;

  factory _YoutubeVideoModel.fromJson(Map<String, dynamic> json) =
      _$YoutubeVideoModelImpl.fromJson;

  @override
  @JsonKey(name: 'kind')
  String? get kind;
  @override
  @JsonKey(name: 'etag')
  String? get etag;
  @override
  @JsonKey(name: 'nextPageToken')
  String? get nextPageToken;
  @override
  @JsonKey(name: 'prevPageToken')
  String? get prevPageToken;
  @override
  @JsonKey(name: 'regionCode')
  String? get regionCode;
  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo;
  @override
  @JsonKey(name: 'items')
  List<ItemsVideo>? get items;
  @override
  @JsonKey(ignore: true)
  _$$YoutubeVideoModelImplCopyWith<_$YoutubeVideoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PageInfo _$PageInfoFromJson(Map<String, dynamic> json) {
  return _PageInfo.fromJson(json);
}

/// @nodoc
mixin _$PageInfo {
  @JsonKey(name: 'totalResults')
  int? get totalResults => throw _privateConstructorUsedError;
  @JsonKey(name: 'resultsPerPage')
  int? get resultsPerPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageInfoCopyWith<PageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageInfoCopyWith<$Res> {
  factory $PageInfoCopyWith(PageInfo value, $Res Function(PageInfo) then) =
      _$PageInfoCopyWithImpl<$Res, PageInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'totalResults') int? totalResults,
      @JsonKey(name: 'resultsPerPage') int? resultsPerPage});
}

/// @nodoc
class _$PageInfoCopyWithImpl<$Res, $Val extends PageInfo>
    implements $PageInfoCopyWith<$Res> {
  _$PageInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalResults = freezed,
    Object? resultsPerPage = freezed,
  }) {
    return _then(_value.copyWith(
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      resultsPerPage: freezed == resultsPerPage
          ? _value.resultsPerPage
          : resultsPerPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageInfoImplCopyWith<$Res>
    implements $PageInfoCopyWith<$Res> {
  factory _$$PageInfoImplCopyWith(
          _$PageInfoImpl value, $Res Function(_$PageInfoImpl) then) =
      __$$PageInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'totalResults') int? totalResults,
      @JsonKey(name: 'resultsPerPage') int? resultsPerPage});
}

/// @nodoc
class __$$PageInfoImplCopyWithImpl<$Res>
    extends _$PageInfoCopyWithImpl<$Res, _$PageInfoImpl>
    implements _$$PageInfoImplCopyWith<$Res> {
  __$$PageInfoImplCopyWithImpl(
      _$PageInfoImpl _value, $Res Function(_$PageInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalResults = freezed,
    Object? resultsPerPage = freezed,
  }) {
    return _then(_$PageInfoImpl(
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      resultsPerPage: freezed == resultsPerPage
          ? _value.resultsPerPage
          : resultsPerPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageInfoImpl implements _PageInfo {
  const _$PageInfoImpl(
      {@JsonKey(name: 'totalResults') this.totalResults,
      @JsonKey(name: 'resultsPerPage') this.resultsPerPage});

  factory _$PageInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageInfoImplFromJson(json);

  @override
  @JsonKey(name: 'totalResults')
  final int? totalResults;
  @override
  @JsonKey(name: 'resultsPerPage')
  final int? resultsPerPage;

  @override
  String toString() {
    return 'PageInfo(totalResults: $totalResults, resultsPerPage: $resultsPerPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageInfoImpl &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            (identical(other.resultsPerPage, resultsPerPage) ||
                other.resultsPerPage == resultsPerPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalResults, resultsPerPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageInfoImplCopyWith<_$PageInfoImpl> get copyWith =>
      __$$PageInfoImplCopyWithImpl<_$PageInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageInfoImplToJson(
      this,
    );
  }
}

abstract class _PageInfo implements PageInfo {
  const factory _PageInfo(
          {@JsonKey(name: 'totalResults') final int? totalResults,
          @JsonKey(name: 'resultsPerPage') final int? resultsPerPage}) =
      _$PageInfoImpl;

  factory _PageInfo.fromJson(Map<String, dynamic> json) =
      _$PageInfoImpl.fromJson;

  @override
  @JsonKey(name: 'totalResults')
  int? get totalResults;
  @override
  @JsonKey(name: 'resultsPerPage')
  int? get resultsPerPage;
  @override
  @JsonKey(ignore: true)
  _$$PageInfoImplCopyWith<_$PageInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemsVideo _$ItemsVideoFromJson(Map<String, dynamic> json) {
  return _ItemsVideo.fromJson(json);
}

/// @nodoc
mixin _$ItemsVideo {
  @JsonKey(name: 'kind')
  String? get kind => throw _privateConstructorUsedError;
  @JsonKey(name: 'etag')
  String? get etag => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  Id? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'snippet')
  Snippet? get snippet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemsVideoCopyWith<ItemsVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemsVideoCopyWith<$Res> {
  factory $ItemsVideoCopyWith(
          ItemsVideo value, $Res Function(ItemsVideo) then) =
      _$ItemsVideoCopyWithImpl<$Res, ItemsVideo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'kind') String? kind,
      @JsonKey(name: 'etag') String? etag,
      @JsonKey(name: 'id') Id? id,
      @JsonKey(name: 'snippet') Snippet? snippet});

  $IdCopyWith<$Res>? get id;
  $SnippetCopyWith<$Res>? get snippet;
}

/// @nodoc
class _$ItemsVideoCopyWithImpl<$Res, $Val extends ItemsVideo>
    implements $ItemsVideoCopyWith<$Res> {
  _$ItemsVideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? etag = freezed,
    Object? id = freezed,
    Object? snippet = freezed,
  }) {
    return _then(_value.copyWith(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      etag: freezed == etag
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Id?,
      snippet: freezed == snippet
          ? _value.snippet
          : snippet // ignore: cast_nullable_to_non_nullable
              as Snippet?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IdCopyWith<$Res>? get id {
    if (_value.id == null) {
      return null;
    }

    return $IdCopyWith<$Res>(_value.id!, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SnippetCopyWith<$Res>? get snippet {
    if (_value.snippet == null) {
      return null;
    }

    return $SnippetCopyWith<$Res>(_value.snippet!, (value) {
      return _then(_value.copyWith(snippet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemsVideoImplCopyWith<$Res>
    implements $ItemsVideoCopyWith<$Res> {
  factory _$$ItemsVideoImplCopyWith(
          _$ItemsVideoImpl value, $Res Function(_$ItemsVideoImpl) then) =
      __$$ItemsVideoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'kind') String? kind,
      @JsonKey(name: 'etag') String? etag,
      @JsonKey(name: 'id') Id? id,
      @JsonKey(name: 'snippet') Snippet? snippet});

  @override
  $IdCopyWith<$Res>? get id;
  @override
  $SnippetCopyWith<$Res>? get snippet;
}

/// @nodoc
class __$$ItemsVideoImplCopyWithImpl<$Res>
    extends _$ItemsVideoCopyWithImpl<$Res, _$ItemsVideoImpl>
    implements _$$ItemsVideoImplCopyWith<$Res> {
  __$$ItemsVideoImplCopyWithImpl(
      _$ItemsVideoImpl _value, $Res Function(_$ItemsVideoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? etag = freezed,
    Object? id = freezed,
    Object? snippet = freezed,
  }) {
    return _then(_$ItemsVideoImpl(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      etag: freezed == etag
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Id?,
      snippet: freezed == snippet
          ? _value.snippet
          : snippet // ignore: cast_nullable_to_non_nullable
              as Snippet?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemsVideoImpl implements _ItemsVideo {
  const _$ItemsVideoImpl(
      {@JsonKey(name: 'kind') this.kind,
      @JsonKey(name: 'etag') this.etag,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'snippet') this.snippet});

  factory _$ItemsVideoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemsVideoImplFromJson(json);

  @override
  @JsonKey(name: 'kind')
  final String? kind;
  @override
  @JsonKey(name: 'etag')
  final String? etag;
  @override
  @JsonKey(name: 'id')
  final Id? id;
  @override
  @JsonKey(name: 'snippet')
  final Snippet? snippet;

  @override
  String toString() {
    return 'ItemsVideo(kind: $kind, etag: $etag, id: $id, snippet: $snippet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemsVideoImpl &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.etag, etag) || other.etag == etag) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.snippet, snippet) || other.snippet == snippet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, kind, etag, id, snippet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemsVideoImplCopyWith<_$ItemsVideoImpl> get copyWith =>
      __$$ItemsVideoImplCopyWithImpl<_$ItemsVideoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemsVideoImplToJson(
      this,
    );
  }
}

abstract class _ItemsVideo implements ItemsVideo {
  const factory _ItemsVideo(
      {@JsonKey(name: 'kind') final String? kind,
      @JsonKey(name: 'etag') final String? etag,
      @JsonKey(name: 'id') final Id? id,
      @JsonKey(name: 'snippet') final Snippet? snippet}) = _$ItemsVideoImpl;

  factory _ItemsVideo.fromJson(Map<String, dynamic> json) =
      _$ItemsVideoImpl.fromJson;

  @override
  @JsonKey(name: 'kind')
  String? get kind;
  @override
  @JsonKey(name: 'etag')
  String? get etag;
  @override
  @JsonKey(name: 'id')
  Id? get id;
  @override
  @JsonKey(name: 'snippet')
  Snippet? get snippet;
  @override
  @JsonKey(ignore: true)
  _$$ItemsVideoImplCopyWith<_$ItemsVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Id _$IdFromJson(Map<String, dynamic> json) {
  return _Id.fromJson(json);
}

/// @nodoc
mixin _$Id {
  @JsonKey(name: 'kind')
  String? get kind => throw _privateConstructorUsedError;
  @JsonKey(name: 'videoId')
  String? get videoId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdCopyWith<Id> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdCopyWith<$Res> {
  factory $IdCopyWith(Id value, $Res Function(Id) then) =
      _$IdCopyWithImpl<$Res, Id>;
  @useResult
  $Res call(
      {@JsonKey(name: 'kind') String? kind,
      @JsonKey(name: 'videoId') String? videoId});
}

/// @nodoc
class _$IdCopyWithImpl<$Res, $Val extends Id> implements $IdCopyWith<$Res> {
  _$IdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? videoId = freezed,
  }) {
    return _then(_value.copyWith(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdImplCopyWith<$Res> implements $IdCopyWith<$Res> {
  factory _$$IdImplCopyWith(_$IdImpl value, $Res Function(_$IdImpl) then) =
      __$$IdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'kind') String? kind,
      @JsonKey(name: 'videoId') String? videoId});
}

/// @nodoc
class __$$IdImplCopyWithImpl<$Res> extends _$IdCopyWithImpl<$Res, _$IdImpl>
    implements _$$IdImplCopyWith<$Res> {
  __$$IdImplCopyWithImpl(_$IdImpl _value, $Res Function(_$IdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? videoId = freezed,
  }) {
    return _then(_$IdImpl(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdImpl implements _Id {
  const _$IdImpl(
      {@JsonKey(name: 'kind') this.kind,
      @JsonKey(name: 'videoId') this.videoId});

  factory _$IdImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdImplFromJson(json);

  @override
  @JsonKey(name: 'kind')
  final String? kind;
  @override
  @JsonKey(name: 'videoId')
  final String? videoId;

  @override
  String toString() {
    return 'Id(kind: $kind, videoId: $videoId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdImpl &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.videoId, videoId) || other.videoId == videoId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, kind, videoId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdImplCopyWith<_$IdImpl> get copyWith =>
      __$$IdImplCopyWithImpl<_$IdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdImplToJson(
      this,
    );
  }
}

abstract class _Id implements Id {
  const factory _Id(
      {@JsonKey(name: 'kind') final String? kind,
      @JsonKey(name: 'videoId') final String? videoId}) = _$IdImpl;

  factory _Id.fromJson(Map<String, dynamic> json) = _$IdImpl.fromJson;

  @override
  @JsonKey(name: 'kind')
  String? get kind;
  @override
  @JsonKey(name: 'videoId')
  String? get videoId;
  @override
  @JsonKey(ignore: true)
  _$$IdImplCopyWith<_$IdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Snippet _$SnippetFromJson(Map<String, dynamic> json) {
  return _Snippet.fromJson(json);
}

/// @nodoc
mixin _$Snippet {
  @JsonKey(name: 'publishedAt')
  String? get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'channelId')
  String? get channelId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnails')
  Thumbnails? get thumbnails => throw _privateConstructorUsedError;
  @JsonKey(name: 'channelTitle')
  String? get channelTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'liveBroadcastContent')
  String? get liveBroadcastContent => throw _privateConstructorUsedError;
  @JsonKey(name: 'publishTime')
  String? get publishTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SnippetCopyWith<Snippet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnippetCopyWith<$Res> {
  factory $SnippetCopyWith(Snippet value, $Res Function(Snippet) then) =
      _$SnippetCopyWithImpl<$Res, Snippet>;
  @useResult
  $Res call(
      {@JsonKey(name: 'publishedAt') String? publishedAt,
      @JsonKey(name: 'channelId') String? channelId,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'thumbnails') Thumbnails? thumbnails,
      @JsonKey(name: 'channelTitle') String? channelTitle,
      @JsonKey(name: 'liveBroadcastContent') String? liveBroadcastContent,
      @JsonKey(name: 'publishTime') String? publishTime});

  $ThumbnailsCopyWith<$Res>? get thumbnails;
}

/// @nodoc
class _$SnippetCopyWithImpl<$Res, $Val extends Snippet>
    implements $SnippetCopyWith<$Res> {
  _$SnippetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publishedAt = freezed,
    Object? channelId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? thumbnails = freezed,
    Object? channelTitle = freezed,
    Object? liveBroadcastContent = freezed,
    Object? publishTime = freezed,
  }) {
    return _then(_value.copyWith(
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      channelId: freezed == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnails: freezed == thumbnails
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as Thumbnails?,
      channelTitle: freezed == channelTitle
          ? _value.channelTitle
          : channelTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      liveBroadcastContent: freezed == liveBroadcastContent
          ? _value.liveBroadcastContent
          : liveBroadcastContent // ignore: cast_nullable_to_non_nullable
              as String?,
      publishTime: freezed == publishTime
          ? _value.publishTime
          : publishTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ThumbnailsCopyWith<$Res>? get thumbnails {
    if (_value.thumbnails == null) {
      return null;
    }

    return $ThumbnailsCopyWith<$Res>(_value.thumbnails!, (value) {
      return _then(_value.copyWith(thumbnails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SnippetImplCopyWith<$Res> implements $SnippetCopyWith<$Res> {
  factory _$$SnippetImplCopyWith(
          _$SnippetImpl value, $Res Function(_$SnippetImpl) then) =
      __$$SnippetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'publishedAt') String? publishedAt,
      @JsonKey(name: 'channelId') String? channelId,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'thumbnails') Thumbnails? thumbnails,
      @JsonKey(name: 'channelTitle') String? channelTitle,
      @JsonKey(name: 'liveBroadcastContent') String? liveBroadcastContent,
      @JsonKey(name: 'publishTime') String? publishTime});

  @override
  $ThumbnailsCopyWith<$Res>? get thumbnails;
}

/// @nodoc
class __$$SnippetImplCopyWithImpl<$Res>
    extends _$SnippetCopyWithImpl<$Res, _$SnippetImpl>
    implements _$$SnippetImplCopyWith<$Res> {
  __$$SnippetImplCopyWithImpl(
      _$SnippetImpl _value, $Res Function(_$SnippetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publishedAt = freezed,
    Object? channelId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? thumbnails = freezed,
    Object? channelTitle = freezed,
    Object? liveBroadcastContent = freezed,
    Object? publishTime = freezed,
  }) {
    return _then(_$SnippetImpl(
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      channelId: freezed == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnails: freezed == thumbnails
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as Thumbnails?,
      channelTitle: freezed == channelTitle
          ? _value.channelTitle
          : channelTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      liveBroadcastContent: freezed == liveBroadcastContent
          ? _value.liveBroadcastContent
          : liveBroadcastContent // ignore: cast_nullable_to_non_nullable
              as String?,
      publishTime: freezed == publishTime
          ? _value.publishTime
          : publishTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SnippetImpl implements _Snippet {
  const _$SnippetImpl(
      {@JsonKey(name: 'publishedAt') this.publishedAt,
      @JsonKey(name: 'channelId') this.channelId,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'thumbnails') this.thumbnails,
      @JsonKey(name: 'channelTitle') this.channelTitle,
      @JsonKey(name: 'liveBroadcastContent') this.liveBroadcastContent,
      @JsonKey(name: 'publishTime') this.publishTime});

  factory _$SnippetImpl.fromJson(Map<String, dynamic> json) =>
      _$$SnippetImplFromJson(json);

  @override
  @JsonKey(name: 'publishedAt')
  final String? publishedAt;
  @override
  @JsonKey(name: 'channelId')
  final String? channelId;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'thumbnails')
  final Thumbnails? thumbnails;
  @override
  @JsonKey(name: 'channelTitle')
  final String? channelTitle;
  @override
  @JsonKey(name: 'liveBroadcastContent')
  final String? liveBroadcastContent;
  @override
  @JsonKey(name: 'publishTime')
  final String? publishTime;

  @override
  String toString() {
    return 'Snippet(publishedAt: $publishedAt, channelId: $channelId, title: $title, description: $description, thumbnails: $thumbnails, channelTitle: $channelTitle, liveBroadcastContent: $liveBroadcastContent, publishTime: $publishTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SnippetImpl &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnails, thumbnails) ||
                other.thumbnails == thumbnails) &&
            (identical(other.channelTitle, channelTitle) ||
                other.channelTitle == channelTitle) &&
            (identical(other.liveBroadcastContent, liveBroadcastContent) ||
                other.liveBroadcastContent == liveBroadcastContent) &&
            (identical(other.publishTime, publishTime) ||
                other.publishTime == publishTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, publishedAt, channelId, title,
      description, thumbnails, channelTitle, liveBroadcastContent, publishTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SnippetImplCopyWith<_$SnippetImpl> get copyWith =>
      __$$SnippetImplCopyWithImpl<_$SnippetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SnippetImplToJson(
      this,
    );
  }
}

abstract class _Snippet implements Snippet {
  const factory _Snippet(
      {@JsonKey(name: 'publishedAt') final String? publishedAt,
      @JsonKey(name: 'channelId') final String? channelId,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'thumbnails') final Thumbnails? thumbnails,
      @JsonKey(name: 'channelTitle') final String? channelTitle,
      @JsonKey(name: 'liveBroadcastContent') final String? liveBroadcastContent,
      @JsonKey(name: 'publishTime') final String? publishTime}) = _$SnippetImpl;

  factory _Snippet.fromJson(Map<String, dynamic> json) = _$SnippetImpl.fromJson;

  @override
  @JsonKey(name: 'publishedAt')
  String? get publishedAt;
  @override
  @JsonKey(name: 'channelId')
  String? get channelId;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'thumbnails')
  Thumbnails? get thumbnails;
  @override
  @JsonKey(name: 'channelTitle')
  String? get channelTitle;
  @override
  @JsonKey(name: 'liveBroadcastContent')
  String? get liveBroadcastContent;
  @override
  @JsonKey(name: 'publishTime')
  String? get publishTime;
  @override
  @JsonKey(ignore: true)
  _$$SnippetImplCopyWith<_$SnippetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Thumbnails _$ThumbnailsFromJson(Map<String, dynamic> json) {
  return _Thumbnails.fromJson(json);
}

/// @nodoc
mixin _$Thumbnails {
  @JsonKey(name: 'default')
  Default? get defaultProperty => throw _privateConstructorUsedError;
  @JsonKey(name: 'medium')
  Medium? get medium => throw _privateConstructorUsedError;
  @JsonKey(name: 'high')
  High? get high => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThumbnailsCopyWith<Thumbnails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThumbnailsCopyWith<$Res> {
  factory $ThumbnailsCopyWith(
          Thumbnails value, $Res Function(Thumbnails) then) =
      _$ThumbnailsCopyWithImpl<$Res, Thumbnails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'default') Default? defaultProperty,
      @JsonKey(name: 'medium') Medium? medium,
      @JsonKey(name: 'high') High? high});

  $DefaultCopyWith<$Res>? get defaultProperty;
  $MediumCopyWith<$Res>? get medium;
  $HighCopyWith<$Res>? get high;
}

/// @nodoc
class _$ThumbnailsCopyWithImpl<$Res, $Val extends Thumbnails>
    implements $ThumbnailsCopyWith<$Res> {
  _$ThumbnailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultProperty = freezed,
    Object? medium = freezed,
    Object? high = freezed,
  }) {
    return _then(_value.copyWith(
      defaultProperty: freezed == defaultProperty
          ? _value.defaultProperty
          : defaultProperty // ignore: cast_nullable_to_non_nullable
              as Default?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as Medium?,
      high: freezed == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as High?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DefaultCopyWith<$Res>? get defaultProperty {
    if (_value.defaultProperty == null) {
      return null;
    }

    return $DefaultCopyWith<$Res>(_value.defaultProperty!, (value) {
      return _then(_value.copyWith(defaultProperty: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MediumCopyWith<$Res>? get medium {
    if (_value.medium == null) {
      return null;
    }

    return $MediumCopyWith<$Res>(_value.medium!, (value) {
      return _then(_value.copyWith(medium: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HighCopyWith<$Res>? get high {
    if (_value.high == null) {
      return null;
    }

    return $HighCopyWith<$Res>(_value.high!, (value) {
      return _then(_value.copyWith(high: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ThumbnailsImplCopyWith<$Res>
    implements $ThumbnailsCopyWith<$Res> {
  factory _$$ThumbnailsImplCopyWith(
          _$ThumbnailsImpl value, $Res Function(_$ThumbnailsImpl) then) =
      __$$ThumbnailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'default') Default? defaultProperty,
      @JsonKey(name: 'medium') Medium? medium,
      @JsonKey(name: 'high') High? high});

  @override
  $DefaultCopyWith<$Res>? get defaultProperty;
  @override
  $MediumCopyWith<$Res>? get medium;
  @override
  $HighCopyWith<$Res>? get high;
}

/// @nodoc
class __$$ThumbnailsImplCopyWithImpl<$Res>
    extends _$ThumbnailsCopyWithImpl<$Res, _$ThumbnailsImpl>
    implements _$$ThumbnailsImplCopyWith<$Res> {
  __$$ThumbnailsImplCopyWithImpl(
      _$ThumbnailsImpl _value, $Res Function(_$ThumbnailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultProperty = freezed,
    Object? medium = freezed,
    Object? high = freezed,
  }) {
    return _then(_$ThumbnailsImpl(
      defaultProperty: freezed == defaultProperty
          ? _value.defaultProperty
          : defaultProperty // ignore: cast_nullable_to_non_nullable
              as Default?,
      medium: freezed == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as Medium?,
      high: freezed == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as High?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThumbnailsImpl implements _Thumbnails {
  const _$ThumbnailsImpl(
      {@JsonKey(name: 'default') this.defaultProperty,
      @JsonKey(name: 'medium') this.medium,
      @JsonKey(name: 'high') this.high});

  factory _$ThumbnailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThumbnailsImplFromJson(json);

  @override
  @JsonKey(name: 'default')
  final Default? defaultProperty;
  @override
  @JsonKey(name: 'medium')
  final Medium? medium;
  @override
  @JsonKey(name: 'high')
  final High? high;

  @override
  String toString() {
    return 'Thumbnails(defaultProperty: $defaultProperty, medium: $medium, high: $high)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThumbnailsImpl &&
            (identical(other.defaultProperty, defaultProperty) ||
                other.defaultProperty == defaultProperty) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.high, high) || other.high == high));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, defaultProperty, medium, high);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThumbnailsImplCopyWith<_$ThumbnailsImpl> get copyWith =>
      __$$ThumbnailsImplCopyWithImpl<_$ThumbnailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThumbnailsImplToJson(
      this,
    );
  }
}

abstract class _Thumbnails implements Thumbnails {
  const factory _Thumbnails(
      {@JsonKey(name: 'default') final Default? defaultProperty,
      @JsonKey(name: 'medium') final Medium? medium,
      @JsonKey(name: 'high') final High? high}) = _$ThumbnailsImpl;

  factory _Thumbnails.fromJson(Map<String, dynamic> json) =
      _$ThumbnailsImpl.fromJson;

  @override
  @JsonKey(name: 'default')
  Default? get defaultProperty;
  @override
  @JsonKey(name: 'medium')
  Medium? get medium;
  @override
  @JsonKey(name: 'high')
  High? get high;
  @override
  @JsonKey(ignore: true)
  _$$ThumbnailsImplCopyWith<_$ThumbnailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Default _$DefaultFromJson(Map<String, dynamic> json) {
  return _Default.fromJson(json);
}

/// @nodoc
mixin _$Default {
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'width')
  int? get width => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  int? get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultCopyWith<Default> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultCopyWith<$Res> {
  factory $DefaultCopyWith(Default value, $Res Function(Default) then) =
      _$DefaultCopyWithImpl<$Res, Default>;
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'width') int? width,
      @JsonKey(name: 'height') int? height});
}

/// @nodoc
class _$DefaultCopyWithImpl<$Res, $Val extends Default>
    implements $DefaultCopyWith<$Res> {
  _$DefaultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefaultImplCopyWith<$Res> implements $DefaultCopyWith<$Res> {
  factory _$$DefaultImplCopyWith(
          _$DefaultImpl value, $Res Function(_$DefaultImpl) then) =
      __$$DefaultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'width') int? width,
      @JsonKey(name: 'height') int? height});
}

/// @nodoc
class __$$DefaultImplCopyWithImpl<$Res>
    extends _$DefaultCopyWithImpl<$Res, _$DefaultImpl>
    implements _$$DefaultImplCopyWith<$Res> {
  __$$DefaultImplCopyWithImpl(
      _$DefaultImpl _value, $Res Function(_$DefaultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_$DefaultImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DefaultImpl implements _Default {
  const _$DefaultImpl(
      {@JsonKey(name: 'url') this.url,
      @JsonKey(name: 'width') this.width,
      @JsonKey(name: 'height') this.height});

  factory _$DefaultImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefaultImplFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'width')
  final int? width;
  @override
  @JsonKey(name: 'height')
  final int? height;

  @override
  String toString() {
    return 'Default(url: $url, width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefaultImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, width, height);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DefaultImplCopyWith<_$DefaultImpl> get copyWith =>
      __$$DefaultImplCopyWithImpl<_$DefaultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefaultImplToJson(
      this,
    );
  }
}

abstract class _Default implements Default {
  const factory _Default(
      {@JsonKey(name: 'url') final String? url,
      @JsonKey(name: 'width') final int? width,
      @JsonKey(name: 'height') final int? height}) = _$DefaultImpl;

  factory _Default.fromJson(Map<String, dynamic> json) = _$DefaultImpl.fromJson;

  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'width')
  int? get width;
  @override
  @JsonKey(name: 'height')
  int? get height;
  @override
  @JsonKey(ignore: true)
  _$$DefaultImplCopyWith<_$DefaultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Medium _$MediumFromJson(Map<String, dynamic> json) {
  return _Medium.fromJson(json);
}

/// @nodoc
mixin _$Medium {
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'width')
  int? get width => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  int? get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediumCopyWith<Medium> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediumCopyWith<$Res> {
  factory $MediumCopyWith(Medium value, $Res Function(Medium) then) =
      _$MediumCopyWithImpl<$Res, Medium>;
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'width') int? width,
      @JsonKey(name: 'height') int? height});
}

/// @nodoc
class _$MediumCopyWithImpl<$Res, $Val extends Medium>
    implements $MediumCopyWith<$Res> {
  _$MediumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediumImplCopyWith<$Res> implements $MediumCopyWith<$Res> {
  factory _$$MediumImplCopyWith(
          _$MediumImpl value, $Res Function(_$MediumImpl) then) =
      __$$MediumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'width') int? width,
      @JsonKey(name: 'height') int? height});
}

/// @nodoc
class __$$MediumImplCopyWithImpl<$Res>
    extends _$MediumCopyWithImpl<$Res, _$MediumImpl>
    implements _$$MediumImplCopyWith<$Res> {
  __$$MediumImplCopyWithImpl(
      _$MediumImpl _value, $Res Function(_$MediumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_$MediumImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediumImpl implements _Medium {
  const _$MediumImpl(
      {@JsonKey(name: 'url') this.url,
      @JsonKey(name: 'width') this.width,
      @JsonKey(name: 'height') this.height});

  factory _$MediumImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediumImplFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'width')
  final int? width;
  @override
  @JsonKey(name: 'height')
  final int? height;

  @override
  String toString() {
    return 'Medium(url: $url, width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediumImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, width, height);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediumImplCopyWith<_$MediumImpl> get copyWith =>
      __$$MediumImplCopyWithImpl<_$MediumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediumImplToJson(
      this,
    );
  }
}

abstract class _Medium implements Medium {
  const factory _Medium(
      {@JsonKey(name: 'url') final String? url,
      @JsonKey(name: 'width') final int? width,
      @JsonKey(name: 'height') final int? height}) = _$MediumImpl;

  factory _Medium.fromJson(Map<String, dynamic> json) = _$MediumImpl.fromJson;

  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'width')
  int? get width;
  @override
  @JsonKey(name: 'height')
  int? get height;
  @override
  @JsonKey(ignore: true)
  _$$MediumImplCopyWith<_$MediumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

High _$HighFromJson(Map<String, dynamic> json) {
  return _High.fromJson(json);
}

/// @nodoc
mixin _$High {
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'width')
  int? get width => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  int? get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HighCopyWith<High> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HighCopyWith<$Res> {
  factory $HighCopyWith(High value, $Res Function(High) then) =
      _$HighCopyWithImpl<$Res, High>;
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'width') int? width,
      @JsonKey(name: 'height') int? height});
}

/// @nodoc
class _$HighCopyWithImpl<$Res, $Val extends High>
    implements $HighCopyWith<$Res> {
  _$HighCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HighImplCopyWith<$Res> implements $HighCopyWith<$Res> {
  factory _$$HighImplCopyWith(
          _$HighImpl value, $Res Function(_$HighImpl) then) =
      __$$HighImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'width') int? width,
      @JsonKey(name: 'height') int? height});
}

/// @nodoc
class __$$HighImplCopyWithImpl<$Res>
    extends _$HighCopyWithImpl<$Res, _$HighImpl>
    implements _$$HighImplCopyWith<$Res> {
  __$$HighImplCopyWithImpl(_$HighImpl _value, $Res Function(_$HighImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_$HighImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HighImpl implements _High {
  const _$HighImpl(
      {@JsonKey(name: 'url') this.url,
      @JsonKey(name: 'width') this.width,
      @JsonKey(name: 'height') this.height});

  factory _$HighImpl.fromJson(Map<String, dynamic> json) =>
      _$$HighImplFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'width')
  final int? width;
  @override
  @JsonKey(name: 'height')
  final int? height;

  @override
  String toString() {
    return 'High(url: $url, width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HighImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, width, height);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HighImplCopyWith<_$HighImpl> get copyWith =>
      __$$HighImplCopyWithImpl<_$HighImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HighImplToJson(
      this,
    );
  }
}

abstract class _High implements High {
  const factory _High(
      {@JsonKey(name: 'url') final String? url,
      @JsonKey(name: 'width') final int? width,
      @JsonKey(name: 'height') final int? height}) = _$HighImpl;

  factory _High.fromJson(Map<String, dynamic> json) = _$HighImpl.fromJson;

  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'width')
  int? get width;
  @override
  @JsonKey(name: 'height')
  int? get height;
  @override
  @JsonKey(ignore: true)
  _$$HighImplCopyWith<_$HighImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
