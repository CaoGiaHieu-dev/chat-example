import 'package:flutter/widgets.dart';

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
