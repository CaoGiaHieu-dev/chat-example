import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../core/models/chat/message_in_room.dart';
import '../core/utilities/app_utils.dart';
import '../core/utilities/utilities.dart';

class ChatRoomProvider extends ChangeNotifier {
  ChatRoomProvider(this.roomId) {
    init();
  }

  final String roomId;

  final inputController = TextEditingController();
  final animateListKey = GlobalKey<AnimatedListState>();

  final ref = FirebaseDatabase.instance.ref("chat_room");

  final messageHistories = <MessageInRoom>[];

  StreamSubscription<DatabaseEvent>? _subscription;

  void init() {
    _subscription = ref.child(roomId).onValue.listen((event) {
      final data = (event.snapshot.value as List?)?.map(
        (e) {
          return MessageInRoom.fromJson(
            Map<String, dynamic>.from(e),
          );
        },
      ).toList();

      messageHistories.clear();

      animateListKey.currentState?.removeAllItems((context, animation) {
        return const SizedBox();
      });

      messageHistories.addAll(data ?? []);

      messageHistories.sort(
        (a, b) {
          return b.createAt?.compareTo(a.createAt ?? 0) ?? 0;
        },
      );

      AppLogger.print(messageHistories.map((e) => e.message).toList());

      for (var _ in messageHistories) {
        animateListKey.currentState?.insertItem(0, duration: Duration.zero);
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  Future<void> onSend() async {
    if (inputController.text.isEmpty) return;

    try {
      messageHistories.insert(
        0,
        senderMessage(inputController.text.trim()),
      );

      ref.child(roomId).set(
            messageHistories.map((e) => e.toJson()).toList(),
          );

      inputController.clear();
    } catch (e) {
      AppUtils.showToast(e.toString());
    }
  }

  Future<void> refreshChat() async {}

  MessageInRoom senderMessage(String message) {
    return MessageInRoom(
      message: message,
      senderId: FirebaseAuth.instance.currentUser?.uid ?? '',
      createAt: DateTime.now().millisecondsSinceEpoch,
    );
  }
}
