part of config;

class AppTheme {
  AppTheme._();

  static ThemeMode themeMode = ThemeMode.light;

  static ThemeData themeData(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        primaryColor: colorScheme.primary,
        colorScheme: colorScheme,
        brightness: colorScheme.brightness,
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

  static TextTheme textThemeScale(TextTheme textTheme) => textTheme.copyWith(
        labelSmall: textTheme.labelSmall?.copyWith(
          fontSize: textTheme.labelSmall?.fontSize?.sp,
        ),
        labelMedium: textTheme.labelMedium?.copyWith(
          fontSize: textTheme.labelMedium?.fontSize?.sp,
        ),
        labelLarge: textTheme.labelLarge?.copyWith(
          fontSize: textTheme.labelLarge?.fontSize?.sp,
        ),
        bodySmall: textTheme.bodySmall?.copyWith(
          fontSize: textTheme.bodySmall?.fontSize?.sp,
        ),
        bodyMedium: textTheme.bodyMedium?.copyWith(
          fontSize: textTheme.bodyMedium?.fontSize?.sp,
        ),
        bodyLarge: textTheme.bodyLarge?.copyWith(
          fontSize: textTheme.bodyLarge?.fontSize?.sp,
        ),
        titleSmall: textTheme.titleSmall?.copyWith(
          fontSize: textTheme.titleSmall?.fontSize?.sp,
        ),
        titleMedium: textTheme.titleMedium?.copyWith(
          fontSize: textTheme.titleMedium?.fontSize?.sp,
        ),
        titleLarge: textTheme.titleLarge?.copyWith(
          fontSize: textTheme.titleLarge?.fontSize?.sp,
        ),
        displaySmall: textTheme.displaySmall?.copyWith(
          fontSize: textTheme.displaySmall?.fontSize?.sp,
        ),
        displayMedium: textTheme.displayMedium?.copyWith(
          fontSize: textTheme.displayMedium?.fontSize?.sp,
        ),
        displayLarge: textTheme.displayLarge?.copyWith(
          fontSize: textTheme.displayLarge?.fontSize?.sp,
        ),
        headlineSmall: textTheme.headlineSmall?.copyWith(
          fontSize: textTheme.headlineSmall?.fontSize?.sp,
        ),
        headlineMedium: textTheme.headlineMedium?.copyWith(
          fontSize: textTheme.headlineMedium?.fontSize?.sp,
        ),
        headlineLarge: textTheme.headlineLarge?.copyWith(
          fontSize: textTheme.headlineLarge?.fontSize?.sp,
        ),
      );

  static ThemeData get lightTheme {
    const colorScheme = ColorScheme.light();
    final textTheme = themeData(colorScheme).textTheme;

    return themeData(colorScheme).copyWith(
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
      textTheme: textThemeScale(textTheme),
    );
  }

  static ThemeData get darkTheme {
    const colorScheme = ColorScheme.dark();
    final textTheme = themeData(colorScheme).textTheme;

    return themeData(colorScheme).copyWith(
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
      textTheme: textThemeScale(textTheme),
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
