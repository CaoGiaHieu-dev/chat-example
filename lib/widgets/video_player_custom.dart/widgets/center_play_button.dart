import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class CenterPlayButton extends StatefulWidget {
  const CenterPlayButton(
    this.controller, {
    super.key,
    this.colors = const VideoProgressColors(
      playedColor: Color.fromARGB(120, 255, 255, 255),
      bufferedColor: Color.fromRGBO(30, 30, 200, 0.2),
      backgroundColor: Color.fromRGBO(32, 32, 29, 0.5),
    ),
  });

  final VideoPlayerController controller;
  final VideoProgressColors colors;

  @override
  State<CenterPlayButton> createState() => _CenterPlayButtonState();
}

class _CenterPlayButtonState extends State<CenterPlayButton> {
  VideoPlayerController get controller => widget.controller;

  VideoProgressColors get colors => widget.colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        shape: const CircleBorder(),
        color: colors.backgroundColor,
        padding: EdgeInsets.all(16.r),
        onPressed: () {
          if (controller.value.isPlaying) {
            controller.pause();
          } else {
            controller.play();
          }
        },
        child: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, _) {
            return AnimatedCrossFade(
              firstChild: Icon(
                CupertinoIcons.play_arrow_solid,
                color: colors.playedColor,
              ),
              secondChild: Icon(
                CupertinoIcons.pause_fill,
                color: colors.playedColor,
              ),
              crossFadeState: value.isPlaying
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            );
          },
        ),
      ),
    );
  }
}
