import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/extensions/context_extension.dart';
import '../gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final loadingHeight = ValueNotifier(0.0);
  final loadingSize = ValueNotifier(0.0);
  final isStartLoading = ValueNotifier(false);

  final scroll = ScrollController();

  @override
  void initState() {
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
        -50.h,
      );
      loadingSize.value = max(
        scroll.offset / 50.h,
        -1,
      );
    } else {
      loadingHeight.value = 0;
      loadingSize.value = 0;
    }
  }

  Future<void> startRefresh(Future<void> Function() onRefresh) async {
    if (scroll.offset > -50.h) return;
    await updateScrollUpdateOffset(-50.h);

    if (isStartLoading.value) return;
    isStartLoading.value = scroll.offset == -50.h;

    await WidgetsBinding.instance.endOfFrame;

    await onRefresh();

    isStartLoading.value = false;

    updateScrollUpdateOffset(0);
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
          color: Colors.white,
          duration: Duration.zero,
          height: height * -1,
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
                return child!;
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
    return Listener(
      onPointerUp: (_) {
        startRefresh(() async {
          await Future.delayed(const Duration(seconds: 2));
        });
      },
      child: CustomScrollView(
        controller: scroll,
        slivers: [
          SliverPersistentHeader(
            delegate: _Header(),
            floating: true,
          ),
          SliverToBoxAdapter(
            child: _loading(),
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
          SliverList.separated(
            itemCount: 100,
            itemBuilder: (context, index) {
              return const _FeedItem();
            },
            separatorBuilder: (BuildContext context, int index) {
              return const _DividerSpace();
            },
          )
        ],
      ),
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

class _FeedItem extends StatelessWidget {
  const _FeedItem();

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          'MasterClass',
                          style: context.titleSmall,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Expanded(
                      child: Text(
                        '9 giờ trước',
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
          child: const Text(
            '*Slaps top of trending* \nThis bad boy can fit so many "EZ mids" in it',
          ),
        ),
        Image.network(
          'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-6/405831898_901335371349016_3049660452037547597_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGdpXXgygN-5USlT1mnKVVQViFWoNjR46JWIVag2NHjoq74SlI4fFAsaLCkFpdkGyAQXKgdi4cbJyXVHlg884Nh&_nc_ohc=6cMQjx0gQVQAX8nlOU-&_nc_ht=scontent.fsgn2-4.fna&oh=00_AfATEM0YHqWFUQI_4sKMCG-84GSiCCGjTRBxDkR9CAjxTA&oe=656AC7F2',
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
              delegate: _PinnedNews(),
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
              'https://scontent.xx.fbcdn.net/v/t51.29350-10/404587986_987233915707400_6962653065384653598_n.jpg?stp=c0.5000x0.5000f_dst-webp_e15_p206x370_q70_tt1_u&efg=eyJ1cmxnZW4iOiJ1cmxnZW5fZnJvbV91cmwifQ&_nc_eui2=AeGxQ35GFGFMxcheqV8d4hGp5E7wLLhIXELkTvAsuEhcQpgrxyudjtP3U4TVcSeW14D1Kb9L28p2IfqVqPl_a4yB&_nc_cid=0&_nc_ad=z-m&_nc_rml=0&_nc_ht=scontent.fhan3-1.fna&_nc_cat=102&_nc_ohc=ALL9ydmbAeUAX_GAp8j&ccb=1-7&_nc_sid=869369&oh=00_AfCJemySCzkOjW-gK2Hb0THfriydmxeMfD6c9UOmgmh5aQ&oe=65698FCB&_nc_fr=fhan3c01',
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
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final ratio =
            (constraints.maxHeight - shrinkOffset) / constraints.maxHeight;
        return UnconstrainedBox(
          child: RawMaterialButton(
            elevation: 0,
            animationDuration: Duration.zero,
            fillColor: Colors.white,
            constraints: BoxConstraints(
              maxHeight: (constraints.maxHeight - shrinkOffset),
              maxWidth: max(maxExtent * ratio, 60.w),
            ),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r / ratio),
              side: BorderSide(width: 0.3.w),
            ),
            onPressed: () {},
            child: LayoutBuilder(
              builder: (context, stackConstraints) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          flex: 7,
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8.r / ratio),
                              bottom: ratio < 0.5
                                  ? Radius.circular(8.r / ratio)
                                  : Radius.zero,
                            ),
                            child: Image.network(
                              'https://scontent.xx.fbcdn.net/v/t39.30808-1/393271336_3526555080933066_5537505423868840512_n.jpg?stp=dst-jpg_p320x320&_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGXTJnVgcQJWaLgFYoiRj8QLAsCmBojki4sCwKYGiOSLqzv2h7xwT7FB3y9oDnwLxX2_HcLj-p2ulOnigLZdSDA&_nc_ohc=iTS5dhj3ejQAX84UTtS&_nc_ht=scontent.fhan3-3.fna&oh=00_AfCgc5hwWhe6OnGWpA9H6b2F4TF7pmhgb2DyJYloiOqfXA&oe=656AD9E0&_nc_fr=fhan3c03',
                              fit: BoxFit.fill,
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
                onPressed: () {},
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
