import 'package:flutter/material.dart';
import 'package:my_boilerplate/app/app_initialize.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appInitialize();
}