import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/core/constants/constants.dart';
import 'package:haefele_health_app/src/core/services/auth_service.dart';
import 'package:haefele_health_app/src/locator.dart';

class DashBoardView extends StatelessWidget {
  final AuthService _authService = locator<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Logout'),
          // This is only here for testing purposes.
          onPressed: () {
            _authService.logout();
            Navigator.of(context).pushReplacementNamed(RoutePaths.login);
          },
        ),
      ),
    );
  }
}
