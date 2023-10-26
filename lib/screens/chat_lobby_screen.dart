import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/extensions/context_extension.dart';
import '../router/app_routes.dart';
import '../router/extra/chat_room_extra.dart';

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
          child: ListView.separated(
            itemCount: 100,
            itemBuilder: (context, index) {
              return MaterialButton(
                padding: EdgeInsets.all(10.r),
                onPressed: () {
                  ChatRoomRoute(
                    $extra: ChatRoomExtra(
                      username: 'Cao Gia Hiếu $index',
                    ),
                  ).push(context);
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      foregroundImage: const NetworkImage(
                        'https://picsum.photos/seed/picsum/200/300',
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'Cao Gia Hiếu $index',
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
          ),
        ),
      ],
    );
  }
}
