import 'package:flutter_example_app/src/app/app.dart';
import 'package:flutter_example_app/src/utils/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Environment.flavor = EnvironmentFlavor.prod;

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    const ExampleApp(),
  );
}
