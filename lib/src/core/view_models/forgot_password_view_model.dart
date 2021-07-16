import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/core/constants/constants.dart';
import 'package:haefele_health_app/src/core/services/auth_service.dart';
import 'package:haefele_health_app/src/locator.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();

  void resetPassword(BuildContext ctx, String email) async {
    try {
      await _authService.resetPassword(email);
      showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
          title: Text('Password Reset'),
          content: Text(
              'An email has been sent with a link to change you password.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text("Okay"))
          ],
        ),
      );

      Navigator.of(ctx).pushReplacementNamed(RoutePaths.login);
    } catch (error) {
      var errorMessage = 'Password Reset Failed';
      if (error.code == 'user-not-found') {
        errorMessage = 'No user found with that email.';
      } else if (error.code == 'invalid-email') {
        errorMessage = 'Invalid email Address';
      }
      await showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
          title: Text('An Error Occurred'),
          content: Text(errorMessage),
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
  }
}
