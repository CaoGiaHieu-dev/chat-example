import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../core/utilities/app_utils.dart';
import '../core/utilities/storage.dart';
import '../core/utilities/utilities.dart';
import '../router/app_routes.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    init();
  }
  User? get userDetail => _userDetail;
  set userDetail(value) {
    _userDetail = value;
    notifyListeners();
  }

  User? _userDetail;

  StreamSubscription<User?>? _userSubscription;

  void init() {
    _userSubscription = FirebaseAuth.instance.userChanges().listen((event) {
      AppLogger.print(event, tag: 'userChanges');
      userDetail = event;
    });
  }

  @override
  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }

  Future<void> getUserDetail() async {
    await FirebaseAuth.instance.currentUser?.reload();
  }

  Future<void> logout(BuildContext context) async {
    AppUtils.showLoading();

    await FirebaseAuth.instance.signOut();

    AppUtils.hideLoading();

    if (context.mounted) {
      const LoginRoute().go(context);
    }
  }

  void editProfile() async {
    AppUtils.showLoading();

    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (image != null) {
      try {
        final result = Storage.uploadUserImage(
          userDetail?.uid ?? '',
          image.path,
        );

        result.snapshotEvents.listen((event) async {
          AppLogger.print('$event', tag: 'Upload image');
          switch (event.state) {
            case TaskState.running:
              break;
            case TaskState.success:
              final path = await event.ref.getDownloadURL();
              await userDetail?.updatePhotoURL(path);
              AppUtils.hideLoading();
              break;
            case TaskState.error:
            case TaskState.canceled:
            case TaskState.paused:
              AppUtils.showToast(event.state.toString());
              AppUtils.hideLoading();
          }
        });
      } catch (e) {
        AppUtils.showToast(e.toString());
        AppUtils.showLoading();
      }
    }
  }
}
