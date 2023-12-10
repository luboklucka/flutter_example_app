import 'package:flutter_example_app/src/app/app.dart';
import 'package:flutter_example_app/src/utils/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:developer' as developer;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  developer.log("Main DEV");

  Environment.flavor = EnvironmentFlavor.dev;

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // TODO: Do other initializations, e.g. analytics:
  // Analytics().initializeAmplitude();

  runApp(
    const ExampleApp(),
  );
}
