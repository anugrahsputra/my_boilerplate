import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_boilerplate/app/app_initialize.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  SentryWidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  await appInitialize();
}
