import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import 'widgets/center_play_button.dart';
import 'widgets/video_header_action.dart';
import 'widgets/video_process.dart';

class VideoPlayerCustom extends StatefulWidget {
  const VideoPlayerCustom({
    super.key,
    required this.controller,
    this.colors = const VideoProgressColors(
      playedColor: Color.fromARGB(120, 255, 255, 255),
      bufferedColor: Color.fromRGBO(30, 30, 200, 0.2),
      backgroundColor: Color.fromRGBO(32, 32, 29, 0.5),
    ),
    this.bottomSheetBuildContext,
    this.isFullScreen = false,
    this.onFullScreenOptionTap,
    this.handleColor = const Color(0xffCACACB),
  });

  final VideoPlayerController controller;
  final VideoProgressColors colors;
  final BuildContext? bottomSheetBuildContext;
  final bool isFullScreen;
  final ValueChanged<bool>? onFullScreenOptionTap;
  final Color handleColor;

  @override
  State<VideoPlayerCustom> createState() => _VideoPlayerCustomState();
}

class _VideoPlayerCustomState extends State<VideoPlayerCustom> {
  VideoPlayerController get videoPlayerController => widget.controller;

  double get ratio => widget.isFullScreen
      ? 1 / widget.controller.value.aspectRatio
      : widget.controller.value.aspectRatio;

  bool hideOption = false;

  Timer? timer;

  bool played = false;

  @override
  void initState() {
    videoPlayerController.addListener(onVideoChange);

    super.initState();
  }

  @override
  void reassemble() {
    videoPlayerController.removeListener(onVideoChange);
    videoPlayerController.addListener(onVideoChange);
    super.reassemble();
  }

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }

  @override
  void deactivate() {
    videoPlayerController.removeListener(onVideoChange);
    super.deactivate();
  }

  void onVideoChange() {
    if (videoPlayerController.value.isPlaying == played) return;
    played = videoPlayerController.value.isPlaying;
    setHideStatus(played);
  }

  void cancelTimer() {
    timer?.cancel();
    timer = null;
  }

  void setHideStatus(bool status) {
    cancelTimer();
    timer = Timer.periodic(
      const Duration(seconds: 3),
      (_) {
        cancelTimer();
        setState(() {
          hideOption = status;
        });
      },
    );
  }

  void forceShowOption() async {
    setState(() {
      hideOption = false;
    });
    await WidgetsBinding.instance.endOfFrame;
    setHideStatus(true);
  }

  Widget _opacityWarper(Widget child) {
    return AnimatedOpacity(
      duration: kThemeAnimationDuration,
      opacity: hideOption ? 0 : 1,
      child: AbsorbPointer(
        absorbing: hideOption,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: forceShowOption,
      child: ValueListenableBuilder(
        valueListenable: videoPlayerController,
        builder: (context, value, child) {
          return Stack(
            children: [
              child!,
              _opacityWarper(
                CenterPlayButton(
                  videoPlayerController,
                  colors: widget.colors,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: _opacityWarper(
                  VideoHeaderAction(
                    videoPlayerController,
                    colors: widget.colors,
                    handleColor: widget.handleColor,
                    onFullScreenPress: () {
                      widget.onFullScreenOptionTap?.call(
                        !widget.isFullScreen,
                      );
                    },
                    isFullScreen: widget.isFullScreen,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _opacityWarper(
                  VideoProcess(
                    videoPlayerController,
                    colors: widget.colors,
                    handleColor: widget.handleColor,
                    bottomSheetBuildContext: widget.bottomSheetBuildContext,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    allowScrubbing: true,
                  ),
                ),
              ),
            ],
          );
        },
        child: Center(
          child: AspectRatio(
            aspectRatio: widget.controller.value.aspectRatio,
            child: VideoPlayer(videoPlayerController),
          ),
        ),
      ),
    );
  }
}
