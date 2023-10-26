import 'dart:developer' as developer;

import '../config.dart';

class AppLogger {
  AppLogger._();
  static void print(dynamic msg, {String? tag}) {
    final buffer = StringBuffer();

    buffer.writeln(
        '👇🏻┌------------------------------------------------------------------------------👨🏻‍💻\n');
    buffer.writeln('$msg');
    buffer.writeln(
        '\n👆🏻┌------------------------------------------------------------------------------👨🏻‍💻');

    developer.log(
      buffer.toString(),
      name: tag ?? AppConfig.title,
    );
  }
}
