import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../core/extensions/context_extension.dart';
import '../core/models/chat/message_in_room.dart';
import '../providers/chat_room_provider.dart';
import '../router/extra/chat_room_extra.dart';
import '../widgets/commons/refresh_sticky.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({super.key, required this.extra});
  final ChatRoomExtra extra;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          extra.username,
        ),
        toolbarHeight: 40.h,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: Column(
          children: [
            Expanded(
              child: RefreshSticky(
                reverse: true,
                size: 50.h,
                moveToFirstAfterComplete: true,
                onRefresh: () {
                  context.read<ChatRoomProvider>().refreshChat();
                },
                builder: (BuildContext context, ScrollController controller) {
                  return AnimatedList(
                    key: context.read<ChatRoomProvider>().animateListKey,
                    reverse: true,
                    controller: controller,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index, animation) {
                      bool isSender = context
                          .read<ChatRoomProvider>()
                          .messageHistories[index]
                          .isSender;

                      return FadeTransition(
                        alwaysIncludeSemantics: true,
                        opacity: animation,
                        child: Align(
                          alignment: isSender
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: UnconstrainedBox(
                            child: Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              constraints: BoxConstraints(
                                minHeight: 50.h,
                                maxWidth: context.width * 2 / 3,
                              ),
                              margin: EdgeInsets.only(top: 10.h),
                              child: Align(
                                alignment: Alignment.centerRight,
                                widthFactor: 1,
                                child: Text(
                                  context
                                      .read<ChatRoomProvider>()
                                      .messageHistories[index]
                                      .message,
                                  textAlign: isSender
                                      ? TextAlign.right
                                      : TextAlign.left,
                                  style: context.bodyMedium.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller:
                        context.read<ChatRoomProvider>().inputController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    minLines: 1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<ChatRoomProvider>().onSend();
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
