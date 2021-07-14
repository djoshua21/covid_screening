import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/app.dart';
import 'package:haefele_health_app/src/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(App());
}
