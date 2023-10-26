import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/repositories/base_repositories.dart';
import '../core/utilities/app_dialog.dart';
import '../core/utilities/app_utils.dart';
import '../router/app_routes.dart';
import '../router/extra/login_extra.dart';

class RegisterProvider extends ChangeNotifier {
  final key = GlobalKey<FormState>();

  final emailController = TextEditingController(text: 'test@gmail.com');
  final passController = TextEditingController(text: '123');

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
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );
        ;

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
        key.currentState?.reset();

        AppUtils.hideLoading();

        AppDialog.showDialogDetail(
          title: 'Error',
          content: e.message ?? e.toString(),
        );
      } catch (e) {
        key.currentState?.reset();

        AppUtils.hideLoading();

        AppDialog.showDialogDetail(
          title: 'Error',
          content: e.toString(),
        );
      } finally {
        AppUtils.hideLoading();
      }

      // final result = await Repositories.auth.register(
      //   email: emailController.text,
      //   password: passController.text,
      // );

      // AppUtils.hideLoading();

      // result.when(
      //   success: (data) {
      //     AppDialog.showDialogDetail(
      //       title: 'Success',
      //       content: 'You account have been created',
      //       onTap: () {
      //         context.pop();
      //         LoginRoute(
      //           $extra: LoginExtra(
      //             email: emailController.text,
      //             password: passController.text,
      //           ),
      //         ).replace(context);
      //       },
      //     );
      //   },
      //   error: (type, code, error) {
      //     key.currentState?.reset();
      //     AppDialog.showDialogDetail(
      //       title: 'Error',
      //       content: error,
      //     );
      //   },
      // );
    }
  }
}
