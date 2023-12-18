// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names, unused_element, unused_field, prefer_const_declarations

part of 'youtube_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YoutubeVideoModelImpl _$$YoutubeVideoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$YoutubeVideoModelImpl(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      nextPageToken: json['nextPageToken'] as String?,
      prevPageToken: json['prevPageToken'] as String?,
      regionCode: json['regionCode'] as String?,
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemsVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$YoutubeVideoModelImplToJson(
        _$YoutubeVideoModelImpl instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'prevPageToken': instance.prevPageToken,
      'regionCode': instance.regionCode,
      'pageInfo': instance.pageInfo,
      'items': instance.items,
    };

_$PageInfoImpl _$$PageInfoImplFromJson(Map<String, dynamic> json) =>
    _$PageInfoImpl(
      totalResults: json['totalResults'] as int?,
      resultsPerPage: json['resultsPerPage'] as int?,
    );

Map<String, dynamic> _$$PageInfoImplToJson(_$PageInfoImpl instance) =>
    <String, dynamic>{
      'totalResults': instance.totalResults,
      'resultsPerPage': instance.resultsPerPage,
    };

_$ItemsVideoImpl _$$ItemsVideoImplFromJson(Map<String, dynamic> json) =>
    _$ItemsVideoImpl(
      kind: json['kind'] as String?,
      etag: json['etag'] as String?,
      id: json['id'] == null
          ? null
          : Id.fromJson(json['id'] as Map<String, dynamic>),
      snippet: json['snippet'] == null
          ? null
          : Snippet.fromJson(json['snippet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ItemsVideoImplToJson(_$ItemsVideoImpl instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'id': instance.id,
      'snippet': instance.snippet,
    };

_$IdImpl _$$IdImplFromJson(Map<String, dynamic> json) => _$IdImpl(
      kind: json['kind'] as String?,
      videoId: json['videoId'] as String?,
    );

Map<String, dynamic> _$$IdImplToJson(_$IdImpl instance) => <String, dynamic>{
      'kind': instance.kind,
      'videoId': instance.videoId,
    };

_$SnippetImpl _$$SnippetImplFromJson(Map<String, dynamic> json) =>
    _$SnippetImpl(
      publishedAt: json['publishedAt'] as String?,
      channelId: json['channelId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      thumbnails: json['thumbnails'] == null
          ? null
          : Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
      channelTitle: json['channelTitle'] as String?,
      liveBroadcastContent: json['liveBroadcastContent'] as String?,
      publishTime: json['publishTime'] as String?,
    );

Map<String, dynamic> _$$SnippetImplToJson(_$SnippetImpl instance) =>
    <String, dynamic>{
      'publishedAt': instance.publishedAt,
      'channelId': instance.channelId,
      'title': instance.title,
      'description': instance.description,
      'thumbnails': instance.thumbnails,
      'channelTitle': instance.channelTitle,
      'liveBroadcastContent': instance.liveBroadcastContent,
      'publishTime': instance.publishTime,
    };

_$ThumbnailsImpl _$$ThumbnailsImplFromJson(Map<String, dynamic> json) =>
    _$ThumbnailsImpl(
      defaultProperty: json['default'] == null
          ? null
          : Default.fromJson(json['default'] as Map<String, dynamic>),
      medium: json['medium'] == null
          ? null
          : Medium.fromJson(json['medium'] as Map<String, dynamic>),
      high: json['high'] == null
          ? null
          : High.fromJson(json['high'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ThumbnailsImplToJson(_$ThumbnailsImpl instance) =>
    <String, dynamic>{
      'default': instance.defaultProperty,
      'medium': instance.medium,
      'high': instance.high,
    };

_$DefaultImpl _$$DefaultImplFromJson(Map<String, dynamic> json) =>
    _$DefaultImpl(
      url: json['url'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$$DefaultImplToJson(_$DefaultImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

_$MediumImpl _$$MediumImplFromJson(Map<String, dynamic> json) => _$MediumImpl(
      url: json['url'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$$MediumImplToJson(_$MediumImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

_$HighImpl _$$HighImplFromJson(Map<String, dynamic> json) => _$HighImpl(
      url: json['url'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$$HighImplToJson(_$HighImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
