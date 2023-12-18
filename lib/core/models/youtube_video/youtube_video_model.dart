// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'youtube_video_model.freezed.dart';
part 'youtube_video_model.g.dart';

@freezed
class YoutubeVideoModel with _$YoutubeVideoModel {
  const factory YoutubeVideoModel({
    @JsonKey(name: 'kind') String? kind,
    @JsonKey(name: 'etag') String? etag,
    @JsonKey(name: 'nextPageToken') String? nextPageToken,
    @JsonKey(name: 'prevPageToken') String? prevPageToken,
    @JsonKey(name: 'regionCode') String? regionCode,
    @JsonKey(name: 'pageInfo') PageInfo? pageInfo,
    @JsonKey(name: 'items') List<ItemsVideo>? items,
  }) = _YoutubeVideoModel;

  factory YoutubeVideoModel.fromJson(Map<String, Object?> json) =>
      _$YoutubeVideoModelFromJson(json);
}

@freezed
class PageInfo with _$PageInfo {
  const factory PageInfo({
    @JsonKey(name: 'totalResults') int? totalResults,
    @JsonKey(name: 'resultsPerPage') int? resultsPerPage,
  }) = _PageInfo;

  factory PageInfo.fromJson(Map<String, Object?> json) =>
      _$PageInfoFromJson(json);
}

@freezed
class ItemsVideo with _$ItemsVideo {
  const factory ItemsVideo({
    @JsonKey(name: 'kind') String? kind,
    @JsonKey(name: 'etag') String? etag,
    @JsonKey(name: 'id') Id? id,
    @JsonKey(name: 'snippet') Snippet? snippet,
  }) = _ItemsVideo;

  factory ItemsVideo.fromJson(Map<String, Object?> json) =>
      _$ItemsVideoFromJson(json);
}

@freezed
class Id with _$Id {
  const factory Id({
    @JsonKey(name: 'kind') String? kind,
    @JsonKey(name: 'videoId') String? videoId,
  }) = _Id;

  factory Id.fromJson(Map<String, Object?> json) => _$IdFromJson(json);
}

@freezed
class Snippet with _$Snippet {
  const factory Snippet({
    @JsonKey(name: 'publishedAt') String? publishedAt,
    @JsonKey(name: 'channelId') String? channelId,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'thumbnails') Thumbnails? thumbnails,
    @JsonKey(name: 'channelTitle') String? channelTitle,
    @JsonKey(name: 'liveBroadcastContent') String? liveBroadcastContent,
    @JsonKey(name: 'publishTime') String? publishTime,
  }) = _Snippet;

  factory Snippet.fromJson(Map<String, Object?> json) =>
      _$SnippetFromJson(json);
}

@freezed
class Thumbnails with _$Thumbnails {
  const factory Thumbnails({
    @JsonKey(name: 'default') Default? defaultProperty,
    @JsonKey(name: 'medium') Medium? medium,
    @JsonKey(name: 'high') High? high,
  }) = _Thumbnails;

  factory Thumbnails.fromJson(Map<String, Object?> json) =>
      _$ThumbnailsFromJson(json);
}

@freezed
class Default with _$Default {
  const factory Default({
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'width') int? width,
    @JsonKey(name: 'height') int? height,
  }) = _Default;

  factory Default.fromJson(Map<String, Object?> json) =>
      _$DefaultFromJson(json);
}

@freezed
class Medium with _$Medium {
  const factory Medium({
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'width') int? width,
    @JsonKey(name: 'height') int? height,
  }) = _Medium;

  factory Medium.fromJson(Map<String, Object?> json) => _$MediumFromJson(json);
}

@freezed
class High with _$High {
  const factory High({
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'width') int? width,
    @JsonKey(name: 'height') int? height,
  }) = _High;

  factory High.fromJson(Map<String, Object?> json) => _$HighFromJson(json);
}
