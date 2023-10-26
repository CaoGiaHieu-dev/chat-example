import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/utilities/utilities.dart';

class ChatLobbyProvider extends ChangeNotifier {
  ChatLobbyProvider() {
    init();
  }

  final user = FirebaseAuth.instance.currentUser;
  void init() {
    for (final providerProfile in user?.providerData ?? []) {
      // ID of the provider (google.com, apple.cpm, etc.)
      // final provider = providerProfile.providerId;

      // // UID specific to the provider
      // final uid = providerProfile.uid;

      // // Name, email address, and profile photo URL
      // final name = providerProfile.displayName;
      // final emailAddress = providerProfile.email;
      // final profilePhoto = providerProfile.photoURL;

      AppLogger.print(providerProfile);
    }
  }
}
