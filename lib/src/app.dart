import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/ui/router.dart';
import 'package:haefele_health_app/src/ui/shared/theme.dart';
import 'package:haefele_health_app/src/ui/views/views.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked/stacked.dart';

import 'ui/views/auth/login_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? CircularProgressIndicator()
                : LoginView(),
      ),
      onGenerateRoute: AppRouter.generateRoute,
      theme: AppTheme.themeData,
    );
  }
}
