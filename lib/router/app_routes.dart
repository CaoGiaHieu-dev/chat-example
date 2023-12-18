import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/chat_lobby_provider.dart';
import '../providers/chat_room_provider.dart';
import '../providers/home_provider.dart';
import '../providers/login_provider.dart';
import '../providers/register_provider.dart';
import '../providers/user_provider.dart';
import '../screens/chat_lobby_screen.dart';
import '../screens/chat_room_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/user_screen.dart';
import 'extra/chat_room_extra.dart';
import 'extra/login_extra.dart';

part 'app_routes.g.dart';

part 'go_route_data_custom.dart';

class Routes {
  Routes._();

  static const register = '/register';
  static const login = '/login';

  static const home = '/home';
  static const chatLobby = '/chat-lobby';
  static const user = '/user';

  static const chatRoom = 'chat-room/:roomId';
}

class AppRouter {
  AppRouter._();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final homeNavigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get currentContext {
    final context = router.routerDelegate.navigatorKey.currentContext;
    if (context?.mounted ?? false) {
      return router.routerDelegate.navigatorKey.currentContext!;
    }
    throw FlutterError("AppRouter [currentContext] cannot null");
  }

  static String get currentRouterName {
    return AppRouter.router.routeInformationProvider.value.uri.toString();
  }

  static final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: Routes.home,
    routes: $appRoutes,
    redirect: (context, state) {
      return null;
    },
  );
}

@TypedGoRoute<LoginRoute>(
  path: Routes.login,
)
class LoginRoute extends GoRouteDataCustom {
  const LoginRoute({this.$extra});
  final LoginExtra? $extra;

  @override
  bool get needAuthentication => false;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(extra: $extra),
      builder: (context, child) {
        return const LoginScreen();
      },
    );
  }
}

@TypedGoRoute<RegisterRoute>(
  path: Routes.register,
)
class RegisterRoute extends GoRouteDataCustom {
  const RegisterRoute();

  @override
  bool get needAuthentication => false;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChangeNotifierProvider(
      create: (context) => RegisterProvider(),
      child: const RegisterScreen(),
    );
  }
}

@TypedStatefulShellRoute<DashboardRoute>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<HomeRoute>(
          path: Routes.home,
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ChatLobbyRoute>(
          path: Routes.chatLobby,
          routes: [
            TypedGoRoute<ChatRoomRoute>(
              path: Routes.chatRoom,
            )
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<UserRoute>(
          path: Routes.user,
        ),
      ],
    ),
  ],
)
class DashboardRoute extends StatefulShellRouteData {
  const DashboardRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return navigationShell;
  }

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatLobbyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: DashboardScreen(
        navigationShell: navigationShell,
        children: children,
      ),
    );
  }
}

class HomeRoute extends GoRouteDataCustom {
  const HomeRoute();

  static final $navigatorKey = AppRouter.homeNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class ChatLobbyRoute extends GoRouteDataCustom {
  const ChatLobbyRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ChatLobbyScreen();
  }
}

class UserRoute extends GoRouteDataCustom {
  const UserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Material(child: UserScreen());
  }
}

class ChatRoomRoute extends GoRouteDataCustom {
  const ChatRoomRoute({
    required this.roomId,
    required this.$extra,
  });

  final ChatRoomExtra $extra;
  final String roomId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChangeNotifierProvider(
      key: GlobalObjectKey(roomId),
      create: (context) => ChatRoomProvider(roomId),
      child: ChatRoomScreen(extra: $extra),
    );
  }
}
