import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class RefreshSticky extends StatefulWidget {
  const RefreshSticky({
    super.key,
    required this.builder,
    required this.onRefresh,
    this.size = 50,
    this.loadingBuilder,
    this.preLoadingBuilder,
    this.controller,
    this.moveToFirstAfterComplete = false,
    this.reverse = false,
    this.scaleLoadingIcon = 1,
  });

  final Widget Function(
    BuildContext context,
    ScrollController controller,
  ) builder;

  final Future<void> Function() onRefresh;
  final double size;
  final WidgetBuilder? loadingBuilder;
  final WidgetBuilder? preLoadingBuilder;
  final ScrollController? controller;
  final bool moveToFirstAfterComplete;
  final bool reverse;
  final double scaleLoadingIcon;

  @override
  State<RefreshSticky> createState() => _RefreshStickyState();
}

class _RefreshStickyState extends State<RefreshSticky> {
  final loadingHeight = ValueNotifier(0.0);
  final loadingSize = ValueNotifier(0.0);
  final isStartLoading = ValueNotifier(false);

  late final ScrollController scroll;

  @override
  void initState() {
    scroll = widget.controller ?? ScrollController();

    WidgetsBinding.instance.endOfFrame.whenComplete(() {
      listenOnOffset();
    });

    super.initState();
  }

  @override
  void dispose() {
    scroll.removeListener(updateLoading);
    super.dispose();
  }

  void listenOnOffset() {
    scroll.removeListener(updateLoading);
    if (scroll.hasClients) {
      scroll.addListener(updateLoading);
    }
  }

  void updateLoading() async {
    if (isStartLoading.value) return;

    if (scroll.offset < 0) {
      loadingHeight.value = max(
        scroll.offset,
        -widget.size,
      );
      loadingSize.value = max(
        scroll.offset / widget.size,
        -widget.scaleLoadingIcon,
      );
    } else {
      loadingHeight.value = 0;
      loadingSize.value = 0;
    }
  }

  Future<void> startRefresh() async {
    if (scroll.offset > -widget.size) return;
    await updateScrollUpdateOffset(-widget.size);

    if (isStartLoading.value) return;
    isStartLoading.value = scroll.offset == -widget.size;

    await WidgetsBinding.instance.endOfFrame;

    await widget.onRefresh();
    isStartLoading.value = false;

    if (widget.moveToFirstAfterComplete) {
      updateScrollUpdateOffset(0);
    } else {
      loadingHeight.value = 0;
      loadingSize.value = 0;
    }
  }

  Future<void> updateScrollUpdateOffset(double offset) async {
    await scroll.animateTo(
      offset,
      duration: kThemeAnimationDuration,
      curve: Curves.linear,
    );
    updateLoading();
  }

  Widget _loading() {
    return ValueListenableBuilder<double>(
      valueListenable: loadingHeight,
      builder: (context, height, _) {
        if (height > 0) return const SizedBox();
        return AnimatedContainer(
          duration: Duration.zero,
          height: height * -widget.scaleLoadingIcon,
          alignment: Alignment.center,
          child: ValueListenableBuilder<double>(
            valueListenable: loadingSize,
            builder: (context, size, child) {
              return AnimatedScale(
                scale: size,
                duration: Duration.zero,
                child: child,
              );
            },
            child: ValueListenableBuilder<bool>(
              valueListenable: isStartLoading,
              builder: (context, isLoading, child) {
                return isLoading
                    ? widget.loadingBuilder?.call(context) ?? child!
                    : widget.preLoadingBuilder?.call(context) ?? child!;
              },
              child: const Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> child = [
      _loading(),
      Expanded(
        child: Listener(
          onPointerUp: (_) {
            startRefresh();
          },
          child: widget.builder.call(
            context,
            scroll,
          ),
        ),
      ),
    ];

    if (widget.reverse) {
      child = child.reversed.toList();
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Column(children: child),
          ),
        );
      },
    );
  }
}
