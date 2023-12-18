import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/models/youtube_video/youtube_video_model.dart';
import '../core/repositories/base_repositories.dart';
import '../core/utilities/app_utils.dart';
import '../router/app_routes.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    WidgetsBinding.instance.endOfFrame.whenComplete(() {
      listenOnOffset();
    });
  }

  final loadingHeight = ValueNotifier(0.0);
  final loadingSize = ValueNotifier(0.0);
  final isStartLoading = ValueNotifier(false);
  final scroll = ScrollController();

  bool isLoading = false;

  YoutubeVideoModel? get resultYoutube => _resultYoutube;
  set resultYoutube(YoutubeVideoModel? value) {
    _resultYoutube = value;
    notifyListeners();
  }

  YoutubeVideoModel? _resultYoutube;

  @override
  void dispose() {
    scroll.dispose();
    super.dispose();
  }

  void listenOnOffset() {
    scroll.removeListener(updateLoading);
    scroll.removeListener(loadingMore);
    if (scroll.hasClients) {
      scroll.addListener(updateLoading);
      scroll.addListener(loadingMore);
    }
  }

  void loadingMore() {
    if (scroll.position.pixels >= scroll.position.maxScrollExtent) {
      getListVideo(pageToken: _resultYoutube?.nextPageToken);
    }
  }

  void updateLoading() async {
    if (isStartLoading.value) return;

    if (scroll.offset < 0) {
      loadingHeight.value = max(
        scroll.offset,
        -50.h,
      );
      loadingSize.value = max(
        scroll.offset / 50.h,
        -1,
      );
    } else {
      loadingHeight.value = 0;
      loadingSize.value = 0;
    }
  }

  Future<void> startRefresh() async {
    if (scroll.offset > -50.h) return;
    await updateScrollUpdateOffset(-50.h);

    if (isStartLoading.value) return;
    isStartLoading.value = scroll.offset == -50.h;

    await WidgetsBinding.instance.endOfFrame;

    await getListVideo();

    isStartLoading.value = false;

    updateScrollUpdateOffset(0);
  }

  Future<void> updateScrollUpdateOffset(double offset) async {
    await scroll.animateTo(
      offset,
      duration: kThemeAnimationDuration,
      curve: Curves.linear,
    );
    updateLoading();
  }

  void gotoChat(BuildContext context) {
    const ChatLobbyRoute().go(context);
  }

  Future<void> getListVideo({String? pageToken}) async {
    if (isLoading) return;
    isLoading = true;

    final result = await Repositories.youtube.getListVideo(
      pageToken: pageToken,
    );

    result.when(
      success: (data) {
        if (pageToken?.isNotEmpty ?? false) {
          resultYoutube = resultYoutube?.copyWith(
            items: [
              ...?resultYoutube?.items,
              ...?data?.items,
            ],
          );
        } else {
          resultYoutube = data;
        }
      },
      error: (type, code, error) {
        AppUtils.showToast(error);
      },
    );

    isLoading = false;
  }
}
