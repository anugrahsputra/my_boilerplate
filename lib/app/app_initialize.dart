import 'dart:async';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:my_boilerplate/app/app.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/di.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';

/// Initialize the app
Future<void> appInitialize() async {
  unawaited(AppLogging.initialize(showLog: true));
  await setup();

  // Listen for isolate errors too
  Isolate.current.addErrorListener(
    RawReceivePort((List<dynamic> pair) async {
      final errorAndStacktrace = pair;
      final error = errorAndStacktrace.first;
      final stack = errorAndStacktrace.last;
      await Sentry.captureException(
        error,
        stackTrace: stack is StackTrace ? stack : null,
      );
    }).sendPort,
  );

  await SentryFlutter.init(
    (options) {
      options
        ..dsn =
            'https://ab1e53778899db2e6b6bd7ae324577f1@o4508516549984256.ingest.us.sentry.io/4509677872152576'
        ..sendDefaultPii = true
        ..tracesSampleRate = 1.0
        ..profilesSampleRate = 1.0
        ..enableLogs = true
        ..captureFailedRequests = true
        ..addIntegration(LoggingIntegration());
    },
    // Keep runApp inside the same zone
    appRunner: () => runApp(SentryWidget(child: const MyApp())),
  );
}
