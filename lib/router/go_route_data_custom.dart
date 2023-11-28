part of 'app_routes.dart';

class GoRouteDataCustom extends GoRouteData {
  const GoRouteDataCustom();

  final needAuthentication = true;

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    if (FirebaseAuth.instance.currentUser == null && needAuthentication) {
      return const LoginRoute().location;
    }
    return null;
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      fullscreenDialog: true,
      child: build(context, state),
      transitionsBuilder: (contest, animation, secondaryAnimation, child) {
        return CupertinoPageTransition(
          key: state.pageKey,
          linearTransition: true,
          primaryRouteAnimation: animation,
          secondaryRouteAnimation: secondaryAnimation,
          child: child,
        );
      },
    );
  }
}
