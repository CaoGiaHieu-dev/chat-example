import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../gen/assets.gen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    required this.child,
  });
  final StatefulNavigationShell child;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final currentIndex = ValueNotifier(0);

  @override
  void initState() {
    currentIndex.value = widget.child.currentIndex;
    super.initState();
  }

  void _changeIndex(int index) {
    currentIndex.value = index;

    widget.child.goBranch(
      index,
      initialLocation: index == widget.child.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          child: widget.child,
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: ValueListenableBuilder(
            valueListenable: currentIndex,
            builder: (context, index, _) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _DashboardItem(
                    onPressed: () {
                      _changeIndex(0);
                    },
                    deactivateAssetPath: Assets.iconsHome.path,
                    activateAssetPath: Assets.iconsHomeActivate.path,
                    isActive: index == 0,
                  ),
                  _DashboardItem(
                    onPressed: () {
                      _changeIndex(1);
                    },
                    deactivateAssetPath: Assets.iconsChat.path,
                    activateAssetPath: Assets.iconsChatActivate.path,
                    isActive: index == 1,
                  ),
                  _DashboardItem(
                    onPressed: () {
                      _changeIndex(2);
                    },
                    deactivateAssetPath: Assets.iconsUser.path,
                    activateAssetPath: Assets.iconsUserActivate.path,
                    isActive: index == 2,
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class _DashboardItem extends StatelessWidget {
  const _DashboardItem({
    required this.onPressed,
    required this.deactivateAssetPath,
    required this.activateAssetPath,
    required this.isActive,
  });
  final VoidCallback onPressed;
  final String deactivateAssetPath;
  final String activateAssetPath;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final child = SvgGenImage(
      isActive ? activateAssetPath : deactivateAssetPath,
    ).svg();

    return Expanded(
      child: SizedBox.square(
        dimension: 40.r,
        child: IconButton(
          onPressed: onPressed,
          icon: child,
        ),
      ),
    );
  }
}
