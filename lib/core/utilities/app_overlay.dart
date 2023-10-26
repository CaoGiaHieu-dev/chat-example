import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/context_extension.dart';

class AppOverlay {
  AppOverlay._();
  factory AppOverlay() => _instance;
  static final AppOverlay _instance = AppOverlay._();

  bool showedOverlay = false;

  OverlayEntry? overlayEntry;
  Timer? timer;

  static removeOverlayNotify() {
    _instance.overlayEntry?.remove();
    _instance.overlayEntry = null;
    _instance.timer?.cancel();
    _instance.timer = null;
  }

  static void showOverlayNotify(
    BuildContext context, {
    required String content,
    int duration = 2,
  }) {
    if (_instance.showedOverlay) {
      removeOverlayNotify();
    }
    _instance.overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return UnconstrainedBox(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: context.width - (16.w * 2),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.black.withOpacity(0.7),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 28.w,
              vertical: 12.h,
            ),
            child: Text(
              content,
              style: context.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(_instance.overlayEntry!);
    _instance.showedOverlay = true;

    _instance.timer = Timer.periodic(Duration(seconds: duration), (timer) {
      removeOverlayNotify();
      timer.cancel();
    });
  }
}
