import 'dart:developer';

import 'package:logging/logging.dart';

const _fineColor = '\x1B[32m'; // Green
const _infoColor = '\x1B[33m'; // Yellow
const _severeColor = '\x1B[31m'; // Red
const _resetColor = '\x1B[0m'; // Reset

abstract class AppLogging {
  static bool isInitialize = false;

  static Future<void> initialize({bool showLog = false}) async {
    if (!AppLogging.isInitialize) {
      Logger.root.level = showLog ? Level.ALL : Level.OFF;

      Logger.root.onRecord.listen((record) {
        final level = record.level;
        final name = record.loggerName;
        final message = record.message;
        final stackTrace = record.stackTrace;
        final error = record.error;

        String levelColor;
        switch (level) {
          case Level.FINE:
          case Level.FINER:
          case Level.FINEST:
            levelColor = _fineColor;
          case Level.SEVERE:
          case Level.SHOUT:
          case Level.WARNING:
            levelColor = _severeColor;
          case Level.INFO:
          case Level.CONFIG:
            levelColor = _infoColor;
          default:
            levelColor = '';
        }

        final formattedMessage =
            '$levelColor[${level.name}] : $message$_resetColor';
        final errorString = error != null ? '\nError : $error' : '';
        final stackTraceString = stackTrace != null ? '\n$stackTrace' : '';

        // Send to Android logcat / system console
        log(formattedMessage + errorString + stackTraceString, name: name);

        // Also print to terminal (Neovim, CLI, etc.)
      });

      AppLogging.isInitialize = true;
    }
  }
}
