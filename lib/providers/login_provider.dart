import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/utilities/app_utils.dart';
import '../core/utilities/utilities.dart';
import '../router/app_routes.dart';
import '../router/extra/login_extra.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider({
    LoginExtra? extra,
  }) {
    emailController.text = extra?.email ?? 'test@gmail.com';
    passController.text = extra?.password ?? '123456';
  }

  final key = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  void login(BuildContext context) async {
    if (key.currentState?.validate() ?? false) {
      try {
        AppUtils.showLoading();
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );
        AppUtils.hideLoading();

        if (context.mounted) {
          const HomeRoute().go(context);
        }
      } catch (e) {
        key.currentState?.reset();
        AppLogger.print(e.toString());
        AppUtils.showToast(e.toString());
      } finally {
        AppUtils.hideLoading();
      }
    }
  }
}
