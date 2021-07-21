import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/core/constants/constants.dart';
import 'package:haefele_health_app/src/core/services/auth_service.dart';
import 'package:haefele_health_app/src/locator.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();

  Future<void> isLoggedIn(BuildContext context) async {
    final user = _authService.currentUser;
    await Future.delayed(Duration(seconds: 1));
    if (user == null) {
      Navigator.of(context).pushReplacementNamed(RoutePaths.login);
    } else {
      Navigator.of(context).pushReplacementNamed(RoutePaths.dashboard);
    }
  }
}
