import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/config.dart';
import 'providers/app_provider.dart';
import 'router/app_routes.dart';
import 'widgets/commons/loading_widget.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          backButtonDispatcher: RootBackButtonDispatcher(),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: AppTheme.themeMode,
          debugShowCheckedModeBanner: false,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routerDelegate: AppRouter.router.routerDelegate,
          builder: (context, child) {
            return Overlay(
              initialEntries: [
                OverlayEntry(
                  builder: (_) => AppBuilder(
                    child: child!,
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}

class AppBuilder extends StatelessWidget {
  const AppBuilder({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MediaQuery.withNoTextScaling(
        child: ChangeNotifierProvider(
          create: (context) => AppProvider(),
          builder: (context, child) {
            return Stack(
              children: [
                child!,
                Selector<AppProvider, bool>(
                  selector: (context, value) {
                    return value.loading;
                  },
                  builder: (context, value, child) {
                    if (value) return child!;
                    return const SizedBox();
                  },
                  child: const ColoredBox(
                    color: Colors.black54,
                    child: LoadingWidget(),
                  ),
                )
              ],
            );
          },
          child: child,
        ),
      ),
    );
  }
}
