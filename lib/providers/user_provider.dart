import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../core/models/user/user_model.dart';
import '../core/utilities/app_utils.dart';
import '../core/utilities/storage.dart';
import '../core/utilities/utilities.dart';
import '../router/app_routes.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    init();
  }
  UserModel? get userDetail => _userDetail;
  set userDetail(UserModel? value) {
    _userDetail = value;
    notifyListeners();
  }

  UserModel? _userDetail;

  StreamSubscription<User?>? _userSubscription;

  final userCol = FirebaseFirestore.instance.collection('users');

  void init() {
    _userSubscription = FirebaseAuth.instance.userChanges().listen((event) {
      AppLogger.print(event, tag: 'userChanges');
      if (event == null) {
        userDetail = null;
      } else {
        userDetail = UserModel(
          uid: event.uid,
          displayName: event.displayName,
          email: event.email,
          imagePath: event.photoURL,
        );
      }
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

  void logout(BuildContext context) async {
    try {
      AppUtils.showLoading();
      await FirebaseAuth.instance.signOut();
      AppRouter.router.refresh();
    } catch (e) {
      AppLogger.print(e);
    } finally {
      AppUtils.hideLoading();
    }
  }

  void editProfile() async {
    AppUtils.showLoading();

    Completer? completer;

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

        completer = Completer();

        result.snapshotEvents.listen((event) async {
          AppLogger.print('$event', tag: 'Upload image');
          switch (event.state) {
            case TaskState.running:
              break;
            case TaskState.success:
              final path = await event.ref.getDownloadURL();
              await FirebaseAuth.instance.currentUser?.updatePhotoURL(path);

              final userResult = await userCol
                  .where(
                    'uid',
                    whereIn: [userDetail?.uid],
                  )
                  .withConverter(
                    fromFirestore: (snapshot, options) => UserModel.fromJson(
                      snapshot.data(),
                    ),
                    toFirestore: (snapshot, options) => snapshot.toJson(),
                  )
                  .get();

              assert(
                userResult.docs.length == 1,
                throw 'Found more than one user id exits ${userResult.docs.length}',
              );

              await userCol.doc(userResult.docs.first.id).update(
                    userDetail?.copyWith(imagePath: path).toJson() ?? {},
                  );
              completer?.complete();
              break;
            case TaskState.error:
            case TaskState.canceled:
            case TaskState.paused:
              completer?.complete();
              AppUtils.showToast(
                event.state.toString(),
              );
          }
        }, onError: (e) {
          AppUtils.showToast(e.toString());
        });
      } catch (e) {
        AppUtils.showToast(e.toString());
      }
    }
    await completer?.future;

    AppUtils.hideLoading();
  }
}
