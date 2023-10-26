part of config;

class AppTheme {
  AppTheme._();

  static ThemeMode themeMode = ThemeMode.light;

  static ThemeData get lightTheme {
    ColorScheme colorScheme = const ColorScheme.light();

    final themeData = ThemeData(
      useMaterial3: true,
      primaryColor: colorScheme.primary,
      colorScheme: colorScheme,
      brightness: colorScheme.brightness,
      dialogTheme: DialogTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          letterSpacing: 0.04.sp,
        ),
        centerTitle: false,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: CustomPageTransitionBuilder(),
          TargetPlatform.iOS: CustomPageTransitionBuilder(),
        },
      ),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
          ),
          pickerTextStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
          ),
        ),
      ),
    );
    final TextTheme textTheme = GoogleFonts.expletusSansTextTheme.call();
    return themeData.copyWith(
      textTheme: textTheme.copyWith(
        labelLarge: textTheme.labelLarge!.copyWith(
          fontSize: 14.sp,
          letterSpacing: 0.04.sp,
        ),
        bodyLarge: textTheme.bodyLarge!.copyWith(
          fontSize: 14.sp,
          letterSpacing: 0.04.sp,
        ),
        bodyMedium: textTheme.bodyMedium!.copyWith(
          fontSize: 14.sp,
          letterSpacing: 0.04.sp,
        ),
        titleMedium: textTheme.titleMedium!.copyWith(
          fontSize: 16.sp,
          letterSpacing: 0.04.sp,
        ),
        titleSmall: textTheme.titleSmall!.copyWith(
          fontSize: 16.sp,
          letterSpacing: 0.04.sp,
        ),
        bodySmall: textTheme.bodySmall!.copyWith(
          fontSize: 12.sp,
          letterSpacing: 0.04.sp,
        ),
        labelSmall: textTheme.labelSmall!.copyWith(
          fontSize: 10.sp,
          letterSpacing: 0.04.sp,
        ),
        titleLarge: textTheme.titleLarge!.copyWith(
          fontSize: 20.sp,
          letterSpacing: 0.04.sp,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    ColorScheme colorScheme = const ColorScheme.dark();

    final themeData = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: colorScheme.brightness,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: false,
      ),
    );
    final TextTheme textTheme = GoogleFonts.expletusSansTextTheme.call();
    return themeData.copyWith(
      textTheme: textTheme.copyWith(
        labelLarge: textTheme.labelLarge!.copyWith(
          fontSize: 14.sp,
        ),
        bodyLarge: textTheme.bodyLarge!.copyWith(
          fontSize: 14.sp,
        ),
        bodyMedium: textTheme.bodyMedium!.copyWith(
          fontSize: 14.sp,
        ),
        titleMedium: textTheme.titleMedium!.copyWith(
          fontSize: 16.sp,
        ),
        titleSmall: textTheme.titleSmall!.copyWith(
          fontSize: 16,
        ),
        bodySmall: textTheme.bodySmall!.copyWith(
          fontSize: 12.sp,
        ),
        labelSmall: textTheme.labelSmall!.copyWith(
          fontSize: 10.sp,
        ),
        titleLarge: textTheme.titleLarge!.copyWith(
          fontSize: 20.sp,
        ),
      ),
    );
  }
}

class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  const CustomPageTransitionBuilder();
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final bool linearTransition = isPopGestureInProgress(route);
    return CupertinoPageTransition(
      primaryRouteAnimation: animation,
      secondaryRouteAnimation: secondaryAnimation,
      linearTransition: linearTransition,
      child: child,
    );
  }

  static bool isPopGestureInProgress(PageRoute<dynamic> route) {
    return route.navigator!.userGestureInProgress;
  }
}
