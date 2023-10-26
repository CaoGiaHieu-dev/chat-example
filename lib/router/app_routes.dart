import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/chat_lobby_provider.dart';
import '../providers/chat_room_provider.dart';
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

final _navigatorKey = GlobalKey<NavigatorState>();

class Routes {
  Routes._();

  static const register = '/register';
  static const login = '/login';
  static const home = '/home';
  static const chatLobby = '/chat-lobby';
  static const user = '/user';
  static const chatRoom = '/chat-room';
}

class AppRouter {
  AppRouter._();

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
    navigatorKey: _navigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: Routes.home,
    routes: $appRoutes,
  );
}

@TypedGoRoute<LoginRoute>(
  path: Routes.login,
)
class LoginRoute extends GoRouteData {
  const LoginRoute({this.$extra});
  final LoginExtra? $extra;

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
class RegisterRoute extends GoRouteData {
  const RegisterRoute();

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
          lazy: true,
        ),
      ],
      child: DashboardScreen(child: navigationShell),
    );
  }
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class ChatLobbyRoute extends GoRouteData {
  const ChatLobbyRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChangeNotifierProvider(
      create: (context) => ChatLobbyProvider(),
      lazy: true,
      child: const ChatLobbyScreen(),
    );
  }
}

class UserRoute extends GoRouteData {
  const UserRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: const UserScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return CupertinoPageTransition(
          primaryRouteAnimation: animation,
          secondaryRouteAnimation: secondaryAnimation,
          linearTransition: true,
          child: child,
        );
      },
    );
  }
}

@TypedGoRoute<ChatRoomRoute>(
  path: Routes.chatRoom,
)
class ChatRoomRoute extends GoRouteData {
  const ChatRoomRoute({required this.$extra});

  final ChatRoomExtra $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChangeNotifierProvider(
      create: (context) => ChatRoomProvider(),
      lazy: true,
      child: ChatRoomScreen(extra: $extra),
    );
  }
}
