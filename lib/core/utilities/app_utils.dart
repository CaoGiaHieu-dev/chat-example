import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/app_routes.dart';
import '../../widgets/dialogs/loading_widget.dart';
import 'app_overlay.dart';

class AppUtils {
  AppUtils._();

  static bool isShowLoading = false;

  static void unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static showToast(String message) {
    AppOverlay.showOverlayNotify(
      AppRouter.currentContext,
      content: message,
      duration: 3,
    );
  }

  static void showLoading() {
    if (isShowLoading) return;
    isShowLoading = true;
    showDialog(
      context: AppRouter.currentContext,
      builder: (context) {
        return const LoadingWidget();
      },
    );
  }

  static void hideLoading() {
    if (isShowLoading) {
      if (AppRouter.currentContext.canPop()) {
        AppRouter.currentContext.pop();
      }
      isShowLoading = false;
    }
  }
}
