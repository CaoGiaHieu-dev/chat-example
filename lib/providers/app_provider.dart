import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import '../router/app_routes.dart';

class AppProvider extends ChangeNotifier {
  bool loading = false;

  void showLoading() async {
    loading = true;
    notifyListeners();
  }

  void hideLoading() async {
    loading = false;
    notifyListeners();
  }
}
