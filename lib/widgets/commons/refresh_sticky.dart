import 'dart:async';

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

  @override
  State<RefreshSticky> createState() => _RefreshStickyState();
}

class _RefreshStickyState extends State<RefreshSticky> {
  final loadingHeight = ValueNotifier(0.0);
  final loadingSize = ValueNotifier(0.0);
  final isStartLoading = ValueNotifier(false);

  Completer<void>? completer;

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
      loadingHeight.value = scroll.offset;
      loadingSize.value = scroll.offset / widget.size;
    } else if (scroll.offset >= 0) {
      loadingHeight.value = 0;
      loadingSize.value = 0;
    }
  }

  Future<void> startRefresh() async {
    if (scroll.offset > -widget.size) return;
    await updateScrollUpdateOffset(-widget.size);

    if (isStartLoading.value) return;
    isStartLoading.value = scroll.offset == -widget.size;

    WidgetsBinding.instance.endOfFrame.whenComplete(() async {
      completer = Completer();

      completer?.complete(widget.onRefresh());

      await completer?.future;
      completer = null;

      isStartLoading.value = false;

      if (widget.moveToFirstAfterComplete) {
        updateScrollUpdateOffset(0);
      } else {
        loadingHeight.value = 0;
        loadingSize.value = 0;
      }
    });
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
          height: height * -1,
          child: Center(
            child: ValueListenableBuilder<double>(
              valueListenable: loadingSize,
              builder: (context, size, _) {
                return Center(
                  child: ValueListenableBuilder<bool>(
                    valueListenable: isStartLoading,
                    builder: (context, isLoading, _) {
                      return AnimatedScale(
                        scale: size,
                        duration: Duration.zero,
                        child: isLoading
                            ? widget.loadingBuilder?.call(context) ??
                                const CircularProgressIndicator.adaptive()
                            : widget.preLoadingBuilder?.call(context) ??
                                const CircularProgressIndicator.adaptive(),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                if (!widget.reverse) _loading(),
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
                if (widget.reverse) _loading(),
              ],
            ),
          ),
        );
      },
    );
  }
}
