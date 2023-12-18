part of repositories;

sealed class YoutubeRepository {
  Future<Result<YoutubeVideoModel>> getListVideo({
    String? pageToken,
  });
}

class YoutubeRepositoryIml extends BaseRepository implements YoutubeRepository {
  final _service = YoutubeService(
    HttpClient.dio,
    baseUrl: 'https://www.googleapis.com/youtube/v3',
  );

  @override
  Future<Result<YoutubeVideoModel>> getListVideo({String? pageToken}) async {
    try {
      final response = await _service.getListVideo(pageToken: pageToken);
      return Success(response);
    } on DioExceptionType catch (exception) {
      return Error(
        type: exception,
        message: exception.toString(),
      );
    } catch (e) {
      return Error(
        type: DioExceptionType.unknown,
        message: e.toString(),
      );
    }
  }
}
