import 'package:flutter/material.dart';
import 'package:covid_screening_app/src/core/services/auth_service.dart';
import 'package:covid_screening_app/src/locator.dart';
import 'package:stacked/stacked.dart';

import '../constants/constants.dart';

class LoginViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();

  void _showErrorDialog(BuildContext ctx, String message) {
    showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred'),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("Okay"))
        ],
      ),
    );
  }

  Future<void> handleLogin(
      BuildContext ctx, String email, String password) async {
    setBusy(true);
    try {
      await _authService.login(email, password);
      Navigator.of(ctx).pushReplacementNamed(RoutePaths.dashboard);
    } catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.code == 'user-not-found') {
        errorMessage = 'No user found with that email.';
      } else if (error.code == 'wrong-password') {
        errorMessage = 'Incorrect Password';
      }
      _showErrorDialog(ctx, errorMessage);
    }
    setBusy(false);
  }
}
