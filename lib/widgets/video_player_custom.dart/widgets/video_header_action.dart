import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:video_player/video_player.dart';

import '../../../core/extensions/context_extension.dart';

class VideoHeaderAction extends StatefulWidget {
  const VideoHeaderAction(
    this.controller, {
    super.key,
    this.colors = const VideoProgressColors(
      playedColor: Color.fromARGB(120, 255, 255, 255),
      bufferedColor: Color.fromRGBO(30, 30, 200, 0.2),
      backgroundColor: Color.fromRGBO(32, 32, 29, 0.5),
    ),
    this.handleColor = const Color(0xffCACACB),
    this.padding = const EdgeInsets.only(top: 5.0),
    required this.isFullScreen,
    this.onFullScreenPress,
  });

  final Color handleColor;
  final VideoPlayerController controller;
  final VideoProgressColors colors;
  final EdgeInsets padding;
  final bool isFullScreen;
  final VoidCallback? onFullScreenPress;

  @override
  State<VideoHeaderAction> createState() => _VideoHeaderActionState();
}

class _VideoHeaderActionState extends State<VideoHeaderAction> {
  VideoPlayerController get controller => widget.controller;

  VideoProgressColors get colors => widget.colors;

  final soundKey = GlobalKey();

  @override
  void initState() {
    FlutterVolumeController.addListener(onVolumeChange);
    super.initState();
  }

  void onVolumeChange(double value) {
    controller.setVolume(value);
  }

  @override
  void reassemble() {
    FlutterVolumeController.removeListener();
    FlutterVolumeController.addListener(onVolumeChange);

    super.reassemble();
  }

  @override
  void deactivate() {
    FlutterVolumeController.removeListener();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Row(
        children: [
          MaterialButton(
            minWidth: 0,
            color: colors.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            onPressed: () {
              widget.onFullScreenPress?.call();
            },
            child: Icon(
              widget.isFullScreen
                  ? CupertinoIcons.fullscreen_exit
                  : CupertinoIcons.fullscreen,
              color: widget.handleColor,
              size: 15.r,
            ),
          ),
          const Spacer(),
          MaterialButton(
            key: soundKey,
            minWidth: 0,
            color: colors.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            onPressed: () {
              soundKey.showDropDown<int>(
                context,
                alignment: Alignment.center,
                option: [0, 25, 50, 75, 100],
                onTap: (value) {
                  if (value == null) return;
                  FlutterVolumeController.setVolume(value / 100);
                },
              );
            },
            child: ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, value, _) {
                return Icon(
                  value.volume == 0
                      ? CupertinoIcons.volume_off
                      : value.volume <= 0.5
                          ? CupertinoIcons.volume_mute
                          : value.volume > 0.5 && value.volume < 0.8
                              ? CupertinoIcons.volume_down
                              : CupertinoIcons.volume_up,
                  color: widget.handleColor,
                  size: 15.r,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
