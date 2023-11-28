import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/models/user/user_model.dart';
import '../router/app_routes.dart';
import '../router/extra/chat_room_extra.dart';

class ChatLobbyProvider extends ChangeNotifier {
  ChatLobbyProvider() {
    init();
  }

  final userCol = FirebaseFirestore.instance.collection('users');

  final userList = <UserModel>[];

  void init() {
    fetchUserList();
  }

  Future<void> fetchUserList() async {
    final userResult = await userCol
        .where(
          'uid',
          whereNotIn: [FirebaseAuth.instance.currentUser?.uid],
        )
        .withConverter(
          fromFirestore: (snapshot, options) =>
              UserModel.fromJson(snapshot.data()),
          toFirestore: (value, options) => value.toJson(),
        )
        .get();

    userList
      ..clear()
      ..addAll(
        userResult.docs.map(
          (e) => e.data(),
        ),
      );

    notifyListeners();
  }

  void jonChatRoom(BuildContext context, UserModel withUser) {
    final roomIdGenerator = String.fromCharCodes(
      [
        ...?withUser.uid?.codeUnits,
        ...?FirebaseAuth.instance.currentUser?.uid.codeUnits,
      ]..sort((a, b) => a.compareTo(b)),
    );

    ChatRoomRoute(
      roomId: roomIdGenerator,
      $extra: ChatRoomExtra(
        withUser: withUser,
      ),
    ).go(context);
  }
}
