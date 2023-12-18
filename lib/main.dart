import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'firebase_options.dart';
import 'root.dart';

void main() {
  runZonedGuarded(
    () async {
      await _initService();
      runApp(const RootApp());
    },
    (error, stack) {
      FlutterError.reportError(
        FlutterErrorDetailsForPointerEventDispatcher(
          exception: error,
          stack: stack,
        ),
      );
    },
  );
}

Future<void> _initService() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  await FlutterVolumeController.updateShowSystemUI(true);
}
