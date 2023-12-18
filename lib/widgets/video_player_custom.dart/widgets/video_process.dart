import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../core/extensions/context_extension.dart';

class VideoProcess extends StatefulWidget {
  const VideoProcess(
    this.controller, {
    super.key,
    this.colors = const VideoProgressColors(
      playedColor: Color.fromARGB(120, 255, 255, 255),
      bufferedColor: Color.fromRGBO(30, 30, 200, 0.2),
      backgroundColor: Color.fromRGBO(32, 32, 29, 0.5),
    ),
    required this.allowScrubbing,
    this.padding = const EdgeInsets.only(top: 5.0),
    this.handleColor = const Color(0xffCACACB),
    this.bottomSheetBuildContext,
  });

  final VideoPlayerController controller;
  final VideoProgressColors colors;
  final bool allowScrubbing;
  final EdgeInsets padding;
  final Color handleColor;
  final BuildContext? bottomSheetBuildContext;

  @override
  State<VideoProcess> createState() => _VideoProcessState();
}

class _VideoProcessState extends State<VideoProcess> {
  VideoPlayerController get controller => widget.controller;

  VideoProgressColors get colors => widget.colors;

  String _convertDuration(Duration duration) {
    String negativeSign = duration.isNegative ? '-' : '';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    return "$negativeSign${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  Future<void> goBackward_15(VideoPlayerValue value) async {
    final beginning = Duration.zero.inMilliseconds;
    final skip = (value.position - const Duration(seconds: 15)).inMilliseconds;
    await controller.seekTo(
      Duration(milliseconds: max(skip, beginning)),
    );

    Future.delayed(const Duration(milliseconds: 1000), () {
      controller.setPlaybackSpeed(1);
    });
  }

  Future<void> goForward_15(VideoPlayerValue value) async {
    final end = value.duration.inMilliseconds;
    final skip = (value.position + const Duration(seconds: 15)).inMilliseconds;

    await controller.seekTo(
      Duration(milliseconds: min(skip, end)),
    );

    Future.delayed(const Duration(milliseconds: 1000), () {
      controller.setPlaybackSpeed(1);
    });
  }

  void showSettingBottom() {
    final speedOptionKey = GlobalKey();
    showModalBottomSheet(
      constraints: BoxConstraints(
        maxHeight: context.height * 2 / 5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.r),
        ),
      ),
      context: widget.bottomSheetBuildContext ?? context,
      builder: (context) {
        return ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, _) {
            return _SettingBottomSheet(
              options: [
                _BottomSheetItem(
                  key: speedOptionKey,
                  title: 'Speed',
                  subtitle: '${value.playbackSpeed}',
                  onPressed: () {
                    speedOptionKey.showDropDown<double>(
                      context,
                      onTap: (value) {
                        if (value == null) return;
                        controller.setPlaybackSpeed(value);
                      },
                      option: [0.5, 0.25, 1, 1.25, 1.5, 2],
                    );
                  },
                  icon: Icon(
                    Icons.speed,
                    size: 30.r,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16.r);
    return Container(
      margin: widget.padding,
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
        color: colors.backgroundColor,
        borderRadius: borderRadius,
      ),
      child: ValueListenableBuilder(
        valueListenable: widget.controller,
        builder: (context, value, _) {
          final process = LinearProgressIndicator(
            value:
                value.position.inMilliseconds / value.duration.inMilliseconds,
            borderRadius: borderRadius,
            minHeight: 8.h,
            valueColor: AlwaysStoppedAnimation<Color>(colors.playedColor),
            backgroundColor: colors.playedColor,
          );

          return Row(
            children: [
              _ButtonIcon(
                onPressed: () {
                  goBackward_15(value);
                },
                color: widget.handleColor,
                icon: const Icon(CupertinoIcons.gobackward_15),
              ),
              SizedBox(width: 5.w),
              _ButtonIcon(
                onPressed: () {
                  if (value.isPlaying) {
                    widget.controller.pause();
                  } else {
                    widget.controller.play();
                  }
                },
                color: widget.handleColor,
                icon: Icon(
                  value.isPlaying
                      ? CupertinoIcons.pause
                      : CupertinoIcons.play_arrow,
                  color: widget.handleColor,
                ),
              ),
              SizedBox(width: 5.w),
              _ButtonIcon(
                onPressed: () {
                  goForward_15(value);
                },
                color: widget.handleColor,
                icon: const Icon(CupertinoIcons.goforward_15),
              ),
              SizedBox(width: 10.w),
              Text(
                '${_convertDuration(value.position)} / ${_convertDuration(value.duration)}',
                style: context.labelSmall.copyWith(
                  fontSize: 10.sp,
                  color: widget.handleColor,
                ),
              ),
              SizedBox(width: 5.w),
              Expanded(
                child: VideoScrubber(
                  controller: controller,
                  child: process,
                ),
              ),
              SizedBox(width: 5.w),
              _ButtonIcon(
                onPressed: () {
                  showSettingBottom();
                },
                color: widget.handleColor,
                icon: const Icon(Icons.settings),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ButtonIcon extends StatelessWidget {
  const _ButtonIcon({
    required this.onPressed,
    required this.color,
    required this.icon,
  });
  final VoidCallback onPressed;
  final Color color;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 25.r,
      child: IconButton(
        iconSize: 20.r,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        color: color,
        icon: icon,
      ),
    );
  }
}

class _BottomSheetItem {
  final Key? key;
  final String title;
  final String? subtitle;
  final VoidCallback onPressed;
  final Widget icon;

  _BottomSheetItem({
    this.key,
    this.subtitle,
    required this.title,
    required this.onPressed,
    required this.icon,
  });
}

class _SettingBottomSheet extends StatefulWidget {
  const _SettingBottomSheet({
    Key? key,
    required this.options,
  }) : super(key: key);

  final List<_BottomSheetItem> options;

  @override
  __SettingBottomSheetState createState() => __SettingBottomSheetState();
}

class __SettingBottomSheetState extends State<_SettingBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            width: 80.w,
            height: 3.h,
            decoration: BoxDecoration(
              color: context.dividerColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.options.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = widget.options[index];
                return MaterialButton(
                  key: item.key,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  onPressed: item.onPressed,
                  child: Row(
                    children: [
                      item.icon,
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: context.bodyLarge,
                            ),
                            SizedBox(height: 5.h),
                            if (item.subtitle != null) Text(item.subtitle!),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
