import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/app_provider.dart';
import '../../router/app_routes.dart';
import '../../widgets/dialogs/loading_widget.dart';
import 'app_overlay.dart';

class AppUtils {
  AppUtils._();

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
    AppRouter.currentContext.read<AppProvider>().showLoading();
  }

  static void hideLoading() {
    AppRouter.currentContext.read<AppProvider>().hideLoading();
  }
}
