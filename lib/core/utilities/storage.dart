import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  static final storage = FirebaseStorage.instance;

  static Reference get userPhotoImage =>
      storage.ref('user_storage/photo_image');

  static UploadTask uploadUserImage(String userId, String filePath) {
    return userPhotoImage.child(userId).putFile(File(filePath));
  }
}
