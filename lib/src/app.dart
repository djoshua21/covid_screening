import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/ui/router.dart';
import 'package:haefele_health_app/src/ui/shared/theme.dart';
import 'package:haefele_health_app/src/ui/views/views.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
      onGenerateRoute: AppRouter.generateRoute,
      theme: AppTheme.themeData,
    );
  }
}
