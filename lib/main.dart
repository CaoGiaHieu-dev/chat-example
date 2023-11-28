import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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

  await Firebase.initializeApp();
}
