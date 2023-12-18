import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../models/youtube_video/youtube_video_model.dart';

part 'youtube_service.g.dart';

@RestApi()
@FormUrlEncoded()
abstract class YoutubeService {
  factory YoutubeService(Dio apiClient, {String baseUrl}) = _YoutubeService;

  @GET('/search')
  Future<YoutubeVideoModel> getListVideo({
    @Query('pageToken') String? pageToken,
    @Query('part') String part = 'snippet',
    @Query('channelId') String channelId = 'UCA_23dkEYToAc37hjSsCnXA',
    @Query('key') String key = 'AIzaSyB1lsP6IP8cJzLMl3OG1-mYU-DBZNS6HYU',
    @Query('maxResults') int maxResults = 10,
  });
}
