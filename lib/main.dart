import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/utilities/preferences.dart';
import 'firebase_options.dart';
import 'root.dart';

Future<void> main() async {
  await _initService();
  runApp(const RootApp());
}

Future<void> _initService() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Preferences.setPreferences();
}
