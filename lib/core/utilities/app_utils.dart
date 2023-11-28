import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_provider.dart';
import '../../router/app_routes.dart';
import 'app_overlay.dart';

class AppUtils {
  AppUtils._();

  static void unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static showToast(
    String message, [
    BuildContext? context,
    int second = 2,
  ]) {
    AppOverlay.showOverlayNotify(
      context ?? AppRouter.currentContext,
      content: message,
      second: second,
    );
  }

  static void showLoading() {
    AppRouter.currentContext.read<AppProvider>().showLoading();
  }

  static void hideLoading() {
    AppRouter.currentContext.read<AppProvider>().hideLoading();
  }
}
