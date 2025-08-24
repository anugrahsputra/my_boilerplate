import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_boilerplate/app/app_initialize.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      // Important: bindings must be initialized INSIDE the zone
      SentryWidgetsFlutterBinding.ensureInitialized();
      // Init Hive / logging inside the same zone
      await Hive.initFlutter();
      await appInitialize();
    },
    (error, stackTrace) async {
      // Catch async uncaught errors
      await Sentry.captureException(error, stackTrace: stackTrace);
    },
  );
}
