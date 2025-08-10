import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/di.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';

import 'app.dart';

Future<void> appInitialize() async {
  AppLogging.initialize(showLog: true);
  Bloc.observer = AppBlocObserver();
  await setup();

  await SentryFlutter.init((options) {
    options.dsn =
        'https://ab1e53778899db2e6b6bd7ae324577f1@o4508516549984256.ingest.us.sentry.io/4509677872152576';
    options.sendDefaultPii = true;
    options.tracesSampleRate = 1.0;
    options.profilesSampleRate = 1.0;
    options.enableLogs = true;
    options.captureFailedRequests = true;
    options.addIntegration(LoggingIntegration());
  }, appRunner: () => runApp(SentryWidget(child: MyApp())));
}
