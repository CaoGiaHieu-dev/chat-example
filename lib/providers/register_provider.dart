import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/models/user/user_model.dart';
import '../core/utilities/app_dialog.dart';
import '../core/utilities/app_utils.dart';
import '../router/app_routes.dart';
import '../router/extra/login_extra.dart';

class RegisterProvider extends ChangeNotifier {
  final key = GlobalKey<FormState>();

  final emailController = TextEditingController(text: 'test@gmail.com');
  final passController = TextEditingController(text: '123456');

  final users = FirebaseFirestore.instance.collection('users');

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  void register(BuildContext context) async {
    if (key.currentState?.validate() ?? false) {
      AppUtils.showLoading();

      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );

        final user = UserModel(
          uid: credential.user?.uid,
          displayName: credential.user?.displayName ?? credential.user?.email,
          email: credential.user?.email,
        );

        await users.add(user.toJson());

        AppDialog.showDialogDetail(
          title: 'Success',
          content: 'You account have been created',
          onTap: () {
            context.pop();
            LoginRoute(
              $extra: LoginExtra(
                email: emailController.text,
                password: passController.text,
              ),
            ).replace(context);
          },
        );
      } on FirebaseAuthException catch (e) {
        AppDialog.showDialogDetail(
          title: 'Error',
          content: e.message ?? e.toString(),
        );
      } catch (e) {
        AppDialog.showDialogDetail(
          title: 'Error',
          content: e.toString(),
        );
      } finally {
        key.currentState?.reset();

        AppUtils.hideLoading();
      }
    }
  }
}
