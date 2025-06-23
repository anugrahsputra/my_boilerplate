import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/di.dart';

import 'app.dart';

Future<void> appInitialize() async {
  AppLogging.initialize(showLog: true);
  Bloc.observer = AppBlocObserver();
  await setup();

  runApp(MyApp());
}