import 'package:flutter/material.dart';
import 'package:covid_screening_app/src/ui/router.dart';
import 'package:covid_screening_app/src/ui/shared/theme.dart';
import 'package:covid_screening_app/src/ui/views/views.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(),
      onGenerateRoute: AppRouter.generateRoute,
      theme: AppTheme.themeData,
    );
  }
}
