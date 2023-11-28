library config;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'theme.dart';

enum DarkOption { dynamic, alwaysOn, alwaysOff }

enum Flavor { dev, staging, prod }

class AppConfig {
  AppConfig._();
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    return 'Chat app';
  }

  static String get domain {
    return '127.0.0.1';
  }

  static String get port => '1999';

  static String get baseUrl {
    return 'http://$domain:$port';
  }

  static String get socket {
    return 'ws://$domain:$port/ws';
  }

  // static String get socketUrl {
  //   switch (appFlavor) {
  //     case Flavor.dev:
  //       return 'wss://$domain/socket';
  //     case Flavor.staging:
  //       return 'wss://$domain/socket';
  //     default:
  //       return 'wss://$domain/socket';
  //   }
  // }
}
