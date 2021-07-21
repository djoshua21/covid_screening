import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/app.dart';
import 'package:haefele_health_app/src/locator.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  await Firebase.initializeApp();
  runApp(App());
}
