import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../gen/assets.gen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    required this.navigationShell,
    required this.children,
  });
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final PageController controller;
  @override
  void initState() {
    controller = PageController(
      initialPage: widget.navigationShell.currentIndex,
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant DashboardScreen oldWidget) {
    controller.animateToPage(
      widget.navigationShell.currentIndex,
      duration: kThemeAnimationDuration,
      curve: Easing.linear,
    );
    super.didUpdateWidget(oldWidget);
  }

  void _changeIndex(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          itemCount: widget.children.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
              ),
              child: widget.children[index],
            );
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _DashboardItem(
              onPressed: () {
                _changeIndex(0);
              },
              deactivateAssetPath: Assets.iconsHome.path,
              activateAssetPath: Assets.iconsHomeActivate.path,
              isActive: widget.navigationShell.currentIndex == 0,
            ),
            _DashboardItem(
              onPressed: () {
                _changeIndex(1);
              },
              deactivateAssetPath: Assets.iconsChat.path,
              activateAssetPath: Assets.iconsChatActivate.path,
              isActive: widget.navigationShell.currentIndex == 1,
            ),
            _DashboardItem(
              onPressed: () {
                _changeIndex(2);
              },
              deactivateAssetPath: Assets.iconsUser.path,
              activateAssetPath: Assets.iconsUserActivate.path,
              isActive: widget.navigationShell.currentIndex == 2,
            ),
          ],
        ),
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
    ).svg(
      height: 30.h,
      width: 30.w,
    );

    return Expanded(
      child: SizedBox.square(
        child: IconButton(
          onPressed: onPressed,
          icon: child,
        ),
      ),
    );
  }
}
