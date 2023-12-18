import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart'
    hide ClosedCaption;

import '../core/extensions/context_extension.dart';
import '../core/models/youtube_video/youtube_video_model.dart';
import '../gen/assets.gen.dart';
import '../providers/home_provider.dart';
import '../router/app_routes.dart';
import '../widgets/video_player_custom.dart/video_player_custom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeProvider>().getListVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        return Listener(
          onPointerUp: (_) {
            provider.startRefresh();
          },
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: provider.scroll,
            slivers: [
              SliverPersistentHeader(
                delegate: _Header(),
                floating: true,
              ),
              const SliverToBoxAdapter(
                child: _Loading(),
              ),
              const SliverToBoxAdapter(
                child: _StatusUpload(),
              ),
              const SliverToBoxAdapter(
                child: _DividerSpace(),
              ),
              const SliverToBoxAdapter(
                child: _Menu(),
              ),
              const SliverToBoxAdapter(child: _DividerSpace()),
              Selector<HomeProvider, YoutubeVideoModel?>(
                selector: (context, value) {
                  return value.resultYoutube;
                },
                builder: (context, value, _) {
                  if (value?.items?.isEmpty ?? true) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'There is no post yet',
                        ),
                      ),
                    );
                  }

                  return SliverList.separated(
                    itemCount: value?.items?.length,
                    itemBuilder: (context, index) {
                      return _FeedItem(
                        item: value?.items?[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const _DividerSpace();
                    },
                  );
                },
              ),
              Selector<HomeProvider, YoutubeVideoModel?>(
                selector: (context, value) {
                  return value.resultYoutube;
                },
                builder: (context, value, _) {
                  return SliverToBoxAdapter(
                    child: value?.nextPageToken?.isNotEmpty ?? false
                        ? SizedBox.square(
                            dimension: 50.r,
                            child: const CircularProgressIndicator.adaptive(),
                          )
                        : const Center(
                            child: Text('There is no more data'),
                          ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        return ValueListenableBuilder<double>(
          valueListenable: provider.loadingHeight,
          builder: (context, height, _) {
            if (height > 0) return const SizedBox();
            return AnimatedContainer(
              color: Colors.white,
              duration: Duration.zero,
              height: height * -1,
              alignment: Alignment.center,
              child: ValueListenableBuilder<double>(
                valueListenable: provider.loadingSize,
                builder: (context, size, child) {
                  return AnimatedScale(
                    scale: size,
                    duration: Duration.zero,
                    child: child,
                  );
                },
                child: ValueListenableBuilder<bool>(
                  valueListenable: provider.isStartLoading,
                  builder: (context, isLoading, child) {
                    return child!;
                  },
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _DividerSpace extends StatelessWidget {
  const _DividerSpace();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey,
      child: SizedBox(height: 5.h),
    );
  }
}

class _FeedItem extends StatefulWidget {
  const _FeedItem({this.item});

  final ItemsVideo? item;

  @override
  State<_FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<_FeedItem>
    with AutomaticKeepAliveClientMixin {
  final key = GlobalKey();
  final loading = ValueNotifier(true);

  VideoPlayerController? videoPlayerController;

  OverlayEntry? overlayEntry;

  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.whenComplete(() async {
      await initVideoState();
      loading.value = false;
      if (mounted) {
        context.read<HomeProvider>().scroll.addListener(autoPlay);
      }
    });

    super.initState();
  }

  @override
  void deactivate() {
    context.read<HomeProvider>().scroll.removeListener(autoPlay);
    super.deactivate();
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();

    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  void autoPlay() {
    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      videoPlayerController?.pause();
      return;
    }

    final offsetBox = renderBox.localToGlobal(Offset.zero);

    if (offsetBox.dy.isNaN || offsetBox.dx.isNaN) {
      videoPlayerController?.pause();
      return;
    }

    if (offsetBox.dy < 0) {
      videoPlayerController?.pause();
      return;
    }

    final centerTop = (context.height) - renderBox.size.height;

    if (offsetBox.dy > centerTop) {
      videoPlayerController?.pause();
      return;
    }

    videoPlayerController?.play();
  }

  Future<void> initVideoState() async {
    final yt = YoutubeExplode();
    if (widget.item?.id?.videoId == null) {
      return;
    }
    final streamInfo = await yt.videos.streamsClient.getManifest(
      widget.item?.id?.videoId,
    );
    videoPlayerController = VideoPlayerController.networkUrl(
      streamInfo.muxed.last.url,
    );
    yt.close();

    await videoPlayerController?.initialize();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h),
        SizedBox(
          height: 40.h,
          child: Row(
            children: [
              CircleAvatar(radius: 30.r),
              SizedBox(width: 5.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.item?.snippet?.channelTitle ?? '',
                          style: context.titleSmall,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Expanded(
                      child: Text(
                        DateFormat('hh:mm:ss dd-MM-yyyy').format(
                          DateTime.parse(
                            widget.item?.snippet?.publishTime ?? '',
                          ),
                        ),
                        style: context.labelMedium.copyWith(
                          color: Colors.grey.shade700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 5.w),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 5.h,
          ),
          child: Text(
            widget.item?.snippet?.title ?? '',
          ),
        ),
        SizedBox(
          height: 250.h,
          child: ValueListenableBuilder(
            valueListenable: loading,
            builder: (context, value, child) {
              if (value || videoPlayerController == null) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              return VideoPlayerCustom(
                controller: videoPlayerController!,
                bottomSheetBuildContext: AppRouter.currentContext,
                onFullScreenOptionTap: (value) async {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.landscapeLeft,
                    DeviceOrientation.landscapeRight
                  ]);
                  await Navigator.of(AppRouter.currentContext).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return VideoPlayerCustom(
                          controller: videoPlayerController!,
                          isFullScreen: true,
                          onFullScreenOptionTap: context.pop,
                        );
                      },
                    ),
                  );
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitDown,
                    DeviceOrientation.portraitUp
                  ]);
                },
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox.square(
                          dimension: 20.r,
                          child: Assets.iconsSmile.svg(),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '123',
                            style: context.bodySmall.copyWith(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '1 Bình luận',
                      style: context.bodySmall.copyWith(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 0,
                thickness: 0.3,
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: 16.r,
                          ),
                          SizedBox(width: 5.w),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Thích',
                                style: context.labelMedium,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.comment,
                            size: 16.r,
                          ),
                          SizedBox(width: 5.w),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Bình luận',
                                style: context.labelMedium,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.send,
                            size: 16.r,
                          ),
                          SizedBox(width: 5.w),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Gửi',
                                style: context.labelMedium,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
        ),
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(width: 10.r),
            ),
            SliverPersistentHeader(
              delegate: _PinnedNews(context: context),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: SizedBox(width: 10.r),
            ),
            SliverToBoxAdapter(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 100,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _MenuItem(
                    index: index,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10.w);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 0.5.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      onPressed: () {},
      child: Container(
        width: 120.w,
        height: double.infinity,
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          image: const DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(
              'https://picsum.photos/200/300',
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          child: Text(
            'User $index',
            maxLines: 2,
            style: context.bodyMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}

class _PinnedNews extends SliverPersistentHeaderDelegate {
  final BuildContext context;

  _PinnedNews({required this.context});
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Align(
      alignment: Alignment.centerLeft,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final ratio =
              (constraints.maxHeight - shrinkOffset) / constraints.maxHeight;
          final circleBorder = 8.r / ratio > 0 ? 8.r / ratio : 100;

          return UnconstrainedBox(
            child: RawMaterialButton(
              elevation: 0,
              animationDuration: Duration.zero,
              fillColor: Colors.white,
              constraints: BoxConstraints(
                maxHeight: max(constraints.maxHeight - shrinkOffset, 60.r),
                maxWidth: max(
                  minExtent * ratio,
                  60.r,
                ),
              ),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  circleBorder.toDouble() * (ratio < 0.5 ? 2 : 1),
                ),
                side: BorderSide(width: 0.3.w),
              ),
              onPressed: () {},
              child: LayoutBuilder(
                builder: (context, stackConstraints) {
                  return Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      Column(
                        children: [
                          Expanded(
                            flex: 7,
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(
                                  circleBorder.toDouble() *
                                      (ratio < 0.5 ? 2 : 1),
                                ),
                                bottom: ratio < 0.5
                                    ? Radius.circular(
                                        circleBorder.toDouble() * 2,
                                      )
                                    : Radius.zero,
                              ),
                              child: Image.network(
                                'https://picsum.photos/200/300',
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                          if (ratio > 0.5)
                            Expanded(
                              flex: 2,
                              child: Opacity(
                                opacity: ratio,
                                child: Center(
                                  child: Text(
                                    'Tạo tin',
                                    style: context.titleSmall,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      if (ratio < 0.5)
                        Positioned(
                          right: 0,
                          top: stackConstraints.maxHeight / 2 - 10.r / 2,
                          child: CircleAvatar(
                            radius: 10.r,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.add,
                              size: 20.r,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 120.w;

  @override
  double get minExtent => 120.w;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _StatusUpload extends StatelessWidget {
  const _StatusUpload();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 15.h,
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 20.r),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextButton(
                style: const ButtonStyle(
                  alignment: Alignment.centerLeft,
                  padding: MaterialStatePropertyAll(EdgeInsets.zero),
                ),
                onPressed: () {},
                child: Text(
                  'Bạn đang nghĩ gì ?',
                  style: context.bodyMedium.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.image_sharp,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox(
      height: double.infinity,
      child: PhysicalModel(
        color: context.background,
        elevation: overlapsContent ? 1 : 0,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Facebook',
                  style: context.headlineMedium.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              IconButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.grey.shade200,
                  ),
                ),
                padding: EdgeInsets.zero,
                onPressed: () {
                  context.read<HomeProvider>().gotoChat(context);
                },
                icon: const Icon(Icons.chat),
              ),
              IconButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.grey.shade200,
                  ),
                ),
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 50.h;

  @override
  double get minExtent => 50.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
