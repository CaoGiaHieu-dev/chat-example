import 'package:flutter/material.dart';

import '../../router/app_routes.dart';
import '../../widgets/dialogs/dialog.dart';

class AppDialog {
  AppDialog._();

  static void showDialogDetail({
    String? title,
    required String content,
    bool willPopScope = false,
    void Function()? onTap,
  }) {
    showDialog(
      context: AppRouter.currentContext,
      builder: (context) {
        return DetailDialog(
          onTap: onTap,
          title: title ?? 'Detail',
          subtitle: content,
          willPopScope: willPopScope,
        );
      },
    );
  }

  static void showDialogWarning({
    String? title,
    required String content,
    bool willPopScope = false,
    void Function()? onAccept,
    void Function()? onCancel,
  }) {
    showDialog(
      context: AppRouter.currentContext,
      builder: (context) {
        return WarningDialog(
          onAccept: onAccept,
          onCancel: onCancel,
          title: title ?? 'Warning',
          subtitle: content,
          willPopScope: willPopScope,
        );
      },
    );
  }
}
