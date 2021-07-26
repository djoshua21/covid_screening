import 'package:covid_screening_app/src/app.dart';
import 'package:covid_screening_app/src/locator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  await Firebase.initializeApp();
  runApp(App());
}
