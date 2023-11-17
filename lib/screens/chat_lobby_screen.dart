import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../core/extensions/context_extension.dart';
import '../core/models/user/user_model.dart';
import '../providers/chat_lobby_provider.dart';
import '../router/app_routes.dart';
import '../router/extra/chat_room_extra.dart';
import '../widgets/commons/refresh_sticky.dart';

class ChatLobbyScreen extends StatelessWidget {
  const ChatLobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Contacts',
          style: context.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: RefreshSticky(
            onRefresh: () async {
              await context.read<ChatLobbyProvider>().fetchUserList();
            },
            builder: (context, controller) {
              return Consumer<ChatLobbyProvider>(
                builder: (context, value, _) {
                  final userList = value.userList;
                  return ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: controller,
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      final item = userList[index];
                      return MaterialButton(
                        padding: EdgeInsets.all(10.r),
                        onPressed: () {
                          context
                              .read<ChatLobbyProvider>()
                              .jonChatRoom(context, item);
                        },
                        child: Row(
                          children: [
                            item.imagePath != null
                                ? CircleAvatar(
                                    radius: 30.r,
                                    foregroundImage:
                                        NetworkImage(item.imagePath!),
                                  )
                                : Icon(
                                    Icons.person,
                                    color: Colors.black,
                                    size: 60.r,
                                  ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: IntrinsicHeight(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${item.displayName ?? item.email}',
                                        style: context.bodyLarge.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Cao Gia Hiếu 1',
                                        style: context.bodyMedium.copyWith(
                                          color: Colors.black45,
                                        ),
                                        maxLines: 1,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 5.h);
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
