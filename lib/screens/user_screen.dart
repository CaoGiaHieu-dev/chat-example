import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../core/extensions/context_extension.dart';
import '../core/models/user/user_model.dart';
import '../providers/user_provider.dart';
import '../widgets/commons/refresh_sticky.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshSticky(
      onRefresh: context.read<UserProvider>().getUserDetail,
      builder: (BuildContext context, ScrollController controller) {
        final userDetail = context.select<UserProvider, UserModel?>(
          (value) {
            return value.userDetail;
          },
        );

        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: controller,
          child: Column(
            children: [
              userDetail?.imagePath?.isEmpty ?? true
                  ? Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 150.r,
                    )
                  : DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            userDetail?.imagePath ?? '',
                          ),
                          onError: (exception, stackTrace) {},
                        ),
                      ),
                      child: SizedBox.square(
                        dimension: 150.r,
                      ),
                    ),
              SizedBox(height: 10.h),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: const BorderSide(),
                ),
                color: context.background,
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 5.h,
                ),
                onPressed: () {
                  context.read<UserProvider>().editProfile();
                },
                child: Text(
                  'Chỉnh sửa thông tin',
                  style: context.bodyLarge,
                ),
              ),
              SizedBox(height: 10.h),
              _DetailField(
                title: 'Email Display',
                content: userDetail?.email ?? '',
              ),
              SizedBox(height: 10.h),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: const BorderSide(),
                ),
                color: context.background,
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 5.h,
                ),
                onPressed: () {
                  context.read<UserProvider>().logout(context);
                },
                child: Text(
                  'Logout',
                  style: context.bodyLarge,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DetailField extends StatelessWidget {
  const _DetailField({
    required this.title,
    required this.content,
  });
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: context.titleMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            content,
            style: context.bodyMedium,
          )
        ],
      ),
    );
  }
}
